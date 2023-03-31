import 'package:hive/hive.dart';

part 'todo_box.g.dart';

@HiveType(typeId: 1)
class ToDoBox extends HiveObject {
  @HiveField(0)
  String? todo;
  @HiveField(1)
  DateTime? date;
  @HiveField(2, defaultValue: 0)
  int? status;
}