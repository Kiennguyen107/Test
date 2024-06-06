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
  String selectedMonth = '1'; // Default to January

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

  void filterItemsByMonth(String month) {
    // Logic to filter items by month
    // Here, you need to update the items list based on the selected month
    // This is a placeholder for your filtering logic
    setState(() {
      // Example: Filtering logic (you should implement your actual logic)
      items.forEach((item) {
        item.isPaid = (item.name.hashCode % int.parse(month)) == 0;
      });
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: DropdownButton<String>(
                  value: selectedMonth,
                  items: <String>['1', '2', '3', '4', '5'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text('Tháng $value'),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                      filterItemsByMonth(selectedMonth);
                    });
                  },
                ),
              ),
              SizedBox(width: 60,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberListScreen()));
                  },
                  child: Text("Quản lý Thành viên")
              ),
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

class TransparentMemButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSelected;
  final Widget child;

  const TransparentMemButton(
      {required this.onPressed, required this.isSelected, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              width: 2.0,
              color: isSelected ? Colors.black : Colors.transparent,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: child,
      ),
    );
  }
}

class MemberShipWidget extends StatelessWidget {
  final Member member;
  final int index;
  final ValueChanged<Member> onTap;

  const MemberShipWidget(
      {required this.member, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${index + 1}'),
      ),
      title: Text(member.name),
      subtitle: Text('Hội phí: ${member.fee}'),
      trailing: Icon(
        member.isPaid ? Icons.check_circle : Icons.cancel,
        color: member.isPaid ? Colors.green : Colors.red,
      ),
      onTap: () {
        onTap(member);
      },
    );
  }
}
