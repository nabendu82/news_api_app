import 'package:flutter/material.dart';
import 'package:news_api_app/model/article_model.dart';
import 'package:news_api_app/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticlePage(article: article)));
          },
          child: Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    article.urlToImage != null ?
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ) :
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('https://source.unsplash.com/weekly?coding'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        article.source.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      article.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
              ),
  );
}
