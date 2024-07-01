import 'package:flutter/material.dart';

class FirstPageErrorIndicator extends StatelessWidget {
  final void Function()? onTryAgain;

  const FirstPageErrorIndicator({required this.onTryAgain, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            Text("Error occurred!"),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red[900])),
                onPressed: onTryAgain,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.refresh), SizedBox(width: 8), Text("TRY AGAIN")]))
          ],
        ),
      ),
    );
  }
}
