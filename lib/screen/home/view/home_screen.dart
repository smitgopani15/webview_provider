import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.menu_outlined,
            color: Colors.white,
            size: 25,
          ),
          title: Row(
            children: [
              Text(
                "allin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "One",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            homeProviderTrue!.screenList[homeProviderTrue!.i],
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color: Colors.white,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: GNav(
                  onTabChange: (value) {
                    homeProviderFalse!.onClick(value);
                  },
                  tabBorderRadius: 15,
                  tabActiveBorder: Border.all(color: Colors.blue, width: 2.5),
                  tabBorder: Border.all(color: Colors.white, width: 2),
                  gap: 8,
                  color: Colors.white,
                  activeColor: Colors.blue,
                  iconSize: 24,
                  tabBackgroundColor: Colors.white.withOpacity(0.1),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  tabs: [
                    GButton(
                      icon: Icons.book,
                      text: "Education",
                    ),
                    GButton(
                      icon: Icons.local_movies_rounded,
                      text: "Ott",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
