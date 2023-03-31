import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/data/service/main_local_service.dart';

abstract class MainLocalDataSource {
  Future<Iterable<ToDoBox>> getList();
  Future<int> create(ToDoBox body);
  Future<int> update(MainBody body);
  Future delete(ToDoBox body);
}

class MainLocalDataSourceImpl implements MainLocalDataSource {
  final MainLocalService service;

  MainLocalDataSourceImpl(this.service);

  @override
  Future<int> create(ToDoBox body) {
    return service.create(body);
  }

  @override
  Future delete(ToDoBox body) {
    return service.delete(body);
  }

  @override
  Future<Iterable<ToDoBox>> getList() {
    return service.getList();
  }

  @override
  Future<int> update(MainBody body) {
    return service.update(body);
  }

}