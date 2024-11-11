import 'package:flutter/material.dart';
import 'package:newsapi/Providers/NewsProvider.dart';
import 'package:newsapi/Weidgets/NewsCustome.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "News",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          var newsModel = newsProvider.newsmodel;

          if (newsModel == null) {
            newsProvider.getalldata(); 
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: newsModel.articles.length,
              itemBuilder: (context, index) {
                var article = newsModel.articles[index];
                String title = article["title"] ?? "No title";
                String pieceOfTitle = title.length > 10 ? title.substring(0, 10) + "..." : title;
                String description = article["description"] ?? "No description";
                String partOfDescription = description.length > 10
                    ? description.substring(0, 10) + '...'
                    : description;
                String image = article["urlToImage"] ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfPadMIsHgHdhz8hO_WCoLj-aedbKy4UJRlg&s";
                String articleUrl = article["url"] ?? ""; 

                return GestureDetector(
                  onTap: ()async
                  {
                    if(await canLaunch(articleUrl))
                    {
                      await launch(articleUrl);
                    }else
                    {
                      print("NO URL");
                    }
                  },

                  child: NewsCustome(
                    title: pieceOfTitle,
                    image: image,
                    description: partOfDescription,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
