import 'package:flutter/material.dart';
import 'package:news_api_app/components/customListTile.dart';
import 'package:news_api_app/model/article_model.dart';
import 'package:news_api_app/model/categoryModel.dart';
import 'package:news_api_app/services/api_service.dart';
import 'package:news_api_app/services/data.dart';

import 'navBar.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client = ApiService();
  List<CategoryModels> categories = <CategoryModels>[];
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("NEWS", style: TextStyle(color: Colors.black)),
            Text(
              "FEED",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              ///CATEGORIES
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),

              ///Blog
              Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: client.getArticle(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Article>> snapshot) {
                    if (snapshot.hasData) {
                      List<Article> articles = snapshot.data;
                      return ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) =>
                              customListTile(articles[index], context));
                    }
                    return Center(
                      child: CircularProgressIndicator(),
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

class CategoryTile extends StatelessWidget {
  // const CategoryTile({ Key? key }) : super(key: key);
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 60,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            child: Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]),
      ),
    );
  }
}
