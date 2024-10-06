import 'package:flutter/material.dart';
import 'package:my_news_app/model/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              bottomRight: Radius.circular(index % 2 != 0 ? 25 : 0))),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
