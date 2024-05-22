import 'package:flutter/material.dart';

class PickTeams extends StatefulWidget {
  final Function(String) onTeamSelected;

  const PickTeams({Key? key, required this.onTeamSelected}) : super(key: key);

  @override
  _PickTeamsState createState() => _PickTeamsState();
}

class _PickTeamsState extends State<PickTeams> {
  List<String> teams = ['Đội A', 'Đội B', 'Đội C']; // Danh sách các đội bóng
  String selectedTeam = 'Chọn ...';

  void _showTeamDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chọn đội'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                // Hiển thị danh sách các đội bóng
                ...teams.map(
                      (team) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTeam = team; // Chọn đội bóng từ danh sách
                        Navigator.pop(context); // Đóng hộp thoại
                        widget.onTeamSelected(selectedTeam); // Gọi callback để truyền dữ liệu lên widget cha
                      });
                    },
                    child: Text(team,style: TextStyle(fontSize: 25),),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showTeamDialog(context); // Hiển thị hộp thoại khi người dùng bấm vào
      },
      child: Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            selectedTeam,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
