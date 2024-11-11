import 'package:dio/dio.dart';
import 'package:newsapi/Models/NewsModel.dart';

class NewsServic
{
  static Dio dio=Dio();
  static Future<NewsModel>getdata()async
  {
    Response response=await dio.get("https://newsapi.org/v2/everything?q=tesla&from=2024-10-11&sortBy=publishedAt&apiKey=952ef132f3ee4686b668b5b8d0cf7cdc");
    try
    {
      if(response.statusCode==200)
      {
        return NewsModel.jsonform(response.data);
      }else
      {
       
        throw Exception("Fail to get data");
      }
    }catch(ex)
    {
      throw Exception("Error ${ex}"); 
    }
  }
}