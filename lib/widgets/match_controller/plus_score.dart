import 'package:flutter/material.dart';

class PlusScore extends StatefulWidget {
  final Function(int) onScoreSelected; // Thêm một callback để truyền dữ liệu

  PlusScore({required this.onScoreSelected});

  @override
  _PlusScore createState() => _PlusScore();
}

class _PlusScore extends State<PlusScore> {
  int selectedScore = 0; // Biến lưu điểm đã chọn

  void _showScoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chọn điểm'),
          content: SingleChildScrollView(
            child: ListBody(
              children: List.generate(9, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedScore = index;
                    });
                    widget.onScoreSelected(selectedScore); // Gọi callback với giá trị selectedScore
                    Navigator.pop(context);
                    _showSnackBar(context);// Đóng hộp thoại
                  },
                  child: ListTile(
                    title: Text('+${index.toString()}'),
                    tileColor: selectedScore == index ? Colors.green : null,
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Điểm đã chọn: $selectedScore'), // Hiển thị điểm đã chọn
      ),
    );
    Future.delayed(Duration(milliseconds: 250), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      height: 65,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, // Cho phép GestureDetector nhận sự kiện trên toàn bộ kích thước của SizedBox
        onTap: () {
          _showScoreDialog(context); // Hiển thị hộp thoại chọn điểm khi nút được bấm
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '$selectedScore',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
