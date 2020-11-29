import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class Article extends StatefulWidget {
  static const routeName = '/article';

  final String imageUrl;
  final String title;
  final String subTitle;
  final String article;

  Article(
    this.imageUrl,
    this.title,
    this.subTitle,
    this.article,
  );

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  String _articleText = "";

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString(widget.article)
        .then((s) => setState(() => _articleText = s));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 110,
                    width: 110,
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(widget.title, style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(widget.subTitle,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade800))),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _articleText,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
