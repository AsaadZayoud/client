import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/pages/library_page.dart';
import 'package:client/features/home/view/pages/songs_page.dart';
import 'package:client/features/home/widgets/music_slab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int selectIndex = 0;
  final pages = const [
    SongsPage(),
    LibraryPage()
  ];
  @override
  Widget build(BuildContext context) {
   // final user = ref.watch(currentUserNotifierProvider);
   // print(user);
    return Scaffold(
      body: Stack(
        children: [

          pages[selectIndex],
           const Positioned(
              bottom: 0
              ,
               child: MusicSlab()
           ),
        ],
      ),
        bottomNavigationBar:BottomNavigationBar(
        currentIndex: selectIndex,

        onTap: (value){
          setState(() {
            selectIndex = value;
          });
        }
        ,items: [
          BottomNavigationBarItem(
              icon:

              Image.asset( selectIndex == 0 ? 'assets/images/home_filled.png'
                  : 'assets/images/home_unfilled.png',
              color: selectIndex == 0 ? Pallete.whiteColor :
              Pallete.inactiveBottomBarItemColor,
              ),
              label:'Home'
          ),
          BottomNavigationBarItem(
              icon:
              Image.asset('assets/images/library.png',
                color: selectIndex == 1 ? Pallete.whiteColor :
                Pallete.inactiveBottomBarItemColor,
              ),
              label: 'Library'
          )

        ],)
    );
  }
}

