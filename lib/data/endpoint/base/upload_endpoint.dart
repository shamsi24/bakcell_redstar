import 'package:dio/dio.dart';
import 'package:redstar_module/data/endpoint/base/endpoint.dart';

abstract class UploadEndpoint extends Endpoint {
  FormData data();
}
