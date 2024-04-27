import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/routes/g_pay_routes.dart';
import 'core/utils/g_pay_string.dart';
import 'presentation/g_pay_screen/bloc/g_pay_bloc.dart';
import 'theme/theme_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GPayBloc>(
              create: (context) => GPayBloc(const GPayState())),
        ],
        child: MaterialApp(
            theme: theme,
            title: GPayStrings.appTitle,
            debugShowCheckedModeBanner: false,
            initialRoute: GPayRoutes.initialRoute,
            routes: GPayRoutes.routes));
  }
}
