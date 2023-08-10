part of com.akaunt.app.widgets;

class StatisticsChart extends StatefulWidget {
  const StatisticsChart({
    required this.exchangeRateState,
    required this.onResultSelected,
    Key? key,
  }) : super(key: key);
  final ExchangeRateState exchangeRateState;
  final Function(dynamic) onResultSelected;
  @override
  State<StatisticsChart> createState() => _StatisticsChartState();
}

class _StatisticsChartState extends State<StatisticsChart> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true, builder: toolTipBuilder);
  }

  Widget toolTipBuilder(data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) =>
      Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getPointerCurrency(pointIndex),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 2),
              Text(
                getPointerDate(pointIndex),
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ));

  String getPointerCurrency(int index) {
    final exchangeRate = widget.exchangeRateState.getCurrentExchangeRate();
    return DataFormatter.valueCurrency(exchangeRate!.results[index].closed);
  }

  String getPointerDate(int index) {
    final exchangeRate = widget.exchangeRateState.getCurrentExchangeRate();

    return DataFormatter.getDateFormatted(exchangeRate!.results[index].time);
  }

  @override
  Widget build(BuildContext context) {
    final exchangeRate = widget.exchangeRateState.getCurrentExchangeRate();
    final size = MediaQuery.of(context).size;
    final List<Color> color = <Color>[];
    final List<double> stops = <double>[];

    color.add(AkauntColors.green);
    color.add(AkauntColors.green.withOpacity(0.7));
    color.add(AkauntColors.green.withOpacity(0));

    stops.add(0.0);
    stops.add(0.7);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
      colors: color,
      stops: stops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    if (widget.exchangeRateState.fetchingNewData) {
      return Container(
          height: size.height * 0.3,
          alignment: Alignment.center,
          child: const CircularProgressIndicator());
    }

    return SfCartesianChart(
      enableMultiSelection: false,
      tooltipBehavior: _tooltipBehavior,
      primaryXAxis: CategoryAxis(),
      series: <RangeAreaSeries<Result, String>>[
        RangeAreaSeries<Result, String>(
          onPointTap: (details) {
            final pointsList = exchangeRate!.results;
            final resultSelected = pointsList[details.pointIndex!];
            widget.onResultSelected(resultSelected);
          },
          gradient: gradientColors,
          highValueMapper: (result, index) {
            if (exchangeRate!.results.length > 1) {
              return result.closed;
            }
            if (index == 0) {
              return result.open;
            }
            if (index == 1) {
              return result.closed;
            }
            return result.closed;
          },
          lowValueMapper: (sales, __) {
            return 0;
          },

          // Bind data source
          dataSource: exchangeRate?.results ?? [],
          xValueMapper: (Result result, int index) {
            switch (widget.exchangeRateState.currentTimeRange!) {
              case TimeRange.oneDay:
                String monthName = DateFormat('MMM').format(result.time);

                return "$monthName ${result.time.day}";

              case TimeRange.fiveDays:
                String monthName = DateFormat('MMM').format(result.time);

                return "$monthName ${result.time.day}";

              case TimeRange.oneMonth:
                String monthName = DateFormat('MMM').format(result.time);

                return "$monthName ${result.time.day}";

              case TimeRange.oneYear:
                String monthName = DateFormat('MMM').format(result.time);
                return "$monthName ${result.time.year}";

              case TimeRange.twoYears:
                String monthName = DateFormat('MMM').format(result.time);
                return "$monthName ${result.time.year}";
            }
          },
        ),
      ],
    );
  }
}
