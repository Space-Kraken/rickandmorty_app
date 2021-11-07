import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_app/controllers/characters_controller.dart';
import 'package:rickandmorty_app/controllers/home_controller.dart';
import 'package:rickandmorty_app/widgets/character_card_widgets.dart';
import 'package:rickandmorty_app/widgets/character_detail_widget.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CharacterController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 90, 74, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_left_rounded
          ),
          onPressed: () {
            controller.previousPage();
          },
        ),
        centerTitle: true,
        title: Obx(()=>Text('Characters ${controller.page}/${controller.characters!.info!.pages}',)),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_right_rounded),
            onPressed: () {
              controller.nextPage();
            },
          ),
        ],
      ),
      body: GetBuilder<CharacterController>(
        builder: (controller)=> controller.isLoading.value
            ? const Center(child: SizedBox(
              height: 150,
              width: 150,
              child: ClipOval(
                child: Image(image: AssetImage('assets/splash_screen_2.gif')),
              ),
            ))
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.characters!.results!.length,
                itemBuilder: (context, index) {
                  return OpenContainer(
                    openElevation: 0,
                    closedElevation: 0,
                    transitionType: ContainerTransitionType.fadeThrough,
                    closedBuilder: (BuildContext context, VoidCallback openContainer) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: InkWell(
                          onTap:(){
                            openContainer();
                          },
                          child: CharacterCardWidget(
                            data: controller.characters!.results![index], 
                          ),
                        ),
                      );
                    }, 
                    openBuilder: (BuildContext context, VoidCallback _) {
                      //TODO Crear pantalla detalle
                      return SafeArea(
                        child: CharacterDetailWidget(
                          data: controller.characters!.results![index],
                        )
                      );
                    } 
                  );
                },
              ),
      ),
    );
  }
}