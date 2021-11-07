import 'package:get/get.dart';
import 'package:rickandmorty_app/controllers/characters_controller.dart';
import 'package:rickandmorty_app/controllers/episodes_controller.dart';
import 'package:rickandmorty_app/controllers/home_controller.dart';

class AppBindings implements Bindings {
  
  @override
  void dependencies() {
    //Controllers definitions
    Get.put<HomeController>(HomeController());
    Get.put<CharacterController>(CharacterController());
    Get.put<EpisodeController>(EpisodeController());
  }
}