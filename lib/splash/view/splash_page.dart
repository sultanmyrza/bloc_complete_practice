import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return SplashPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Text("Splash page"),
          SizedBox(height: 16),
          Container(height: 12, width: 12, child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
