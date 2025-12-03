import 'package:flutter/material.dart';
class SeeMyJobScreen extends StatefulWidget {

  final String? id;
  final String? name;
  final String? job;

  const SeeMyJobScreen({super.key, this.id, this.name, this.job});

  @override
  State<SeeMyJobScreen> createState() => _SeeMyJobScreenState();
}

class _SeeMyJobScreenState extends State<SeeMyJobScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("See My Job",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
    body: Column(
      children: [
        Text("id : ${widget.id} "),
        Text("name : ${widget.name} "),
        Text("job : ${widget.job} "),
      ],
    ),
    );
  }
}
