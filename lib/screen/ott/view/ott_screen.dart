import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/provider/home_provider.dart';

class OttScreen extends StatefulWidget {
  const OttScreen({Key? key}) : super(key: key);

  @override
  State<OttScreen> createState() => _OttScreenState();
}

class _OttScreenState extends State<OttScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello !",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Smit Gopani",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 362,
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          homeProviderFalse!.loadOttURL(index);
                          Navigator.pushNamed(context, 'open_screen');
                        },
                        child: boxUI(
                          homeProviderFalse!.ottImageList[index],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Best Entertainment",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Content !",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget boxUI(String image) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.blue.shade600,
          width: 6,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "$image",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
