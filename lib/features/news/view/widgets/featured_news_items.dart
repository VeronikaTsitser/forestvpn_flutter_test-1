import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class FeaturedNewsItem extends StatelessWidget {
  const FeaturedNewsItem({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/news_details', arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          height: 300,
          width: 358,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(article.imageUrl),
              fit: BoxFit.cover,
            ),
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: const BorderRadius.all(Radius.circular(9.0)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                blurRadius: 25,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 194),
            child: Text(
              article.title,
              style: const TextStyle(
                fontFamily: 'SFProDisplay',
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
