import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/features/main/domain/entity/todo_entity.dart';

void main() {
  final entity = TodoEntity(status: 1, key: '', todo: '');
  test(
      'Given TodoEntity, '
      'When initialized '
      'Then it should return correct value', () {
    expect(entity.status, 1);
    expect(entity.key, '');
    expect(entity.todo, '');
  });
}