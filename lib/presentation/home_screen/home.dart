import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/data/data_provider.dart';
import 'package:g_pay/core/utils/g_pay_colors.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/presentation/home_screen/widgets/g_pay_banner.dart';
import 'package:g_pay/presentation/home_screen/widgets/home_top_widget.dart';
import 'package:g_pay/presentation/home_screen/widgets/home_widget.dart';
import 'package:g_pay/presentation/home_screen/widgets/shared/profile_avatar.dart';
import 'package:g_pay/presentation/home_screen/widgets/shared/search_bar.dart';
import 'package:g_pay/widgets/app_bar/g_pay_app_bar.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatModel> getPeopleList = getChatData();
  ScrollController scrollController = ScrollController();

  bool isNewPaymentHide = true;

  final List<String> _hintTexts = [
    "Pay anyone in UPI",
    "Pay by name or phone number",
    "Pay friends and merchants"
  ];
  int _hintIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startHintTextRotation();
  }

  void _startHintTextRotation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        _hintIndex = (_hintIndex + 1) % _hintTexts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
        body: ListView(
          shrinkWrap: true,
          controller: scrollController,
          children: [
            const GPayBanner(),
            20.height,
            const HomeTopViewWidget(),
            20.height,
            Align(
                alignment: Alignment.centerLeft,
                child: Text('People', style: theme.textTheme.titleLarge)
                    .paddingLeft(20)),
            15.height,
            HomeListWidget(getPeopleList: getPeopleList)
                .paddingLeft(8)
                .paddingRight(8),
            20.height,
            Text('Businesses', style: theme.textTheme.titleLarge)
                .paddingOnly(left: 20, right: 20),
            20.height,
            Text('Bills & recharges', style: theme.textTheme.titleLarge)
                .paddingOnly(left: 20, right: 20),
            20.height,
            Text('Offers & rewards', style: theme.textTheme.titleLarge)
                .paddingOnly(left: 20, right: 20),
            //PromotionsList(getPromotionsList: getPromotionsList),
            20.height,
            Text('Manage your money', style: theme.textTheme.titleLarge)
                .paddingOnly(left: 20, right: 20),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.credit_score, color: GPayColors.gpAppColor),
                10.width,
                Text("Check your CIBIL score for free",
                    style: theme.textTheme.titleMedium),
                const Spacer(),
                const Icon(Icons.navigate_next, color: GPayColors.gpLightBlue),
              ],
            ).paddingOnly(left: 20, right: 20).onTap(() {}),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.av_timer_sharp, color: GPayColors.gpAppColor),
                10.width,
                Text("See transaction history",
                    style: theme.textTheme.titleMedium),
                const Spacer(),
                const Icon(Icons.navigate_next, color: GPayColors.gpLightBlue),
              ],
            ).paddingOnly(left: 20, right: 20).onTap(() {}),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_balance_outlined,
                    color: GPayColors.gpAppColor),
                10.width,
                Text("Check bank balance", style: theme.textTheme.titleMedium),
                const Spacer(),
                const Icon(Icons.navigate_next, color: GPayColors.gpLightBlue),
              ],
            ).paddingOnly(left: 20, right: 20),
            20.height,
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return GPayAppBar(
      isDefaultStyle: false,
      title: Row(
        children: [
          Expanded(
            child: GPaySearchBar(hintText: _hintTexts[_hintIndex]),
          ),
          ProfileAvatar(
            imageAsset: GPayImageConstant.gPayUser,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
