import 'package:flutter/material.dart';
import 'package:rickandmorty_app/dao/models/episode_model.dart';

class EpisodeDetailWidget extends StatelessWidget {
  Result? data;
  EpisodeDetailWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(data?.name ?? ""),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          initialValue: '${data?.name}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Name'
                          ),
                        ),
                        const SizedBox(
                          height: 20
                        ),
                        TextFormField(
                          initialValue: '${data?.airDate}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Air Date'
                          ),
                        ),
                        const SizedBox(
                          height: 20
                        ),
                        TextFormField(
                          initialValue: '${data?.episode}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Episode Code'
                          ),
                        ),
                        const SizedBox(
                          height: 20
                        ),

                      ],
                    )
                  ),
                ),
              ),             
            ),
          )
        ],
      ),
    );
  }
}