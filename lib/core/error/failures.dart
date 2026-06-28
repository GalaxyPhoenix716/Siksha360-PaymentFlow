abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure({String message = 'A server error occured'})
    : super(message);
}

class PaymentFailure extends Failure {
  const PaymentFailure({String message = 'Payment failed'}) : super(message);
}

class PaymentValidationFailure extends Failure {
  const PaymentValidationFailure({String message = 'Payment mode not selected'})
    : super(message);
}
