import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/components/consts/clb_consts/clb_constants.dart';
import '../../widgets/components/consts/clb_consts/clb_list_constants.dart';
import '../../widgets/model/club_model.dart';
import 'creat_club_screen.dart';

class MemberListScreen extends StatefulWidget {
  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  final List<Member> members = ClbConstants.MemberList;
  int id_right = 3;

  void addMember(Member member) {
    setState(() {
      members.add(member);
    });
  }

  void updateMember(int index, Member member) {
    setState(() {
      members[index] = member;
    });
  }

  void deleteMember(int index) {
    setState(() {
      members.removeAt(index);
    });
  }


  void navigateToMemberDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemberDetailsScreen(member: members[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Danh sách thành viên',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(member.image),
                  ),
                  SizedBox(width: 10),
                  Text(
                    member.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              subtitle: Text(
                member.role,
                style: TextStyle(fontSize: 17),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (id_right != 2)
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteMember(index),
                    ),
                ],
              ),
              onTap: () => navigateToMemberDetails(index),
            ),
          );
        },
      ),
    );
  }
}

class MemberDetailsScreen extends StatelessWidget {
  final Member member;

  MemberDetailsScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(member.image),
              ),
            ),
            SizedBox(height: 20),
            Text('Role: ${member.role}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Win Rate: ${member.win_rate}%', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
