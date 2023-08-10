part of com.akaunt.app.pages;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(exchangeRateProvider.notifier)
          .getExchangeRatesByTimeRange(range: TimeRange.oneDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    ExchangeRateState exchangeRateState = ref.watch(exchangeRateProvider);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Column(
              children: [
                const CustomAppBar(),
                SelectedTdcInfoCard(
                  exchangeRateState: exchangeRateState,
                ),
                const SizedBox(height: 30),
                // ignore: prefer_const_constructors
                StatisticsContainer(
                  exchangeRateState: exchangeRateState,
                  onResultSelected: (dynamic result) {
                    ref
                        .read(exchangeRateProvider.notifier)
                        .selectResult(result as Result);
                  },
                ),
                DefaultTimesList(
                  exchangeRateState: exchangeRateState,
                  onChangeTimeRange: (TimeRange timeRange) {
                    ref
                        .read(exchangeRateProvider.notifier)
                        .getExchangeRatesByTimeRange(range: timeRange);
                  },
                ),
              ],
            ),
            const Positioned(bottom: 0, child: CustomBottomBarNavigator())
          ],
        ),
      ),
    );
  }
}
