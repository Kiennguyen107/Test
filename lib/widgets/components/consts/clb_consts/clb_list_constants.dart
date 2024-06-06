import '../../../model/clb_list.dart';

class ClbListConstants {
  static List<Club> clubs = [
    Club(
      name: 'Câu lạc bộ Resco',
      owner: 'Nguyễn Văn A',
      location: 'Cầu Giấy, Hà Nội',
      description: 'Câu lạc bộ bóng bàn nghiệp dư tại Hà Nội',
      members: [Member(name: 'Nguyễn Văn B', role: 'Thành viên')],
      imageUrl: 'assets/logo.jpg',
      foundingDate: DateTime(2015, 5, 15),
      activeYears: 9,
    ),
    Club(
      name: 'Câu lạc bộ Bắc Từ Liêm',
      owner: 'Nguyễn Hoàng Việt',
      location: 'Bắc Từ Liêm, Hà Nội',
      description: 'Câu lạc bộ bóng bàn nghiệp dư tại Hà Nội',
      members: [
        Member(name: 'Hoàng Tuấn Trung', role: 'Thành viên'),
        Member(name: 'Lý Thị Minh Thu', role: 'Thành viên'),
        Member(name: 'Tạ Thị Thu Huyền', role: 'Thành viên'),
        Member(name: 'Nguyễn Chí Kiên', role: 'Thành viên'),
      ],
      imageUrl: 'assets/logo.jpg',
      foundingDate: DateTime(2015, 5, 15),
      activeYears: 9,
    ),
  ];
}