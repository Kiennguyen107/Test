import 'package:flutter/material.dart';
import '../../model/club_model.dart';

class SampleItemWidget extends StatelessWidget {
  final Member member;
  final int index;
  final void Function(Member)? onTap;

  SampleItemWidget({
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
          Expanded(
            flex: 1,
            child: Text(
              (index + 1).toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      onTap: onTap != null ? () => onTap!(member) : null,
      trailing: Text(
        member.win_rate,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
