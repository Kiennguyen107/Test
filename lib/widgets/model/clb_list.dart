class Member {
  final String name;
  final String role;

  Member({
    required this.name,
    required this.role,
  });
}

class Club {
  final String name;
  final String owner;
  final String location;
  final String description;
  final List<Member> members;
  final String imageUrl;
  final DateTime foundingDate;
  final int activeYears;

  Club({
    required this.name,
    required this.owner,
    required this.location,
    required this.description,
    required this.members,
    required this.imageUrl,
    required this.foundingDate,
    required this.activeYears,
  });
}