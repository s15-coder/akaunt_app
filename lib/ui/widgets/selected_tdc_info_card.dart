part of com.akaunt.app.widgets;

class SelectedTdcInfoCard extends StatelessWidget {
  const SelectedTdcInfoCard({required this.exchangeRateState, Key? key})
      : super(key: key);
  final ExchangeRateState exchangeRateState;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
        child: CustomCard(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * .05),
      width: size.width * 0.8,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DataFormatter.valueCurrency(
                    exchangeRateState.selectedResult?.closed),
                style: Headings.h1.copyWith(
                  color: Theme.of(context).colorScheme.oppositeColor,
                ),
              ),
              const RectangleRoundedButton(
                filled: true,
                label: 'COP',
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  exchangeRateState.selectedResult != null
                      ? '= 1 USD'
                      : '= ------',
                  style: Headings.h5.copyWith(
                      color: Theme.of(context).colorScheme.oppositeColor),
                ),
              ),
              Text(
                exchangeRateState.selectedResult != null
                    ? DataFormatter.getDateFormatted(
                        exchangeRateState.selectedResult!.time,
                      )
                    : '--- / ---- / ------',

                // 'Nov 19th 4:20pm',
                style: TextStyle(
                  fontSize: 10,
                  color: AkauntColors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
