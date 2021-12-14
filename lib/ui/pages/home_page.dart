import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool dayTimeBlock = false;
  bool eveningBlock = false;
  bool nightBlock = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xffe3bb88),
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Color(0xff8ba892),
        centerTitle: true,
        title: Text('Weather App'),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xffe3bb88),
            height: size.height,
          ),
          WeatherCard(
            block: dayTimeBlock,
            height: size.height,
            color: Color(0xffdb9864),
            bottomPadding: 200,
            onDrag: (DragUpdateDetails details) {
              if (details.delta.dy > 0 && dayTimeBlock) {
                dayTimeBlock = false;
                eveningBlock = false;
                nightBlock = false;
                setState(() {});
              } else if (details.delta.dy < 0 && !dayTimeBlock) {
                dayTimeBlock = true;
                setState(() {});
              }
            },
          ),
          WeatherCard(
            block: eveningBlock,
            height: size.height,
            color: Color(0xffb1695a),
            bottomPadding: 100,
            onDrag: (DragUpdateDetails details) {
              if (details.delta.dy > 0 && eveningBlock) {
                eveningBlock = false;
                nightBlock = false;
                setState(() {});
              } else if (details.delta.dy < 0 && !eveningBlock) {
                eveningBlock = true;
                dayTimeBlock = true;
                setState(() {});
              }
            },
          ),
          WeatherCard(
            block: nightBlock,
            height: size.height,
            color: Color(0xff644749),
            bottomPadding: 0,
            onDrag: (DragUpdateDetails details) {
              if (details.delta.dy > 0 && nightBlock) {
                nightBlock = false;
                setState(() {});
              } else if (details.delta.dy < 0 && !nightBlock) {
                nightBlock = true;
                eveningBlock = true;
                dayTimeBlock = true;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatefulWidget {
  final bool block;
  final double height;
  final Color color;
  final double bottomPadding;
  final Function(DragUpdateDetails) onDrag;

  WeatherCard(
      {required this.block,
      required this.height,
      required this.color,
      required this.onDrag,
      required this.bottomPadding});

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.bottomPadding),
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            widget.onDrag(details);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: widget.color,
            height: widget.block ? widget.height - 380 : 100,
          ),
        ),
      ),
    );
  }
}
