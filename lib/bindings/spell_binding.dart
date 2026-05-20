import 'package:get/get.dart';
import '../controllers/spell_controller.dart';

class SpellBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpellController>(() => SpellController());
  }
}
