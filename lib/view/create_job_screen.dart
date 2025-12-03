import 'package:course_api/model/create_job_model.dart';
import 'package:course_api/service/api_services.dart';
import 'package:course_api/view/see_my_job_screen.dart';
import 'package:flutter/material.dart';
class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({super.key});

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  CreateJobModel createJobModel = CreateJobModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Create Job Screen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                hintText: "Job",
              ),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
                onPressed: (){
                  ApiServices().createJob(nameController.text.toString(),jobController.text.toString()).then((value){
                    setState(() {
                      createJobModel = value!;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeMyJobScreen(
                        id: createJobModel.id.toString(),
                        name: createJobModel.name.toString(),
                        job: createJobModel.job.toString(),

                      )));
                    });
                  });
                },
                child: const Text("Create Job")
            ),
          ],
        ),
      ),
    );
  }
}
