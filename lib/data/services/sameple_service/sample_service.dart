import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:luna/data/models/sample_model/sameple_model.dart';
import 'package:luna/utils/constants/url_path.dart';
import '../../models/network_error_model/network_error_model.dart';
import '../../repositories/sample_repository/sample_repository.dart';
import '../main_services/base_api_service.dart';
import '../main_services/error_handler/network_error_handler.dart';


class SampleService  extends SampleRepository{

  @override
  Future<Either<NetworkErrorModel, Sample1Model>> getSample({int? page}) async {
    // TODO: implement getSample
    try {
      var response = await BaseAPIService().get(
        '${UrlPath.product}',
      );

      log("message-------${response}");
      return Right(Sample1Model.fromJson(response));
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