enum ResponseStates { SUCCESS, WARNING, ERROR, LOADING }

class DataResponse {

  ResponseStates state;
  dynamic data;
  String msm;

  DataResponse(ResponseStates state, dynamic data, String msm) {
    this.state = state;
    this.data = data;
    this.msm = msm;
  }

}