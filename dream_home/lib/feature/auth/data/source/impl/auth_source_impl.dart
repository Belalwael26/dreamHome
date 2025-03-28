import 'package:dream_home/core/constant/end_points.dart';
import 'package:dream_home/core/network/dio/base_dio.dart';
import 'package:dream_home/feature/auth/data/source/base/auth_source.dart';

class AuthSourceImpl implements AuthSource {
  final BaseDio _dio;

  AuthSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post(EndPoints.login, data: {
        "email": email,
        "password": password,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
