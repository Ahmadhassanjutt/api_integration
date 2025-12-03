import 'dart:convert';


import 'package:course_api/model/create_job_model.dart';
import 'package:course_api/model/login_model.dart';
import 'package:course_api/model/multi_data_model.dart';
import 'package:http/http.dart' as http;

import '../model/post_list_model.dart';
import '../model/post_model.dart';
import '../model/single_post_model.dart';

class ApiServices{


  //with model
  Future<SinglePostWithModel?> getSinglePostWithModel() async{

    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

      if(response.statusCode == 200){
        SinglePostWithModel model = SinglePostWithModel.fromJson(jsonDecode(response.body));
        return model;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  //without model
  Future<dynamic> getSinglePostWithoutModel() async{

    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data;
      }
    }catch(e){
      print(e.toString());
    }
  }


  //list

  Future<List<PostListModel>?> getPostListModel() async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode == 200){
        print(response.body);
        List<PostListModel> model = List<PostListModel>.from(jsonDecode(response.body).map((x)=>PostListModel.fromJson(x)));
        return model;
      }

    }catch(e){
      print(e.toString());
    }

    return null;
  }
  
  
  //Multi data
Future<MultiData?> getMultipleData() async{
    try{
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if(response.statusCode == 200){
        MultiData model = MultiData.fromJson(jsonDecode(response.body));
        return model;
      }

    }catch(e){
      print(e.toString());
    }

  return null;
}

//Login


Future<LoginModel?>  loginWithModel(String email, String password) async{

    try{
      var url = Uri.parse("https://reqres.in/api/login");
      var response = await http.post(url, body: {
          "email" : email,
          "password": password
      });
      if(response.statusCode == 200){
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        return model;
      }
    }catch(e){
      print(e.toString());
    }
    }

    //Create

  Future<CreateJobModel?> createJob(String email, String job) async{

    try{
      var url = Uri.parse("https://reqres.in/api/users");
      var response = await http.post(url , body: {
        "name": email,
        "job": job,
      });
      if(response.statusCode == 200){
        CreateJobModel model = CreateJobModel.fromJson(jsonDecode(response.body));
        return model;

      }

    }catch(e){
      print(e.toString());
    }

    return null;


  }

}