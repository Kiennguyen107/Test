import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';
import 'package:test_project/screens/main_interface/pick_create_match_sceen.dart';
import 'package:test_project/screens/main_interface/clb_screen.dart';
import 'package:test_project/screens/main_interface/test_home_screen.dart';
import 'package:test_project/screens/main_interface/user_screen.dart';
import '../screens/clb_admin/add_match_page.dart';
import '../screens/clb_admin/input_score_screen.dart';
import '../screens/main_interface/notification_screen.dart';
import '../screens/main_interface/unknow_clb.dart';
import 'controllers/page_navigation_provider.dart';

const Color bottomNavBgColor = Color(0xFF17203A);

class TestBottomNavWithAnimatedIcons extends StatefulWidget {
  const TestBottomNavWithAnimatedIcons({super.key});

  @override
  State<TestBottomNavWithAnimatedIcons> createState() =>
      _TestBottomNavWithAnimatedIconsState();
}

class _TestBottomNavWithAnimatedIconsState extends State<TestBottomNavWithAnimatedIcons> {
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController?> controllers = [];
  late List<Widget> pages;
  late PageController controller;
  int selectedNavIndex = 2;
  int id_right = 1;

  @override
  void initState() {
    super.initState();
    if(id_right==1){
    pages = [
      RankingScreen(),
      PickCreateMatchScreen(),
      TestHomeScreen(),
      ClubNotificationScreen(),
      UserScreen(),
      // InputScore(),
    ];
    }else{
      pages = [
        // AddMatchPage(),
        UnknowClb(),
        PickCreateMatchScreen(),
        TestHomeScreen(),
        UnknowClb(),
        UserScreen(),
        // InputScore(),
      ];
    }
    controller = PageController(initialPage: selectedNavIndex);
  }

  void animatedTheIcon(int index) {
    if (index < riveIconInputs.length) {
      riveIconInputs[index].change(true);
      Future.delayed(const Duration(seconds: 1), () {
        riveIconInputs[index].change(false);
      });
    }
  }

  void riveOnInit(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller =
    StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);
    controllers.add(controller);
    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  void navigateToPage(int pageIndex) {
    setState(() {
      selectedNavIndex = pageIndex;
    });
    controller.jumpToPage(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PageNavigationProvider(
      controller: controller,
      navigateToPage: navigateToPage,
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedNavIndex,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 10,
          height: kBottomNavigationBarHeight,
          onDestinationSelected: (index) {
            setState(() {
              selectedNavIndex = index;
            });
            controller.jumpToPage(selectedNavIndex);
          },
          destinations: [
            NavigationDestination(
              selectedIcon: FaIcon(
                FontAwesomeIcons.users,
                color: Colors.amber,
              ),
              icon: FaIcon(
                FontAwesomeIcons.users,
                color: Colors.grey.withOpacity(0.6),
              ),
              label: "Club",
            ),
            NavigationDestination(
              selectedIcon: FaIcon(
                FontAwesomeIcons.trophy,
                color: Colors.amber,
              ),
              icon: FaIcon(
                FontAwesomeIcons.trophy,
                color: Colors.grey.withOpacity(0.6),
              ),
              label: "Match",
            ),
            const NavigationDestination(
              selectedIcon: Icon(IconlyBold.home),
              icon: Icon(IconlyLight.home),
              label: "Home",
            ),
            const NavigationDestination(
              selectedIcon: Icon(Icons.calendar_today), // Biểu tượng lịch khi được chọn
              icon: Badge(
                backgroundColor: Colors.blue,
                textColor: Colors.black,
                child: Icon(Icons.calendar_today_outlined), // Biểu tượng lịch khi không được chọn
              ),
              label: "Calender",
            ),
            const NavigationDestination(
              selectedIcon: Icon(IconlyBold.profile),
              icon: Icon(IconlyLight.profile),
              label: "Profile",
            ),
          ],
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
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
