import 'package:dio/dio.dart';

Options get optionsForDio {
 final options = Options(
        followRedirects: false,
            validateStatus: (status) {
              return (status??0) < 600;
            },
            headers: {
              'Content-Type':'application/json'
            }
      );
  return options;
}