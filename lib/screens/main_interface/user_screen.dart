import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserScreen extends StatelessWidget {
  final bool isLoggedIn = true; // Giả định người dùng đã đăng nhập hoặc chưa
  final Map<String, dynamic> userData = {
    'profileImage': 'assets/profile.png', // Đường dẫn ảnh trong máy
    'fullName': 'John Doe',
    'email': 'johndoe@example.com',
  };

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: Colors.white54,
        title: Text(
          'Profile',
          style: TextStyle(letterSpacing: 4),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(Icons.star),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: CircleAvatar(
              radius: 64,
              backgroundColor: Colors.yellow.shade900,
              backgroundImage: AssetImage(userData['profileImage']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              userData['fullName'],
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              userData['email'],
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Hello"),
                  ),
                  body: Center(child: Text("Hello")),
                );
              }));
            },
            child: IntrinsicWidth(
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        'CLB Bóng Bàn Resco',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Divider(
              thickness: 2,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cài đặt'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Thông tin cá nhân'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Thành viên câu lạc bộ'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return Text("");
                  }));
            },
            leading: Icon(CupertinoIcons.shopping_cart),
            title: Text('Order'),
          ),
          ListTile(
            onTap: () async {
              // Logic để đăng xuất
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return Text("");
                  }));
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    )
        : Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.yellow.shade900,
        title: Text(
          'Profile',
          style: TextStyle(letterSpacing: 4),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(Icons.star),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: CircleAvatar(
              radius: 64,
              backgroundColor: Colors.yellow.shade900,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Login Account TO Access Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return Text("");
                  }));
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width - 200,
              decoration: BoxDecoration(
                color: Colors.yellow.shade900,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                  child: Text(
                    'LOGIN ACCOUNT',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
