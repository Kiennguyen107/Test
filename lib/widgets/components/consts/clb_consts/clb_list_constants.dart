import '../../../model/clb_list.dart';

class ClbListConstants {
  static List<Club> clubs = [
    Club(
      name: 'Câu lạc bộ bóng đá',
      owner: 'Nguyễn Văn A',
      location: 'Hà Nội',
      description: 'Câu lạc bộ bóng bàn nghiệp dư tại Hà Nội',
      members: [Member(name: 'Nguyễn Văn B', role: 'Thành viên')],
      imageUrl: 'https://via.placeholder.com/150',
      foundingDate: DateTime(2015, 5, 15),
      activeYears: 9,
    ),
  ];
}