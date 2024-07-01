import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:united_mania_flutter/models/data.dart';
import 'package:united_mania_flutter/utils/app_assets.dart';
import 'package:united_mania_flutter/utils/map_keys.dart';
import 'package:united_mania_flutter/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  late Article article;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    article = (ModalRoute.of(context)!.settings.arguments as Map)[MapKeys.article];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[600],
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: article.image,
                placeholder: (context, url) => Image.asset(AppAssets.placeholder, width: double.infinity, fit: BoxFit.fill),
                errorWidget: (context, url, error) => Image.asset(AppAssets.placeholder, width: double.infinity, fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  article.source.name,
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  article.title,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  Utils.trimContent(article.content),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: GestureDetector(
                  onTap: () async {
                    Uri articleUri = Uri.parse(article.url);
                    try {
                      await launchUrl(articleUri);
                    } catch (e) {
                      Fluttertoast.showToast(msg: 'Error launching Url');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'FULL ARTICLE',
                        style: TextStyle(color: Colors.cyan, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
