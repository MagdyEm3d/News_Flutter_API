import 'package:flutter/material.dart';
import 'package:newsapi/Providers/NewsProvider.dart';
import 'package:newsapi/Screens/NewsScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>NewsProvider())
    ],child: MaterialApp(home: NewsScreen(),),);
    
  }
}
