import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_provider/screen/education/view/education_screen.dart';
import 'package:webview_provider/screen/ott/view/ott_screen.dart';

class HomeProvider extends ChangeNotifier {
  int i = 0;
  WebViewController? webViewController;

  void loadEducationURL(int index) {
    webViewController = WebViewController();
    webViewController!.loadRequest(
      Uri.parse("${educationLinkList[index]}"),
    );
  }

  List educationLinkList = [
    "https://www.wikipedia.org/",
    "https://www.w3schools.com/",
    "https://www.javatpoint.com/",
    "https://www.tutorialspoint.com/index.htm",
  ];
  List educationImageList = [
    "assets/images/education/1.jpg",
    "assets/images/education/2.jpg",
    "assets/images/education/3.png",
    "assets/images/education/4.png",
  ];

  void loadOttURL(int index) {
    webViewController = WebViewController();
    webViewController!.loadRequest(
      Uri.parse("${ottLinkList[index]}"),
    );
  }

  List ottLinkList = [
    "https://www.netflix.com/in/",
    "https://www.hotstar.com/in",
    "https://www.primevideo.com/",
    "https://www.jiotv.com/",
  ];
  List ottImageList = [
    "assets/images/ott/1.jpg",
    "assets/images/ott/2.png",
    "assets/images/ott/3.png",
    "assets/images/ott/4.png",
  ];

  List screenList = [
    EducationScreen(),
    OttScreen(),
  ];

  onClick(int index) {
    i = index;
    notifyListeners();
  }
}
