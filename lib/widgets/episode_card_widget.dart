import 'package:flutter/material.dart';
import 'package:rickandmorty_app/dao/models/episode_model.dart';

class EpisodeCardWidget extends StatelessWidget {
  Result? data;
  EpisodeCardWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${data?.name}"),
      subtitle: Text("${data?.episode}"),
    );
  }
}