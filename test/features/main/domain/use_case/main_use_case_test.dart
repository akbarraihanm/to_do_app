import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_app/core/util/resource.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/domain/repository/main_repository.dart';
import 'package:to_do_app/features/main/domain/use_case/main_use_case.dart';
import 'package:to_do_app/features/main/mapper.dart';

class MockRepository extends Mock implements MainLocalRepository {}

void main() {
  late MockRepository repository;
  late MainUseCase useCase;

  setUpAll(() {
    repository = MockRepository();
    useCase = MainUseCase(repository);
  });

  Iterable<ToDoBox> iterable = [
    ToDoBox(),
  ];

  final body = ToDoBox();
  body.status = 1;
  body.todo = "";
  body.date = DateTime.parse("2020-01-01");

  final updateBody = MainBody(key: '', status: 1);

  group('MainUseCase test', () {
    test(
        'Given MainUseCase, '
        'When get list '
        'Then it should return correct data', () async {
      when(() => repository.getList()).thenAnswer((_) async {
        return Resource(iterable.map((e) => e.toEntity()).toList());
      });

      final result = await useCase.getList();
      expect(result, iterable);
    });

    test(
        'Given MainUseCase, '
        'When create to-do success '
        'Then it should return 1', () async {
      when(() => repository.create(body)).thenAnswer((_) async {
        return Resource(1);
      });

      final result = await useCase.create(body);
      expect(result, 1);
    });

    test(
        'Given MainUseCase, '
        'When update to-do success '
        'Then it should return 1', () async {
      when(() => repository.update(updateBody))
          .thenAnswer((_) async => Resource(1));

      final result = await useCase.update(updateBody);
      expect(result, 1);
    });
  });
}