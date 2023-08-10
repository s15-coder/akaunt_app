class Result {
  Result({
    required this.v,
    required this.vw,
    required this.open,
    required this.closed,
    required this.h,
    required this.l,
    required this.time,
    required this.n,
  });

  final int v;
  final double vw;
  final double open;
  final double closed;
  final double h;
  final double l;
  final DateTime time;
  final int n;

  Result copyWith({
    int? v,
    double? vw,
    double? open,
    double? closed,
    double? h,
    double? l,
    DateTime? time,
    int? n,
  }) =>
      Result(
        v: v ?? this.v,
        vw: vw ?? this.vw,
        open: open ?? this.open,
        closed: closed ?? this.closed,
        h: h ?? this.h,
        l: l ?? this.l,
        time: time ?? this.time,
        n: n ?? this.n,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        v: json["v"] ?? 0,
        vw: json["vw"]?.toDouble() ?? 0,
        open: json["o"].toDouble(),
        closed: json["c"].toDouble(),
        h: json["h"].toDouble(),
        l: json["l"].toDouble(),
        time: DateTime.fromMillisecondsSinceEpoch(json["t"]),
        n: json["n"],
      );

  Map<String, dynamic> toJson() => {
        "v": v,
        "vw": vw,
        "o": open,
        "c": closed,
        "h": h,
        "l": l,
        "t": time,
        "n": n,
      };
}
