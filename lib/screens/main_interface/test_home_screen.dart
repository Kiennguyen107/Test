import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../widgets/components/consts/app_constants.dart';
import '../../widgets/components/consts/ctg_rounded_widget.dart';
import '../../widgets/components/consts/title_text.dart';
import '../../widgets/controllers/page_navigation_provider.dart';
import 'news.dart';

class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            Spacer(),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/logo.jpg"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.28,
                child: ClipRRect(
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannersImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstants.bannersImages.length,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.green,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const TitlesTextWidget(label: "Latest arrival"),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6, // Chỉnh sửa lại số lượng nếu cần
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.4,
                      color: Colors.grey[200],
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(child: Text('Product $index')),
                    );
                  },
                ),
              ),
              const TitlesTextWidget(label: "Categories"),
              const SizedBox(
                height: 15.0,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: List.generate(
                  AppConstants.categoriesList.length > 4
                      ? 4
                      : AppConstants.categoriesList.length,
                      (index) {
                    return CategoryRoundedWidget(
                      image: AppConstants.categoriesList[index].image,
                      name: AppConstants.categoriesList[index].name,
                      onTap: () {
                        final provider = PageNavigationProvider.of(context);
                        if (provider != null) {
                          switch (index) {
                            case 0:
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen())); // NewsScreen
                              break;
                            case 1:
                              provider.navigateToPage(3); // PickCreateMatchScreen
                              break;
                            case 2:
                              provider.navigateToPage(0); // TestHomeScreen
                              break;
                            case 3:
                              provider.navigateToPage(0); // RankingScreen
                              break;
                          }
                        }
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
