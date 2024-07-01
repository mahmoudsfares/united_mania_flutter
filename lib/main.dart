import 'package:flutter/material.dart';
import 'package:united_mania_flutter/utils/route_names.dart';
import 'screens/home/home_screen.dart';
import 'screens/article_details/article_details_screen.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {RouteNames.init: (context) => HomeScreen(), RouteNames.details: (context) => NewsDetails()},
      ),
    );
