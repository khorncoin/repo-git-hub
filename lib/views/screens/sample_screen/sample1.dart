import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luna/data/services/main_services/base_service.dart';

import '../../../data/models/sample_model/sameple_model.dart';
import '../../../logic/bloc/sameple1_bloc/sample1_bloc.dart';
// import '../../../logic/bloc/sample_bloc/sample_bloc.dart';
import '../../widgets/loading/loading.dart';
import 'dart:convert';

class Sample1 extends StatefulWidget {
  const Sample1({Key? key}) : super(key: key);

  @override
  State<Sample1> createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> {
  List<Result> data=[
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      Sample1Bloc()
        ..add(GetDataEvent()),
      child: Builder(
          builder: (context) {
            return Scaffold(
              body: BlocBuilder<Sample1Bloc, Sample1State>(
                builder: (context, state) {
                  if(state is Sample1Loading){
                    return const LoadingScreen();
                  }else if(state is Sample1Failed){
                    return const Center(
                      child: Text("Failed"),
                    );

                  }else if(state is Sample1Success){
                    data = state.data;
                  }
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        return Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Name:${data[index].title}"),
                                  InkWell(
                                      onTap: (){
                                        context.read<Sample1Bloc>().add(RemoveDataEvent(data,data[index].id));
                                      },
                                      child: Icon(Icons.delete_forever,size: 30,))
                                ],
                              ),
                              Image.network("${BaseService().baseUrlHost}/${data[index].image}")
                            ],
                          ),
                        );
                      });
                },
              ),
            );
          }
      ),
    );
  }
}




SampleModel sampleModelFromJson(String str) => SampleModel.fromJson(json.decode(str));

String sampleModelToJson(SampleModel data) => json.encode(data.toJson());

class SampleModel {
  SampleModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
