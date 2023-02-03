import 'package:flutter/material.dart';
import 'package:news_task/consts/color.dart';
import 'package:news_task/views/article_view.dart';

class ArticleCard extends StatelessWidget {
  final String title, description, urlToImage, sourceName;
  const ArticleCard(
      this.title, this.description, this.urlToImage, this.sourceName,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ArticleView()));
      },
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                urlToImage,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )),
          Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black26
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, color: AppColors.BOLD_WHITE),
                ),
                Row(
                  children: [
                    Text(
                      sourceName,
                      style:
                          const TextStyle(fontSize: 12, color: AppColors.GRAY),
                    ),
                    const Text(

                      "date",
                      style: TextStyle(fontSize: 14, color: AppColors.GRAY, ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
