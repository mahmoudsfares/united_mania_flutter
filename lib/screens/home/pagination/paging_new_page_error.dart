
import 'package:flutter/material.dart';

class NewPageErrorIndicator extends StatelessWidget {
  final void Function()? onTryAgain;

  const NewPageErrorIndicator(
      {required this.onTryAgain, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            Text("Error occurred!"),
            IconButton(onPressed: onTryAgain, icon: Icon(Icons.refresh))
          ],
        ),
      ),
    );
  }
}
