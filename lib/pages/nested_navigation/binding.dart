import 'package:get/get.dart';
import 'package:myapp/pages/nested_navigation/controller.dart';

class NestedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NestedController());
  }
}
