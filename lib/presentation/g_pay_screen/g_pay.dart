import 'package:g_pay/core/g_pay_export.dart';

import 'bloc/g_pay_bloc.dart';


class GPayScreen extends StatefulWidget {
  const GPayScreen({super.key});

  @override
  State<GPayScreen> createState() => _GPayScreenState();
}

class _GPayScreenState extends State<GPayScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GPayBloc>(
      create: (context) => GPayBloc(const GPayState()),
      child: BlocBuilder<GPayBloc, GPayState>(
        builder: (context, state) {
          return _buildHome(context, state);
        },
      ),
    );
  }

  Widget _buildHome(BuildContext context, GPayState state) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container()
        ),
      ),
    );
  }
}
