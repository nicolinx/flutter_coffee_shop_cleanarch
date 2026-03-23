class PaymentService {
  Future<bool> processPayment(double amount) async {
    // Simulate network delay for credit card processing
    await Future.delayed(const Duration(seconds: 2));

    // Simulate a successful payment 90% of the time
    return DateTime.now().millisecond % 10 != 0;
  }
}
