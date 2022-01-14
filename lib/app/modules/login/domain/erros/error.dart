abstract class LoginFailure implements Exception {}

class DataSourceError extends LoginFailure {

}

class DataSourceNullError extends LoginFailure {
  
}
