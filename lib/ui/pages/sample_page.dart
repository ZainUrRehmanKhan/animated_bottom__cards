import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {

  SamplePage(): super();

  @override
  SamplePageState createState() => SamplePageState();
}

class SamplePageState extends State<SamplePage> with WidgetsBindingObserver {

  @override
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context){

    Widget bodyScaffold = Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          padding : EdgeInsets.only(top: 200),
          child: Text( "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111", overflow: TextOverflow.ellipsis, maxLines: 1,),
        ),
      ),
    );

    return bodyScaffold;
  }
}