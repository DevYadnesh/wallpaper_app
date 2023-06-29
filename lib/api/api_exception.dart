class ApiException implements Exception{
  String header;
  String msg;

  ApiException({required this.header,required this.msg});

  @override
  String toString(){
    return "$header : $msg";
  }
}

class UnAuthorizedException extends ApiException{
  UnAuthorizedException(String msg) : super(header:'UnAuthorized Exception' ,msg:msg) ;
}
class FetchDataException extends ApiException{
  FetchDataException(String msg) : super(header:'Data Exception' ,msg:msg) ;
}
class BadRequestException extends ApiException{
  BadRequestException(String msg) : super(header:'BadRequestException' ,msg:msg) ;
}
class InvalidInputException extends ApiException{
  InvalidInputException(String msg) : super(header:'InvalidInputException' ,msg:msg) ;
}