// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:dlaundry_mobile/config/app_constants.dart';
import 'package:dlaundry_mobile/config/app_request.dart';
import 'package:dlaundry_mobile/config/app_response.dart';
import 'package:dlaundry_mobile/config/failure.dart';
import 'package:http/http.dart' as http;

class UserDatasource {
  static Future<Either<Failure, Map>> register(
    String username,
    String email,
    String password,
  ) async {
    Uri url = Uri.parse('${AppConstants.baseURL}/register');

    try {
      final response = await http.post(
        url,
        headers: AppRequest.header(),
        body: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      final data = AppResponse.data(response);

      return Right(data);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }

      return Left(FetchFailure(message: e.toString()));
    }
  }
}
