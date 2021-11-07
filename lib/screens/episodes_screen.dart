import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_app/controllers/episodes_controller.dart';
import 'package:rickandmorty_app/widgets/episode_card_widget.dart';
import 'package:rickandmorty_app/widgets/episode_detail_widget.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EpisodeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 90, 74, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_left_rounded
          ),
          onPressed: () => controller.previousPage(),
        ),
        centerTitle: true,
        title: Obx(()=> Text('Episodes ${controller.page}/${controller.episodes!.info!.pages}')),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_right_rounded
            ),
            onPressed: () => controller.nextPage(),
          ),
        ],
      ),
      body: GetBuilder<EpisodeController>(
        builder: (controller) => controller.isLoading.value?
          const Center(child: SizedBox(
            height: 150,
            width: 150,
            child: ClipOval(
              child: Image(image: AssetImage('assets/splash_screen_2.gif'),),
            )
          )):
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.episodes!.results!.length,
            itemBuilder: (context, index){
              return OpenContainer(
                openElevation: 0,
                closedElevation: 0,
                transitionType: ContainerTransitionType.fadeThrough,
                closedBuilder: (BuildContext context, VoidCallback openContainer){
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: InkWell(
                      child: EpisodeCardWidget(
                        data: controller.episodes!.results![index],
                      ),
                      onTap: () => openContainer(),
                    ),
                  );
                },
                openBuilder: (BuildContext context, VoidCallback _){
                  return SafeArea(
                    child: EpisodeDetailWidget(
                      data: controller.episodes!.results![index],
                    ), 
                  );
                },
              );
            },
          )
      ),
    );
  }
}