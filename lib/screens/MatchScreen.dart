import 'package:flutter/material.dart';
import 'package:mydotastats/utilities/constants.dart';
import 'package:mydotastats/utilities/Cards.dart';
import 'package:mydotastats/services/networking.dart';

class MatchScreen extends StatefulWidget {
  MatchScreen(this.matchData);
  final dynamic matchData;
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  List<Widget> listBuilder() {
    dynamic matchinfo = widget.matchData != null ? widget.matchData : null;
    int noOfItems = GetData.noOfMatches;
    List<Widget> listItems = [];
    for (int x = 0; x < noOfItems; x++) {
      String winOrLose() {
        if ((widget.matchData[x]['player_slot'] <= 127 &&
                widget.matchData[x]['radiant_win'] == true) ||
            (widget.matchData[x]['player_slot'] >= 128 &&
                widget.matchData[x]['radiant_win'] == false)) {
          return 'W';
        } else {
          return 'L';
        }
      }

      Widget rowItem = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1, child: Text('${x + 1}: ', style: kLabelTextStyle)),
          Expanded(
            flex: 20,
            child: DataCard(
              data1: matchinfo != null ? matchinfo[x]['kills'].toString() : '0',
              data2:
                  matchinfo != null ? matchinfo[x]['deaths'].toString() : '0',
              data3:
                  matchinfo != null ? matchinfo[x]['assists'].toString() : '0',
              data4: matchinfo != null ? winOrLose() : 'N/A',
            ),
          )
        ],
      );
      listItems.add(rowItem);
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'MATCHDATA',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('images/matchScreenImage.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: DataCard(
                data1: 'KILLS',
                data2: 'DEATHS',
                data3: 'ASSISTS',
                data4: 'WIN/LOSE',
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: defaultListViewBorderDecoration,
                child: ListView(
                  children: listBuilder(),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
