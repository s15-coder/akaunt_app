part of com.akaunt.app.widgets;

class DefaultTimesList extends StatelessWidget {
  const DefaultTimesList({
    required this.exchangeRateState,
    required this.onChangeTimeRange,
    Key? key,
  }) : super(key: key);

  final ExchangeRateState exchangeRateState;
  final Function(TimeRange) onChangeTimeRange;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DefaultTime(
            label: '2 Años',
            filled: exchangeRateState.currentTimeRange == TimeRange.twoYears,
            onTap: () => onChangeTimeRange(TimeRange.twoYears),
          ),
          DefaultTime(
            label: '1 Año',
            filled: exchangeRateState.currentTimeRange == TimeRange.oneYear,
            onTap: () => onChangeTimeRange(TimeRange.oneYear),
          ),
          DefaultTime(
            label: '1 Mes',
            filled: exchangeRateState.currentTimeRange == TimeRange.oneMonth,
            onTap: () => onChangeTimeRange(TimeRange.oneMonth),
          ),
          DefaultTime(
            label: '5 Días',
            filled: exchangeRateState.currentTimeRange == TimeRange.fiveDays,
            onTap: () => onChangeTimeRange(TimeRange.fiveDays),
          ),
          DefaultTime(
            label: '1 Día',
            filled: exchangeRateState.currentTimeRange == TimeRange.oneDay,
            onTap: () => onChangeTimeRange(TimeRange.oneDay),
          ),
        ],
      ),
    );
  }
}

class DefaultTime extends StatelessWidget {
  const DefaultTime({
    Key? key,
    required this.label,
    this.filled = false,
    this.onTap,
  }) : super(key: key);
  final String label;
  final bool filled;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RectangleRoundedButton(
      onTap: onTap,
      filled: filled,
      label: label,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      fontSize: 15,
    );
  }
}
