import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/screens/home_screen.dart';
import '../widgets/components/ranking/custom_ranking.dart';
import '../widgets/components/ranking/list_ranking.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  int selectedIndex = 0;
  final List<SampleItem> items = [
    SampleItem(id: '1', name: 'Item 1'),
    SampleItem(id: '2', name: 'Item 2'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '2', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '2', name: 'Item 3'),
    SampleItem(id: '3', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '2', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '3', name: 'Item 3'),
    SampleItem(id: '3', name: 'Item 2'),
  ];


  Widget buildSelectedContent(int index) {
    switch (index) {
      case 0:
        return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return SampleItemWidget(
                    item: items[index],
                    onTap: (item) {
                      print(item.id); // In ra ID của mục được nhấn
                    },
                    );
                  },
                );
      case 1:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/logo.jpg"),
            ),
            SizedBox(width: 10),
            Text(
              'PingLog',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
            ),
            Spacer(),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/logo.jpg"),
            ),
          ],
        ),
      ),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Center(child: Text('RANKING',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children:
                      <Widget>[
                        TransparentButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          }, // set text color to white
                          isSelected: selectedIndex == 0,
                          child: const Text('MEN',
                              style: TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                        const SizedBox(height: 20),
                        TransparentButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          }, // set text color to white
                          isSelected: selectedIndex == 1,
                          child: const Text('WOMEN',
                              style: TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                        const SizedBox(height: 20),
                        TransparentButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          }, // set text color to white
                          isSelected: selectedIndex == 2,
                          child: const Text('TEST',
                              style: TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                    child: buildSelectedContent(selectedIndex)
                ),
              ],
            ),


    );
  }
}
