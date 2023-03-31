import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/data_source/main_local_data_source.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/data/repository_impl/main_local_repository_impl.dart';
import 'package:to_do_app/features/main/domain/repository/main_repository.dart';

class MockDataSource extends Mock implements MainLocalDataSource {}

void main() {
  late MockDataSource dataSource;
  late MainLocalRepository repository;

  setUpAll(() {
    dataSource = MockDataSource();
    repository = MainLocalRepositoryImpl(dataSource);
  });

  Iterable<ToDoBox> iterable = [
    ToDoBox(),
  ];

  final body = ToDoBox();
  body.status = 1;
  body.todo = "";
  body.date = DateTime.parse("2020-01-01");

  final updateBody = MainBody(key: '', status: 1);

  group('MainLocalRepositoryImpl test', () {
    test(
        'Given MainLocalRepository, '
        'When get list '
        'Then it should return correct list', () async {
      when(() => dataSource.getList()).thenAnswer((_) async => iterable);

      final result = await repository.getList();
      expect(result, iterable);
    });

    test(
        'Given MainLocalRepository, '
        'When create to-do success '
        'Then it should return 1', () async {
      when(() => dataSource.create(body)).thenAnswer((_) async => 1);

      final result = await repository.create(body);
      expect(result, 1);
    });

    test(
        'Given MainLocalRepository, '
        'When update to-do success '
        'Then it should return 1', () async {
      when(() => dataSource.update(updateBody)).thenAnswer((_) async => 1);

      final result = await repository.update(updateBody);
      expect(result, 1);
    });
  });
}