import 'package:flutter/material.dart';
import '../../model/club_model.dart';

class SampleMemberWidget extends StatelessWidget {
  final Member member;
  final int index;
  final void Function(Member)? onTap;

  SampleMemberWidget({
    Key? key,
    required this.member,
    required this.index,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        foregroundImage: AssetImage(member.image),
      ),
      title: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              member.name,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.star),
      onTap: onTap != null ? () => onTap!(member) : null,
    );
  }
}
