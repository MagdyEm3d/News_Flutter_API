import 'package:flutter/material.dart';
import 'package:newsapi/Models/NewsModel.dart';
import 'package:newsapi/Services/NewsService.dart';

class NewsProvider extends ChangeNotifier
{
  NewsModel?newsmodel;
  getalldata()async
  {
    newsmodel=await NewsServic.getdata();
    notifyListeners();
  }
}