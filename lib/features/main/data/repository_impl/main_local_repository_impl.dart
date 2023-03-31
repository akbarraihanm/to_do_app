import 'package:flutter/material.dart';
import 'package:to_do_app/core/util/resource.dart';
import 'package:to_do_app/database/boxes/todo_box.dart';
import 'package:to_do_app/features/main/data/data_source/main_local_data_source.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';
import 'package:to_do_app/features/main/domain/entity/todo_entity.dart';
import 'package:to_do_app/features/main/domain/repository/main_repository.dart';
import 'package:to_do_app/features/main/mapper.dart';

class MainLocalRepositoryImpl implements MainLocalRepository {
  final MainLocalDataSource dataSource;

  MainLocalRepositoryImpl(this.dataSource);

  @override
  Future<Resource<int>> create(ToDoBox body) async {
    try {
      final data = await dataSource.create(body);
      return Resource.success(data);
    } catch (ex) {
      debugPrint("Error : $ex");
      return Resource.error("An error occurred");
    }
  }

  @override
  Future delete(ToDoBox body) async {
    try {
      return dataSource.delete(body);
    } catch (ex) {
      debugPrint("Error : $ex");
      return Resource.error("An error occurred");
    }
  }

  @override
  Future<Resource<Iterable<TodoEntity>>> getList() async {
    try {
      final data = await dataSource.getList();
      return Resource.success(data.map((e) => e.toEntity()).toList());
    } catch (ex) {
      debugPrint("Error : $ex");
      return Resource.error("An error occurred");
    }
  }

  @override
  Future<Resource<int>> update(MainBody body) async {
    try {
      final result = await dataSource.update(body);
      return Resource.success(result);
    } catch (ex) {
      debugPrint("Error : $ex");
      return Resource.error("An error occurred");
    }
  }

}