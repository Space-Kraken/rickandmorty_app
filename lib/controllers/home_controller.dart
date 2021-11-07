import 'package:get/get.dart';

class HomeController extends GetxController {
  var selection = 0.obs;

  void changeSelection(int index){
    selection.value = index;
  }
}