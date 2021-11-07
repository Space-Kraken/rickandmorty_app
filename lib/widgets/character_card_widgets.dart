import 'package:flutter/material.dart';
import 'package:rickandmorty_app/dao/models/character_model.dart';

class CharacterCardWidget extends StatelessWidget {
  Result? data;
  
  CharacterCardWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(4), 
              topLeft: Radius.circular(4)
            ),
            child: Image.network(
              '${data?.image}',
              height: 170,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const ClipOval(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 170,
            width: 180,
            child: Column(
              textDirection: TextDirection.ltr,

              children: [
                Text('${data?.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.donut_small_outlined, size: 12,),
                    Text(' ${data?.status}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                    const Text(' - ', style: TextStyle(fontSize: 16,),),
                    Expanded(
                      child: Text('${data?.species}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      data?.gender == "Male"?
                        Icons.male_rounded:
                        Icons.female_rounded, 
                      size: 14
                    ),
                    Text('${data?.gender}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),)
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, size: 12,),
                    Expanded(
                      child: Text('${data?.location?.name}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300)))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}