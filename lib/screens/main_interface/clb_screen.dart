import 'package:flutter/material.dart';
import 'package:test_project/screens/main_interface/home_screen.dart';
import '../../widgets/components/consts/clb_consts/clb_constants.dart';
import '../../widgets/components/ranking/custom_ranking.dart';
import '../../widgets/components/ranking/list_ranking.dart';
import '../../widgets/model/club_model.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  final Club club = ClbConstants.clubInfo;
  int selectedIndex = 1;
  final List<Member> items = ClbConstants.MemberList;

  @override
  void initState() {
    super.initState();
    items.sort((a, b) {
      return double.parse(b.win_rate.replaceAll('%', ''))
          .compareTo(double.parse(a.win_rate.replaceAll('%', '')));
    });
  }

  Widget buildSelectedContent(int index) {
    switch (index) {
      case 0:
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, top: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Tuyển thủ', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                      flex: 2,
                      child: Text('Thứ hạng', style: TextStyle(fontSize: 18)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Điểm', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(bottom: 2, left: 10, right: 10),
                height: 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return SampleItemWidget(
                    member: items[index],
                    index: index,
                    onTap: (item) {
                      print(item.name); // In ra tên của mục được nhấn
                    },
                  );
                },
                childCount: items.length,
              ),
            ),
          ],
        );
    // return ListView.builder(
        //         shrinkWrap: true,
        //         physics: ScrollPhysics(),
        //         itemCount: items.length,
        //         itemBuilder: (context, index) {
        //           return SampleItemWidget(
        //             item: items[index],
        //             onTap: (item) {
        //               print(item.id); // In ra ID của mục được nhấn
        //             },
        //             );
        //           },
        //         );
      case 1:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
              child: Text(
                'Câu Lạc Bộ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
              ),
            ),
      ),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      club.imageUrl,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text(club.name,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Quản lý CLB: ${club.owner}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Địa chỉ: ${club.location}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12.0), // Bạn có thể chỉnh sửa giá trị này để thay đổi độ bo tròn
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ClubListScreen()));
                          },
                          child: const Padding( // Thêm padding để khoảng cách giữa text và biên container đẹp hơn
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Quản lý',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children:
                      <Widget>[
                        TransparentButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          }, // set text color to white
                          isSelected: selectedIndex == 1,
                          child: const Text('Thành viên',
                              style: TextStyle(color: Colors.black, fontSize: 18)),
                        ),
                        const SizedBox(height: 20),
                        TransparentButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          }, // set text color to white
                          isSelected: selectedIndex == 0,
                          child: const Text('Xếp hạng',
                              style: TextStyle(color: Colors.black, fontSize: 18)),
                        ),
                      ],
                  ),
                ),
                // SizedBox(height: 15),
                // const Padding(
                //   padding: EdgeInsets.only(left: 35.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 2,
                //           child: Text('Tuyển thủ',style: TextStyle(fontSize: 18),)
                //       ),
                //       SizedBox(width: 40,),
                //       Expanded(
                //         flex: 2,
                //           child: Text('Xếp hạng',style: TextStyle(fontSize: 18))
                //       ),
                //       Expanded(
                //         flex: 1,
                //           child: Text('Thắng',style: TextStyle(fontSize: 18))
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 5,),
                // Container(
                //   margin: EdgeInsets.only(bottom: 2,left: 10,right: 10),
                //   height: 4,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade600,
                //     borderRadius: BorderRadius.all(Radius.circular(12)),
                //   ),
                // ),
                Expanded(
                    child: buildSelectedContent(selectedIndex)
                ),
              ],
            ),
    );
  }
}

