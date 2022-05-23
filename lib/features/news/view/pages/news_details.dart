import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articleDetails =
        ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 495,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                articleDetails.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 21,
                    vertical: 20,
                  ),
                  child: Text(
                    articleDetails.description.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'SFProDisplay',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
