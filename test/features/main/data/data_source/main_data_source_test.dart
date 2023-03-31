import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/data_source/main_local_data_source.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/data/service/main_local_service.dart';

class MockService extends Mock implements MainLocalService {}

void main() {
  late MainLocalDataSource dataSource;
  late MockService service;

  setUpAll(() {
    service = MockService();
    dataSource = MainLocalDataSourceImpl(service);
  });

  Iterable<ToDoBox> iterable = [
    ToDoBox(),
  ];

  final body = ToDoBox();
  body.status = 1;
  body.todo = "";
  body.date = DateTime.parse("2020-01-01");

  final updateBody = MainBody(key: '', status: 1);

  group('MainDataSource test', () {
    test(
        'Given MainDataSource, '
        'When get toDoBox, '
        'Then it should return correct list', () async {
      when(() => service.getList()).thenAnswer((_) async => iterable);

      final result = await dataSource.getList();
      expect(result, iterable);
    });

    test(
        'Given MainDataSource, '
        'When create to-do '
        'Then it should return 1', () async {
      when(() => service.create(body)).thenAnswer((_) async => 1);

      final result = await dataSource.create(body);
      expect(result, 1);
    });

    test(
        'Given MainDataSource, '
        'When update to-do '
        'Then it should return 1', () async {
      when(() => service.update(updateBody)).thenAnswer((_) async => 1);

      final result = await dataSource.update(updateBody);
      expect(result, 1);
    });
  });
}