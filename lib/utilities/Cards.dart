import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.cardChild, this.textInfo, this.flex, this.functionality});
  final Widget cardChild;
  final Widget textInfo;
  final int flex;
  final Function functionality;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: functionality,
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(1),
          decoration: defaultBorderDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textInfo,
              cardChild,
            ],
          ),
        ),
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  NumberCard(this.cardData);
  final String cardData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: defaultBorderDecoration,
        child: Center(
          child: Text(
            cardData != null ? cardData : '',
            style: kNumberTextStyle,
          ),
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  DataCard(
      {this.functionality,
      this.data1,
      this.data2,
      this.data3,
      this.data4,
      this.flex});
  final int flex;
  final String data1;
  final String data2;
  final String data3;
  final String data4;
  final Function functionality;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        NumberCard(data1),
        NumberCard(data2),
        NumberCard(data3),
        NumberCard(data4)
      ],
    );
  }
}
