part of com.akaunt.app.widgets;

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({
    required this.exchangeRateState,
    required this.onResultSelected,
    Key? key,
  }) : super(key: key);

  final ExchangeRateState exchangeRateState;
  final Function(dynamic) onResultSelected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomCard(
        width: size.width * 0.8,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TRM',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.oppositeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'USD > COP',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.oppositeColor,
                    ),
                  ),
                ],
              ),
            ),
            StatisticsChart(
              exchangeRateState: exchangeRateState,
              onResultSelected: onResultSelected,
            )
          ],
        ));
  }
}
