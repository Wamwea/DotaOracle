import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/networking.dart';
import 'DataScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic myPackage;
  dynamic profileData;
  void getThatResponse() async {
    await GetResponse().getPlayerData();
    myPackage = await GetResponse().getPlayerData();
    profileData = await GetResponse().getPlayerProfileData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DataScreen(
        matchInfo: myPackage,
        profileInfo: profileData,
      );
    }));
  }

  void initState() {
    super.initState();
    getThatResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Container(
            color: Colors.black,
            child: Image.asset(
              'images/backgroundimage.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DataScreen(
                    matchInfo: null,
                  );
                }));
              });
            },
            child: Container(
                width: double.infinity,
                color: Colors.purple,
                child: SpinKitPouringHourglass(
                  color: Colors.purpleAccent,
                  size: 60,
                )),
          ),
        )
      ],
    )));
  }
}
