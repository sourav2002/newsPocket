import 'package:cached_network_image/cached_network_image.dart';
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Stack(
          children: [
            // ------------------background image----------

            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: urlToImage,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),

            // -----------------background black filter-------------
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black54),
            ),

            // -----------------Top content--------------
            Positioned(
              bottom:0,
              left:0,
              right:0,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 16, bottom: 12, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 20, color: AppColors.BOLD_WHITE),
                        )),
                    Row(
                      children: [
                        Text(
                          sourceName,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.GRAY),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: const Text(
                            "date",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.GRAY,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
