import 'package:to_do_app/core/util/resource.dart';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  var isLoading = false.obs;
  var isValid = false.obs;

  /// api handler
  var result = Resource<T>().obs;
}