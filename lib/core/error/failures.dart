abstract class Failure {
  final String message;
  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('İnternet bağlantısı yok');
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super('Veri bulunamadı');
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure() : super('Beklenmedik bir hata oluştu');
}
