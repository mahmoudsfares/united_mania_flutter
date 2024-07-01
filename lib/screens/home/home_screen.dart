import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_mania_flutter/screens/home/pagination/articles_listview_paginated.dart';

class HomeScreen extends GetView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("All News"),
      ),
      body: Container(
        color: Colors.red[600],
        width: double.infinity,
        child: Padding(padding: EdgeInsets.all(16), child: ArticlesPagination()),
      ),
    );
  }
}
