import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luna/data/services/main_services/base_service.dart';
import 'package:luna/logic/bloc/example_bloc/example_bloc.dart';

import '../../../data/models/example_model.dart';
import '../../widgets/loading/loading.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  List<Result> data=[];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ExampleBloc()
        ..add(GetDataEvent()),
      child: Scaffold(
        body: Builder(
            builder: (context) {
              return BlocBuilder<ExampleBloc, ExampleState>(
                builder: (context, state) {
                  if(state is ExampleLoading){
                    return const LoadingScreen();
                    
                  }else if(state is ExampleFailed){
                    return Center(child: Text("Failed"),);
                    
                  }else if(state is ExampleSuccess){
                    data = state.data;
                  }
                  
                  
                  
                  return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context,index){
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text("Product: ${data[index].title}"),
                              InkWell(
                                  onTap:(){

                                    context.read<ExampleBloc>().add(RemoveItem(data, data[index].id));

                        },
                                  child: Icon(Icons.delete,size: 30,))
                            ],
                          ),
                          Image.network("${BaseService().baseUrlHost}/${data[index].image}")
                        ],
                      );
                      });
                },
              );
            }
        ),
      ),
    );
  }
}
