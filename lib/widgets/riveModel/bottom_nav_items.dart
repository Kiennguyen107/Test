import 'package:test_project/widgets/riveModel/rive_model.dart';

class NavItemModel{
  final String title;
  final RiveModel rive;

  NavItemModel({required this.title,required this.rive});
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
      title: "Chat",
      rive: RiveModel(
          src: "assets/RiveAssets/icons.riv",
          artboard: "CHAT",
          stateMachineName: "CHAT_Interactivity"),
  ),
  NavItemModel(
    title: "Play",
    rive: RiveModel(
        src: "assets/RiveAssets/icons_full.riv",
        artboard: "PLAY/PAUSE",
        stateMachineName: "PLAY_Interactivity"),
  ),

  NavItemModel(
    title: "Timer",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  // NavItemModel(
  //   title: "Bell",
  //   rive: RiveModel(
  //       src: "assets/RiveAssets/icons.riv",
  //       artboard: "BELL",
  //       stateMachineName: "BELL_Interactivity"),
  // ),
  NavItemModel(
    title: "Rules",
    rive: RiveModel(
        src: "assets/RiveAssets/icons_full.riv",
        artboard: "RULES",
        stateMachineName: "RULES_Interactivity"),
  ),
  NavItemModel(
    title: "Score",
    rive: RiveModel(
        src: "assets/RiveAssets/icons_full.riv",
        artboard: "SCORE",
        stateMachineName: "SCORE_Interactivity"),
  ),




  // NavItemModel(
  //   title: "User",
  //   rive: RiveModel(
  //       src: "assets/RiveAssets/icons.riv",
  //       artboard: "USER",
  //       stateMachineName: "USER_Interactivity"),
  // ),
  // NavItemModel(
  //   title: "User",
  //   rive: RiveModel(
  //       src: "assets/RiveAssets/icons.riv",
  //       artboard: "USER",
  //       stateMachineName: "USER_Interactivity"),
  // ),
  // NavItemModel(
  //   title: "User",
  //   rive: RiveModel(
  //       src: "assets/RiveAssets/icons.riv",
  //       artboard: "USER",
  //       stateMachineName: "USER_Interactivity"),
  // ),
];

