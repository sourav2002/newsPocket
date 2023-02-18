import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/consts/color.dart';

class ArticleView extends StatefulWidget {
  String title;
  String description;
  String content;
  String urlToImage;
  String sourceName;
  String publishedAt;
  ArticleView(
      {super.key,
      required this.title,
      required this.description,
      required this.content,
      required this.urlToImage,
      required this.sourceName,
      required this.publishedAt});
  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Stack(
          children: [
            // ------------------background image----------

            ClipRRect(
                child: CachedNetworkImage(
                    imageUrl: widget.urlToImage,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fitHeight)),

            // -----------------background black filter-------------
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black26, Colors.black]),
              ),
            ),



            // -----------------Top content--------------
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 24, bottom: 12, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 64),
                        child: Text(
                          widget.title,
                          maxLines: 4,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 29,
                            color: AppColors.BOLD_WHITE,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Text(
                            widget.sourceName,
                            style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.BOLD_WHITE,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 18),
                            child: Text(
                              widget.publishedAt,
                              style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.BOLD_WHITE,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.content,
                        style: const TextStyle(
                            color: AppColors.GRAY, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // ------- back button ------------
            Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
