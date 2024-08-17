import 'package:g_pay/core/g_pay_export.dart';

class HomeTopViewWidget extends StatelessWidget {
  const HomeTopViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 8,
          children: [
            _buildGridItem(Icons.qr_code_scanner, "Scan any\nQR code"),
            _buildGridItem(Icons.contacts, "Pay\ncontacts"),
            _buildGridItem(Icons.phone, "Pay phone\nnumber"),
            _buildGridItem(Icons.account_balance, "Bank\ntransfer"),
            _buildGridItem(Icons.payment, "Pay UPI ID\nor number"),
            _buildGridItem(Icons.transform, "Self\ntransfer"),
            _buildGridItem(Icons.receipt, "Pay\nbills"),
            _buildGridItem(Icons.phone_android, "Mobile\nrecharge"),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 25, color: Colors.blue),
        8.height,
        Text(title,
            textAlign: TextAlign.center, style: theme.textTheme.titleSmall),
      ],
    );
  }
}
