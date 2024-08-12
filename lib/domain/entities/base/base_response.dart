class BaseResponse {
  num? code;
  String? message;
  dynamic data;

  BaseResponse({
    this.code,
    this.message,
    this.data,
  });

  BaseResponse copyWith({
    num? code,
    String? message,
    dynamic data,
  }) =>
      BaseResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );
}
