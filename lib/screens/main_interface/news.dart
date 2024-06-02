import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: 'Service Stats Create Calderano ComeBack',
      description: "Hugo Calderano has overturned a two game deficit against Dimitrij Ovtcharov to book his place in the Men's Singles quarterfinals at WTT Champions Chongqing 2024 Presented by Changan. The 5th seed looked to be headed towards the exit, when the Brazilian took the reigns and posted consecutive games on the board to win 3-2 (4-11, 2-11, 11-9, 11-5, 11-7).\n"
          "Finalist of the first WTT Champions event of the year in Incheon back in March, Calderano came to Chongqing on a quest to move a step up the podium. His WTT Series title collection had recently grown, having produce a homemade win at May's WTT Contender Rio de Janeiro, taking his total title count to six. Meanwhile, Ovtcharov was in China on a mission for his first WTT Series title since 2021.",
      imageUrl: 'assets/TableTenis/2.jpg',
    ),
    Article(
      title: 'Chen Meng Escapes Upset, Edges Out Goda',
      description: "Chen Meng's hopes for her first purple trophy remain alive as she survived an unexpected test at WTT Champions Chongqing 2024 Presented by Changan. 16-year-old Hana Goda put the 3rd seed through her paces, as Chen made a great escape from her round of 16 match, winning 3-2 (7-11, 11-6, 11-5, 7-11, 11-9).\n"
          "Before Chongqing, Goda had not won a match in previous four WTT Champions appearances. But with a round of 32 win under her belt, the teenager was hitting top form in China. Her opponent however was expected to dominate, with Chen Meng having just collected her second WTT Grand Smash title at Saudi Smash 2024.",
      imageUrl: 'assets/TableTenis/3.jpg',
    ),
    Article(
      title: 'Harimoto Sticks The Landing Against Assar',
      description: "Tomokazu Harimoto has roared his way through to the round of 16 of the Men's Singles at WTT Champions Chongqing 2024 Presented by Changan, coming up clutch at the finish line against Omar Assar. Harimoto stuck the landing in a full-distance marathon, taking the match 3-2 (11-5, 2-11, 11-8, 9-11, 11-4)\n"
          "Going in, the duo were in a head-to-head deadlock, all tied up at 1:1. Their last encounter had also been a thriller, with Assar getting past Harimoto 11-9 in the decider at WTT Star Contender ESS 2022. Momentum also trending towards the Egyptian, despite the ranking underdog, Assar is man hitting peak form of late. A massive breakthrough came for the Egyptian in April as he broke the Top 15 in the world for first time in his career.",
      imageUrl: 'assets/TableTenis/1.jpg',
    ),
    // Add more articles here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Tin Tức Mới', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(article: articles[index]);
        },
      ),
    );
  }
}

class Article {
  final String title;
  final String description;
  final String imageUrl;

  Article({required this.title, required this.description, required this.imageUrl});
}

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(article: article),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(article.imageUrl),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                article.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: Text(
                article.description,
                style: TextStyle(fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(article.imageUrl),
            SizedBox(height: 10),
            Text(
              article.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(article.description, style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
          ],
        ),
      ),
    );
  }
}
