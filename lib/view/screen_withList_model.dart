import 'package:course_api/model/post_list_model.dart';
import 'package:course_api/model/post_model.dart';
import 'package:course_api/service/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithlistModel extends StatefulWidget {
  const ScreenWithlistModel({super.key});

  @override
  State<ScreenWithlistModel> createState() => _ScreenWithlistModelState();
}
class _ScreenWithlistModelState extends State<ScreenWithlistModel> {

  bool isReady = false;
 List<PostListModel> postListModel = [];
  _getPost(){
    isReady = true;
    ApiServices().getPostListModel().then((value){
      setState(() {
        isReady = false;
       postListModel = value!;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPost();
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
         const Center(
           child: CircularProgressIndicator()):
         ListView.builder(
           itemCount: postListModel.length,
             itemBuilder: (context, index){
               return  Card(
                 child: ListTile(
                   title: Text(postListModel[index].title.toString()),
                   subtitle: Text(postListModel[index].body.toString()),
                 ),
               );
             },
         )
    );
  }
}
