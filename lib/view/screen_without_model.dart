import 'package:flutter/material.dart';

import '../service/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {

  bool isReady = false;
  dynamic singlePost;
  _getSingleData(){
    isReady = true;
    ApiServices().getSinglePostWithoutModel().then((value){
      setState(() {
        isReady = false;
        singlePost = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSingleData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text("Without model",style: TextStyle(fontSize: 30,color: Colors.white),),
        ),
        body: isReady == true?
        const Center(child: CircularProgressIndicator(),):
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(singlePost["userId"].toString(),style: const TextStyle(color: Colors.black,fontSize: 30),),
            Text(singlePost["title"].toString(),style: const TextStyle(color: Colors.blue,fontSize: 30),),
            Text(singlePost["body"].toString(),style: const TextStyle(color: Colors.red,fontSize: 30),),
          ],
        )
    );
  }
}
