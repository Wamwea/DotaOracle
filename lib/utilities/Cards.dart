import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild, this.textInfo, this.flex, this.functionality});
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
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textInfo != null ? textInfo : null,
              cardChild != null ? cardChild : null,
            ],
          ),
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  IconCard({
    @required this.cardChild,
    this.flex,
  });
  final Widget cardChild;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kCardColor,
          border: Border.all(color: kBorderColor, width: 2),
          shape: BoxShape.circle,
        ),
        child: cardChild,
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
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            cardData,
            style: kNumberTextStyle,
          ),
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  DataCard({
    this.functionality,
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.flex,
  });
  final int flex;
  final String data1;
  final String data2;
  final String data3;
  final String data4;
  final Function functionality;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NumberCard(data1),
          NumberCard(data2),
          NumberCard(data3),
          NumberCard(data4)
        ],
      ),
    );
  }
}
