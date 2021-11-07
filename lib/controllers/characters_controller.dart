import 'package:get/get.dart';
import 'package:rickandmorty_app/dao/api/character_api.dart';
import 'package:rickandmorty_app/dao/models/character_model.dart';

class CharacterController extends GetxController {
  CharacterModel? characters = CharacterModel();
  var page = 1.obs;
  var isLoading = false.obs;

  void getCharacters(int page) async {
    isLoadingTrue();
    ApiCharacters api = ApiCharacters();
    api.getCharacters(page).then((characters){
      this.characters = characters;
      isLoadingFalse();
      update();
    });
  }

  void isLoadingTrue() {
    isLoading.value = true;
    update();
  }

  void isLoadingFalse() {
    isLoading.value = false;
  }

  void nextPage() {
    if (characters!.info!.pages! > page.value) {
      page.value++;
      getCharacters(page.value);  
    }
  }

  void previousPage() {
    if (page > 1) {
      page.value--;
      getCharacters(page.value); 
    } 
  }
}