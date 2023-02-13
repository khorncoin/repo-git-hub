import 'package:dartz/dartz.dart';

import '../models/example_model.dart';
import '../models/network_error_model/network_error_model.dart';

abstract class ExampleRepository {
  Future<Either<NetworkErrorModel, ExampleModel>> getExample();
}