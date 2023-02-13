import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:luna/data/models/example_model.dart';
import 'package:luna/data/models/network_error_model/network_error_model.dart';
import 'package:luna/data/repositories/example_repository.dart';

import '../../utils/constants/url_path.dart';
import 'main_services/base_api_service.dart';
import 'main_services/error_handler/network_error_handler.dart';

class ExampleService extends ExampleRepository{

  @override
  Future<Either<NetworkErrorModel, ExampleModel>> getExample() async {


    try {
      var response = await BaseAPIService().get(
        '${UrlPath.product}',
      );

      return Right(ExampleModel.fromJson(response));
    } on DioError catch (e) {
      var error = await NetworkErrorHandler().exec(e);
      return Left(
        NetworkErrorModel(
          title: error!.title,
          description: error.description,
          statusCode: error.statusCode,
        ),
      );
    }
  }

}