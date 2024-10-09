class TimeEntity {
  String utcOffset;
  String timezone;
  int dayOfWeek;
  int dayOfYear;
  DateTime datetime;
  DateTime utcDatetime;
  int unixtime;
  int rawOffset;
  int weekNumber;
  bool dst;
  String abbreviation;
  int dstOffset;
  dynamic dstFrom;
  dynamic dstUntil;
  String clientIp;

  TimeEntity({
    required this.utcOffset,
    required this.timezone,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.datetime,
    required this.utcDatetime,
    required this.unixtime,
    required this.rawOffset,
    required this.weekNumber,
    required this.dst,
    required this.abbreviation,
    required this.dstOffset,
    required this.dstFrom,
    required this.dstUntil,
    required this.clientIp,
  });

  factory TimeEntity.fromJson(Map<String, dynamic> json) {
    return TimeEntity(
        utcOffset: json['utc_offse'],
        timezone: json['timezone'],
        dayOfWeek: json['day_of_week'],
        dayOfYear: json['day_of_year'],
        datetime: json['datetime'],
        utcDatetime: json['utc_datetime'],
        unixtime: json['unixtime'],
        rawOffset: json['raw_offset'],
        weekNumber: json['week_number'],
        dst: json['dst'],
        abbreviation: json['abbreviation'],
        dstOffset: json['dst_offset'],
        dstFrom: json['dst_from'],
        dstUntil: json['dst_until'],
        clientIp: json['client_ip']);
  }
}
