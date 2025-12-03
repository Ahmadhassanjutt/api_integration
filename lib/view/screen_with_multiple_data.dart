import 'package:course_api/model/multi_data_model.dart';
import 'package:course_api/service/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithMultipleData extends StatefulWidget {
  const ScreenWithMultipleData({super.key});

  @override
  State<ScreenWithMultipleData> createState() => _ScreenWithMultipleDataState();
}

class _ScreenWithMultipleDataState extends State<ScreenWithMultipleData> {

  MultiData multiData = MultiData();
  bool isReady = false;
  _getMultiData(){
    isReady = true;
    ApiServices().getMultipleData().then((value){
      setState(() {
        multiData = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMultiData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Multiple data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
    ),
      body: isReady == true?
          const Center(
            child: CircularProgressIndicator()
          ):
          Column(
            children: [
              Text(multiData.page.toString()),
              Text(multiData.perPage.toString()),
              Text(multiData.total.toString()),
              Text(multiData.totalPages.toString()),
              Text(multiData.support.toString()),
              Expanded(
                  child: ListView.builder(
                  itemCount: multiData.data!.length,
                  itemBuilder: (context, i){
                    return Card(
                      child: ListTile(
                        title: Text(multiData.data![i].name.toString()),
                        subtitle: Text(multiData.data![i].year.toString()),
                      ),
                    );
                  }
                  )
              )
            ],
          )
    );
  }
}
