import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:test_project/screens/create_match.dart';
import 'package:test_project/screens/input_score_screen.dart';
import 'package:test_project/screens/ranking_screen.dart';
import 'package:test_project/widgets/riveModel/bottom_nav_items.dart';
import '../screens/champion_match_screen.dart';
import '../screens/home_screen.dart';

const Color bottomNavBgColor = Color(0xFF17203A);

class BottomNavWithAnimatedIcons extends StatefulWidget {
  const BottomNavWithAnimatedIcons({super.key});

  @override
  State<BottomNavWithAnimatedIcons> createState() =>
      _BottomNavWithAnimatedIconsState();
}

class _BottomNavWithAnimatedIconsState extends State<BottomNavWithAnimatedIcons> {
  List<SMIBool> riveIconInputs=[];
  List<StateMachineController?> controllers =[];
  int selectedNavIndex =0;
  final _pages =[
    HomeScreen(),
    CreateMatchScreen(),
    ChamScreenMatch(),
    InputScore(),
    RankingScreen()
  ];

  void animatedTheIcon(int index) {
    if (index < riveIconInputs.length) {
      riveIconInputs[index].change(true);
      Future.delayed(
          const Duration(seconds: 1), () {
        riveIconInputs[index].change(false);
      }
      );
    }
  }

  void riveOnInit(Artboard artboard, {required String stateMachineName}){
    StateMachineController? controller = StateMachineController.fromArtboard(
        artboard, stateMachineName);

    artboard.addController(controller!);
    controllers.add(controller);
    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose(){
    for(var controller in controllers){
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedNavIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: bottomNavBgColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavItems.length,
                (index){
                  final riveIcon = bottomNavItems[index].rive;
              return GestureDetector(
                onTap: (){
                  animatedTheIcon(index);
                  setState(() {
                    selectedNavIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(isActive: selectedNavIndex == index),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity: selectedNavIndex == index ? 1: 0.5,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: riveIcon.artboard,
                          onInit: (artboard){
                            riveOnInit(artboard, stateMachineName: riveIcon.stateMachineName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 2),
      height: 3,
      width: isActive ? 20 :0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
