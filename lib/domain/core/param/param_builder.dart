import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class ParamBuilder {
  final Map<String, dynamic> _params = {};


  ParamBuilder._();


  factory ParamBuilder() => ParamBuilder._();


  ParamBuilder addParam({
    required String key,
    required dynamic value,
  }) {
    _params[key] = value;
    return this;
  }


  Future<ParamBuilder> addFormData<T>({
    required T param,
    required String key,
  }) async {
    MultipartFile? data;
    if (param is File) {
      data = await MultipartFile.fromFile(
        param.path,
      );
    } else if (param is Uint8List) {
      data = MultipartFile.fromBytes(param);
    } else {
      throw ArgumentError('Unsupported type: ${param.runtimeType}');
    }

    _params[key] = data;
    return this;
  }

  FormData addMultipleFile(List<String> paths) {
    final formData = FormData.fromMap(build());

    for (var path in paths) {
      formData.files.add(
        MapEntry(
          'uploadDocument',
          MultipartFile.fromFileSync(
            path,
            filename: path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    return formData;
  }


  Map<String, dynamic> build() => _params;
}
