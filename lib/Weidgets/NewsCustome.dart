import 'package:flutter/material.dart';

class NewsCustome extends StatelessWidget
{
  String title;
  String image;
  String description;

  NewsCustome({required this.title,required this.image,required this.description});
  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 300,
      height: 100,
      
      decoration: BoxDecoration(
         color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Colors.black,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(800000),
                ),
                child: Image.network(image),
              )
            ],
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("title:${title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Text("description:{$description}")
            ],
          )
        ],
      ),
    );
    
  }
}