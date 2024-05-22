import 'package:flutter/material.dart';
import 'package:test_project/screens/match_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate;
  bool isCardVisible = true;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày ban đầu khi mở cửa sổ chọn ngày
      firstDate: DateTime(2000), // Ngày đầu tiên có thể chọn
      lastDate: DateTime(2100), // Ngày cuối cùng có thể chọn
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // Cập nhật giá trị ngày đã chọn
      });
    }
  }

  Widget _buildDateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _selectDate(context), // Gọi hàm xử lý khi nút được nhấn
      child: Text(
        selectedDate != null
            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" // Hiển thị ngày tháng năm đã chọn
            : "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}", // Hiển thị ngày hiện tại nếu chưa chọn ngày
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
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
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                print('hello');
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: const Text('Section 1', style: TextStyle(fontSize: 16, color: Colors.white)),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: const Text('Section 2', style: TextStyle(fontSize: 16, color: Colors.white)),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: const Text('Section 3', style: TextStyle(fontSize: 16, color: Colors.white)),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: const Text('Section 4', style: TextStyle(fontSize: 16, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isCardVisible = !isCardVisible;
                            });
                          },
                          child: Card(
                            color: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.transparent, width: 2),
                            ),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
                              color: Colors.transparent,
                              padding: EdgeInsets.all(10),
                              child: const Text(
                                'ĐỒNG ĐỘI - NAM:Extraliga (Cộng hòa Séc) - Play Offs',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        _buildDateButton(context),
                      ],
                    ),
                  ),
                  Center(
                    child: AnimatedContainer(
                      height: isCardVisible ? 80 : 0,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      duration: Duration(milliseconds: 300),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 80,
                                color: Colors.white54,
                                child: const Center(
                                  child: Text('23:00', style: TextStyle(fontSize: 12)),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                height: 80,
                                color: Colors.white54,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            'Chodov',
                                            style: TextStyle(fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            'TTC Ostrava',
                                            style: TextStyle(fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                height: 80,
                                color: Colors.white54,
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Text('11', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('11', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('11', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('11', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('11', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Text('1', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('6', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('8', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('9', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text('1', style: TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                height: 80,
                                color: Colors.white54,
                                child: const Center(
                                  child: Icon(Icons.star),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Khoảng cách để nhìn thấy nút ở dưới
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Xử lý khi nút được bấm
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
