class NewsModel
{
  List<dynamic>articles;
  NewsModel({required this.articles});

  factory NewsModel.jsonform(Map<String,dynamic>json)
  {
    return NewsModel(articles: json["articles"]??[]);
  }
}