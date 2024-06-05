import 'package:flutter/material.dart';
import 'package:test_project/screens/clb_admin/creat_club_screen.dart';

import '../clb_admin/clb.dart';

class UnknowClb extends StatelessWidget {
  void _onButtonPressed(BuildContext context, String buttonLabel) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$buttonLabel button pressed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
          width: 200, // Chiều rộng của nút bấm
          height: 60, // Chiều cao của nút bấm
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ClubListScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text(
              'Tham gia CLB',
              style: TextStyle(
                fontSize: 18, // Điều chỉnh kích thước chữ
                color: Colors.white, // Đặt màu chữ thành màu trắng
              ), // Điều chỉnh kích thước chữ
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200, // Chiều rộng của nút bấm
          height: 60, // Chiều cao của nút bấm
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateClubScreen(onAddClub: (Club ) {  }, onUpdateClub: (int , Club ) {  },)));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text(
              'Tạo CLB mới',
              style: TextStyle(
                fontSize: 18, // Điều chỉnh kích thước chữ
                color: Colors.white, // Đặt màu chữ thành màu trắng
              ), // Điều chỉnh kích thước chữ
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}

