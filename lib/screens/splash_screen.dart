import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_app/controllers/characters_controller.dart';
import 'package:rickandmorty_app/controllers/episodes_controller.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterController = Get.find<CharacterController>();
    characterController.getCharacters(1);
    
    final episodesController = Get.find<EpisodeController>();
    episodesController.getEpisodes(1);

    return SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 8838,
      text: "Rick & Morty",
      imageSrc: "assets/loader_5.gif",
      imageSize: 250,
      pageRouteTransition: PageRouteTransition.SlideTransition,
      backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}