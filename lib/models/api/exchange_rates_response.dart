import 'dart:convert';

import 'package:akaunt_app/models/result.dart';

ExchangeRatesResponse exchangeRatesResponseFromJson(String str) =>
    ExchangeRatesResponse.fromJson(json.decode(str));

String exchangeRatesResponseToJson(ExchangeRatesResponse data) =>
    json.encode(data.toJson());

class ExchangeRatesResponse {
  ExchangeRatesResponse({
    required this.ticker,
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.results,
    required this.status,
    required this.requestId,
    required this.count,
  });

  final String ticker;
  final int queryCount;
  final int resultsCount;
  final bool adjusted;
  final List<Result> results;
  final String status;
  final String requestId;
  final int count;

  ExchangeRatesResponse copyWith({
    String? ticker,
    int? queryCount,
    int? resultsCount,
    bool? adjusted,
    List<Result>? results,
    String? status,
    String? requestId,
    int? count,
  }) =>
      ExchangeRatesResponse(
        ticker: ticker ?? this.ticker,
        queryCount: queryCount ?? this.queryCount,
        resultsCount: resultsCount ?? this.resultsCount,
        adjusted: adjusted ?? this.adjusted,
        results: results ?? this.results,
        status: status ?? this.status,
        requestId: requestId ?? this.requestId,
        count: count ?? this.count,
      );

  factory ExchangeRatesResponse.fromJson(Map<String, dynamic> json) =>
      ExchangeRatesResponse(
        ticker: json["ticker"],
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
      };
}
