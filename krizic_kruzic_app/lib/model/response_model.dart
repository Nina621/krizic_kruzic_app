class ResponseModel {
  bool isSuccess;
  String message;

  ResponseModel({
    required this.isSuccess,
    required this.message,
  });

  bool get getIsSuccess => isSuccess;

  String get getMessage => message;
}
