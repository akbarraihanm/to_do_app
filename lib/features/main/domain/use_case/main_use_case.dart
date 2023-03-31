import 'package:to_do_app/core/util/resource.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/domain/entity/todo_entity.dart';
import 'package:to_do_app/features/main/domain/repository/main_repository.dart';

class MainUseCase {
  final MainLocalRepository repository;

  MainUseCase(this.repository);

  Future<Resource<Iterable<TodoEntity>>> getList() {
    return repository.getList();
  }

  Future<Resource<int>> create(ToDoBox body) {
    return repository.create(body);
  }

  Future update(MainBody body) {
    return repository.update(body);
  }

  Future delete(ToDoBox body) {
    return repository.delete(body);
  }
}