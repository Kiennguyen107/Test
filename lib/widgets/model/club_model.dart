class Member {
  final String image;
  final String name;
  final String role;
  final String win_rate;

  Member({required this.image,required this.name, required this.role, required this.win_rate});
}
class Club {
  final String name;
  final String owner;
  final String location;
  final String description;
  final List<Member> members;
  final String imageUrl;

  Club({
    required this.name,
    required this.owner,
    required this.location,
    required this.description,
    required this.members,
    required this.imageUrl,
  });
}
