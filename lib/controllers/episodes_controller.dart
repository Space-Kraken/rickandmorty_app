import 'package:get/get.dart';
import 'package:rickandmorty_app/dao/api/episode_api.dart';
import 'package:rickandmorty_app/dao/models/episode_model.dart';

class EpisodeController extends GetxController {
  EpisodeModel? episodes = EpisodeModel();
  var page = 1.obs;
  var isLoading = false.obs;

  void getEpisodes(int page) async {
    _isLoading(true);
    ApiEpisodes api = ApiEpisodes();
    api.getEpisodes(page).then((episodes){
      this.episodes = episodes;
      _isLoading(false);
      update();
    });
  }

  void _isLoading(bool state) {
    isLoading.value = state;
  }

  void nextPage() {
    if (episodes!.info!.pages! > page.value) {
      page.value++;
      getEpisodes(page.value);
    }
  }

  void previousPage() {
    if (page.value > 1) {
      page.value--;
      getEpisodes(page.value);
    }
  }
}