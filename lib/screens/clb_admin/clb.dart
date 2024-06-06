import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/components/consts/clb_consts/clb_list_constants.dart';
import '../../widgets/model/clb_list.dart';
import 'creat_club_screen.dart';

class ClubListScreen extends StatefulWidget {
  @override
  _ClubListScreenState createState() => _ClubListScreenState();
}

class _ClubListScreenState extends State<ClubListScreen> {
  final List<Club> clubs = ClbListConstants.clubs;
  int id_right = 3;

  void addClub(Club club) {
    setState(() {
      clubs.add(club);
    });
  }

  void updateClub(int index, Club club) {
    setState(() {
      clubs[index] = club;
    });
  }

  void deleteClub(int index) {
    setState(() {
      clubs.removeAt(index);
    });
  }

  void navigateToAddClub({int? index}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateClubScreen(
          onAddClub: addClub,
          onUpdateClub: updateClub,
          club: index != null ? clubs[index] : null,
          index: index,
        ),
      ),
    );
  }

  void navigateToClubDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClubDetailsScreen(club: clubs[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Danh sách CLB',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: clubs.length,
        itemBuilder: (context, index) {
          final club = clubs[index];
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              title: Row(
                children: [
                  Text(
                    club.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              subtitle: Text(
                club.location,
                style: TextStyle(fontSize: 17),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (id_right != 3)
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => navigateToAddClub(index: index),
                    ),
                  if (id_right != 3)
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteClub(index),
                    ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => print('hello'),
                  ),
                ],
              ),
              onTap: () => navigateToClubDetails(index),
            ),
          );
        },
      ),
      floatingActionButton: id_right != 3
          ? FloatingActionButton(
        onPressed: navigateToAddClub,
        child: Icon(Icons.add),
      )
          : null,
    );
  }
}

class ClubDetailsScreen extends StatelessWidget {
  final Club club;

  ClubDetailsScreen({required this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: club.imageUrl.isNotEmpty ? AssetImage(club.imageUrl) : null,
                child: club.imageUrl.isEmpty
                    ? Icon(Icons.camera_alt, size: 80, color: Colors.grey)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Text('Owner: ${club.owner}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Location: ${club.location}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Description: ${club.description}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Founding Date: ${DateFormat('dd/MM/yyyy').format(club.foundingDate)}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Active Years: ${club.activeYears}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
