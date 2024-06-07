import 'package:g_pay/core/g_pay_export.dart';

class GPayTextFormField extends StatelessWidget {
  final String label;

  const GPayTextFormField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: theme.textTheme.titleSmall!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black45),
        ),
      ),
    );
  }
}
