import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
class MusicSlab extends ConsumerWidget {
  const MusicSlab({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentSong = ref.watch(currentSongNotifierProvider);

    if(currentSong == null) {
      print('sadas');

      return const SizedBox();
    }
    return  Stack(
      children: [
      Container(
      height: 66,
      width: MediaQuery.of(context).size.width - 16,
      decoration:BoxDecoration(
          color: hexToColor(currentSong.hexCode!),
          borderRadius: BorderRadius.circular(4)
      ) ,
      padding: const EdgeInsets.all(9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:NetworkImage(
                            currentSong.thumbnailUrl!
                        ),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(4)
                ),
              ),
              const SizedBox(width:8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center
                ,children: [
                Text(currentSong.songName!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500

                  ),
                ),
                Text(currentSong.artist!,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Pallete.subtitleText

                  ),
                )
              ],)
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){}
                  , icon: const
                  Icon(CupertinoIcons.heart,
                    color: Pallete.whiteColor,
                  )),
              IconButton(onPressed: (){}
                  , icon: const
                  Icon(CupertinoIcons.play_fill,
                    color: Pallete.whiteColor,
                  ))
            ],
          )
        ],
      ),
    ),
        Positioned(
        bottom: 0,
        left: 8
        ,child: Container(
          height: 2,
          width: 20,
          decoration:  BoxDecoration(
            color: Pallete.whiteColor,
              borderRadius: BorderRadius.circular(7)
          ),
        )),
        Positioned(
            bottom: 0,
            left: 8
            ,child: Container(
          height: 2,
          width: MediaQuery.of(context).size.width - 32,
          decoration:  BoxDecoration(
              color: Pallete.inactiveSeekColor,
              borderRadius: BorderRadius.circular(7)
          ),
        ))

      ],
    );
  }
}
