import 'package:flutter/material.dart';
import 'package:mydotastats/utilities/constants.dart';
import 'package:mydotastats/utilities/Cards.dart';

List<Widget> listBuilder(int noOfItems) {
  List<Widget> listItems = [];
  for (int x = 0; x < noOfItems; x++) {
    Widget rowItem = DataCard(
      data1: x.toString(),
      data2: (x + 1).toString(),
      data3: (x + 2).toString(),
      data4: (x + 3).toString(),
    );
    listItems.add(rowItem);
  }
  return listItems;
}

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MATCHDATA'),
      ),
      body: SafeArea(
          child: Container(
        color: kBackGroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: DataCard(
                data1: 'KILLS',
                data2: 'DEATHS',
                data3: 'Assists',
                data4: 'TEAM',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 9,
              child: Container(
                decoration: defaultBorderDecoration,
                child: ListView(
                  children: listBuilder(50),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
