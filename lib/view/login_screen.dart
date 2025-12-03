import 'package:course_api/model/login_model.dart';
import 'package:course_api/service/api_services.dart';
import 'package:course_api/view/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Login Screen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
    ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter Email",
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Enter Password",
              ),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
                onPressed: (){
                  ApiServices().loginWithModel(emailController.text.toString(), passwordController.text.toString()).then((value){
                    setState(() {
                      loginModel = value!;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(
                        token : loginModel.token.toString(),
                      )));
                    });
                  });
                },
                child: Text("Login")
            ),
          ],
        ),
      ),
    );
  }
}
