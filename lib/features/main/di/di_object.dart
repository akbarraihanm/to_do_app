import 'package:get/get.dart';
import 'package:to_do_app/features/main/data/data_source/main_local_data_source.dart';
import 'package:to_do_app/features/main/data/repository_impl/main_local_repository_impl.dart';
import 'package:to_do_app/features/main/data/service/main_local_service.dart';
import 'package:to_do_app/features/main/domain/repository/main_repository.dart';
import 'package:to_do_app/features/main/domain/use_case/main_use_case.dart';
import 'package:to_do_app/features/main/presentation/controller/main_controller.dart';

class MainLocator {
  static void init() {
    /// Register Service
    Get.put(MainLocalService());

    /// Register data source
    Get.lazyPut<MainLocalDataSource>(() => MainLocalDataSourceImpl(Get.find()));

    /// Register repository
    Get.lazyPut<MainLocalRepository>(() => MainLocalRepositoryImpl(Get.find()));

    /// Register use case
    Get.put(MainUseCase(Get.find()));

    /// Register controller
    Get.create(() => MainController(Get.find()));
  }
}