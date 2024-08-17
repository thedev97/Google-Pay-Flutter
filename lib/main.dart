import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/core/utils/g_pay_string.dart';
import 'package:g_pay/routes/g_pay_routes.dart';
import 'presentation/home_screen/bloc/home_bloc.dart';

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
          BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(const HomeState())),
        ],
        child: MaterialApp(
            theme: theme,
            title: GPayStrings.appTitle,
            debugShowCheckedModeBanner: false,
            initialRoute: GPayRoutes.initialRoute,
            routes: GPayRoutes.routes));
  }
}
