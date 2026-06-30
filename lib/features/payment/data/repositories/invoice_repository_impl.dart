import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';
import 'package:siksha360_task/features/payment/domain/repositories/invoice_repository.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceRepositoryImpl extends InvoiceRepository {
  @override
  Future<String> generateInvoice(PaymentTransaction transaction) async {
    final pdf = pw.Document();
    // 1. Build the PDF Layout
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(level: 0, text: 'Siksha360 Invoice'),
              pw.SizedBox(height: 20),
              pw.Text('Transaction ID: ${transaction.transactionId}'),
              pw.Text('Date: ${transaction.timestamp.toLocal()}'),
              pw.Text(
                'Receiver: ${transaction.receiverName} (${transaction.receiverType})',
              ),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Text(
                'Amount Paid: Rs.${transaction.amount}',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text('Payment Method: ${transaction.paymentMethod.label}'),
              pw.SizedBox(height: 40),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  'Thank you for choosing Siksha360!',
                  style: const pw.TextStyle(fontSize: 12),
                ),
              ),
            ],
          );
        },
      ),
    );

    // 2. Save the PDF file to local storage
    final outputDir = await getApplicationDocumentsDirectory();
    final file = File(
      '${outputDir.path}/invoice_${transaction.transactionId}.pdf',
    );
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }
}
