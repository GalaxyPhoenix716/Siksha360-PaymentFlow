enum PaymentMethod {
  creditCard('Credit Card'),
  upi('UPI'),
  netBanking('Net Banking');

  final String label;
  const PaymentMethod(this.label);
}
