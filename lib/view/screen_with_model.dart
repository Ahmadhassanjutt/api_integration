
import 'package:flutter/material.dart';

import '../model/single_post_model.dart';
import '../service/api_services.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {

  bool isReady = false;
  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  _getSinglePost(){
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value){
     setState(() {
       singlePostWithModel = value!;
       isReady = false;
     });
    });

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSinglePost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("With model",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body:  isReady == true?
             const Center(child: CircularProgressIndicator(),):
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(singlePostWithModel.userId.toString(),style: const TextStyle(color: Colors.black,fontSize: 20),),

              Text(singlePostWithModel.title.toString(),style: const TextStyle(color: Colors.blue,fontSize: 18),),

              Text(singlePostWithModel.body.toString(),style: const TextStyle(color: Colors.red,fontSize: 16),),

            ],
          )
    );
  }
}
