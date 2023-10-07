class ResponseModal {
  bool? status;
  String? message;
  var data;

  ResponseModal({this.status, this.message, this.data});

  ResponseModal.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"];
  }
}
