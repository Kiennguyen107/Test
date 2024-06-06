import 'package:test_project/widgets/model/club_model.dart';
// class ClbConstants {
//   static List<Club> clubList = [
//     Club(
//       name: 'CLB Bóng Bàn Resco',
//       owner: 'Nguyễn Văn A',
//       location: '123 Đường ABC, Quận 1, TP.HCM',
//       description: "A great club for ping pong enthusiasts.",
//       members: MemberList,
//       imageUrl: 'assets/categories/book_img.png',
//     ),
//     Club(
//       name: "Ping Pong Club B",
//       owner: "Jane Smith",
//       location: "456 Avenue, City",
//       description: "Join us for fun and competitive matches.",
//       members: [],
//       imageUrl: "assets/logo_b.jpg",
//     ),
//     // Thêm nhiều câu lạc bộ khác nếu cần
//   ];
//  }


class ClbConstants {
  static Club clubInfo = Club(
    name: 'CLB Bóng Bàn Resco',
    owner: 'Hoàng Tuấn Trung',
    location: '100 Lê Đức Thọ, Quận Cầu Giấy, TP.Hà Nội',
    description: "A great club for ping pong enthusiasts.",
    members: MemberList,
    imageUrl: 'assets/logo.jpg',
    foundingDate: DateTime.now(), activeYears: 2014,
  );

  static List<Member> MemberList = [
    Member(
      image: "assets/categories/0.png",
      name: "Wang ChuQin",
      role: 'Thành viên',
      win_rate: '50',
    ),
    Member(
      image: "assets/categories/1.png",
      name: "Ma Long",
      role: 'Thành viên',
      win_rate: '60',
    ),
    Member(
      image: "assets/categories/2.png",
      name: "Fan ZhenDong",
      role: 'Thành viên',
      win_rate: '70',
    ),
    Member(
      image: "assets/categories/3.png",
      name: "Timo Boll",
      role: 'Thành viên',
      win_rate: '80',
    ),
    Member(
      image: "assets/categories/4.png",
      name: "Flex Lebrun",
      role: 'Thành viên',
      win_rate: '90',
    ),
    Member(
      image: "assets/categories/5.png",
      name: "Lin Yun Yun",
      role: 'Thành viên',
      win_rate: '85',
    ),
    Member(
      image: "assets/categories/6.png",
      name: "Tomokazu Harimoto",
      role: 'Thành viên',
      win_rate: '75',
    ),
    Member(
      image: "assets/categories/7.png",
      name: "Lin GaoYuan",
      role: 'Thành viên',
      win_rate: '65',
    ),
  ];
}
