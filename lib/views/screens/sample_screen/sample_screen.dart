import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luna/data/services/main_services/base_service.dart';

import '../../../data/models/sample_model/sameple_model.dart';
import '../../../logic/bloc/sample_bloc/sample_bloc.dart';
import '../../../logic/cubit/sample_cubit/sample_cubit.dart';
import '../../widgets/loading/loading.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  List<Result?>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            SampleBloc()..add(SampleFetchDataEvent())
              ,
          ),
          BlocProvider(
            create: (context) => SampleCubit(true),
          ),
        ],
        child: Builder(
            builder: (context) {
              return BlocBuilder<SampleBloc, SampleState>(
                builder: (context, state) {
                  if (state is SampleLoadingState) {
                    return const LoadingScreen();
                  } else if (state is SampleFailState) {
                    return const Center(
                      child: Text("Failed"),
                    );
                  } else if (state is SampleSuccessState) {
                    data = state.data;
                  }
                  return Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 100,),
                          BlocBuilder<SampleCubit, bool>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: (){
                                  context
                                      .read<SampleCubit>()
                                      .onSampleChange();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,
                                      vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: context.read<SampleCubit>().value? Colors.white:Colors.red
                                  ),
                                  child: const Text("Button"),
                                ),
                              );
                            },
                          ),
                          Expanded(

                            child: ListView.builder(
                              itemCount: data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                    },
                                    child: Container(

                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${data?[index]?.title}"),
                                              Icon(Icons.delete_forever,size: 35,)
                                            ],
                                          ),
                                          const SizedBox(height: 20,),
                                          Image.network("${BaseService().baseUrlHost}/${data?[index]!.image}")
                                        ],
                                      ),
                                    ));
                              },

                            ),
                          ),
                        ],
                      )

                  );
                },
              );
            }
        ),
      ),
    );
  }
}
