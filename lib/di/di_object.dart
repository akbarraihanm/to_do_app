import 'package:to_do_app/database/database.dart';
import 'package:to_do_app/features/main/di/di_object.dart';

class AppLocator {
  static void init() async {
    /// Init all locator
    DbLocator.init();
    await DbLocator.openBoxes();
    MainLocator.init();
  }
}