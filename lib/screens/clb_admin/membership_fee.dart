import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/components/consts/clb_consts/clb_constants.dart';
import '../../widgets/components/consts/clb_consts/membership_const.dart';
import '../../widgets/components/ranking/custom_ranking.dart';

import 'list_member.dart';
import 'memership_fee.dart';
import '../../widgets/model/membership_model.dart';


class MembershipFee extends StatefulWidget {
  const MembershipFee({super.key});

  @override
  State<MembershipFee> createState() => _MembershipFeeState();
}

class _MembershipFeeState extends State<MembershipFee> {
  int selectedIndex = 1;
  final List<Member> items = Membership.members;
  double totalFee = 0.0;
  double individualFee = 0.0;

  @override
  void initState() {
    super.initState();
    items.sort((a, b) {
      return double.parse(b.win_rate.replaceAll('%', ''))
          .compareTo(double.parse(a.win_rate.replaceAll('%', '')));
    });
  }

  void updateIndividualFee() {
    setState(() {
      individualFee = totalFee / items.length;
    });
  }

  Widget buildSelectedContent(int index) {
    switch (index) {
      case 0:
        return Container();
      case 1:
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return MemberShipWidget(
                    member: items[index],
                    index: index,
                    onTap: (item) {
                      setState(() {
                        item.isPaid = !item.isPaid;
                      });
                    },
                  );
                },
                childCount: items.length,
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Câu Lạc Bộ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Tổng hội phí',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        totalFee = double.tryParse(value) ?? 0.0;
                        updateIndividualFee();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberListScreen()));
                  },
                  child: Text("Quản lý Thành viên")
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                TransparentButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  isSelected: selectedIndex == 1,
                  child: const Text('Thành viên',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ],
            ),
          ),
          Expanded(
              child: buildSelectedContent(selectedIndex)
          ),
        ],
      ),
    );
  }
}
