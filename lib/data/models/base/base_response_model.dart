import 'package:my_quran/domain/entities/base/base_response.dart';

class BaseResponseModel extends BaseResponse {
  BaseResponseModel({
    super.code,
    super.message,
    super.data,
  });

  _initFromEntity(BaseResponse entity) {
    code = entity.code;
    message = entity.message;
    data = entity.data;
  }

  BaseResponseModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as BaseResponse);
    _initFromEntity(dataEntity);
  }

  BaseResponseModel.fromEntity(BaseResponse entity) {
    _initFromEntity(entity);
  }

  BaseResponseModel.fromJson(
    dynamic json,
    Function(dynamic data) response,
  ) {
    if (json != null) {
      code = json['code'];
      message = json['message'];

      var jsonResult = json['data'];
      if (jsonResult != null) {
        data = response(jsonResult);
      }
    }
  }

  Map<String, dynamic> toJson(
    Function(dynamic data) resultData,
  ) {
    final map = <String, dynamic>{};
    if (code != null) {
      map['code'] = code;
    }
    if (message != null) {
      map['message'] = message;
    }
    if (data != null) {
      map['data'] = resultData(data);
    }
    return map;
  }
}
