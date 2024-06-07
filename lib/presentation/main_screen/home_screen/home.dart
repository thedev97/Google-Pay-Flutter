import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/widgets/app_bar/g_pay_app_bar.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(const HomeState()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return _buildHome(context, state);
        },
      ),
    );
  }

  Widget _buildHome(BuildContext context, HomeState state) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.infinity,
          child: Container(),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return GPayAppBar(
      isDefaultStyle: false,
      actions: [
        Hero(
                tag: 'profile',
                child: CircleAvatar(
                        backgroundImage: AssetImage(GPayImageConstant.gPayUser),
                        radius: 20)
                    .paddingRight(10))
            .onTap(() {}),
      ],
      styleType: Style.bgFill,
    );
  }
}
