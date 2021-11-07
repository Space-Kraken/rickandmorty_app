import 'package:flutter/material.dart';
import 'package:rickandmorty_app/dao/models/character_model.dart';

class CharacterDetailWidget extends StatelessWidget {
  Result? data;
  CharacterDetailWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              background: Image.network(
                '${data?.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                            labelText: 'Name',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: '${data?.status}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                          labelText: 'Status',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: '${data?.species}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Specie',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: '${data?.gender}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: '${data?.location?.name}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Location',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: '${data?.episode?.length}',
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Episodes',
                          ),
                        ),
                      ]
                    )
                  )
                )
              )
            )
          )
        ],
      ),
    );
  }
}