import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_app/controllers/home_controller.dart';
import 'package:rickandmorty_app/screens/characters_screen.dart';
import 'package:rickandmorty_app/screens/episodes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: const Text("Rick and morty app"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backLayerBackgroundColor: Colors.black,
      headerHeight: MediaQuery.of(context).size.height * 0.75,
      frontLayer: Obx(()=>getSelection(controller.selection.value)),
      backLayer: BackdropNavigationBackLayer(
        items: [
          Obx(()=> ListTile(
            title: Text(
              "Characters", 
              style: TextStyle(
                fontSize: 20, 
                color: controller.selection.value == 0 ? Colors.white : Colors.grey
              ),
            ),
          ),),
          Obx(()=> ListTile(
            title: Text(
              "Episodes", 
              style: TextStyle(
                fontSize: 20, 
                color: controller.selection.value == 1 ? Colors.white : Colors.grey
                ),
              ),
          ),),
        ],
        onTap: (int position) => {controller.changeSelection(position)},
      ),
    );
  }

    Widget getSelection(var selected) {
    switch (selected) {
      case 1: return const EpisodesScreen(); 
      default: return const CharactersScreen();
    }
  }
}