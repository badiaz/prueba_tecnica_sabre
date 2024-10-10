import 'dart:convert';

import 'package:time_zone_app/domain/entities/time_entity.dart';
import 'package:time_zone_app/infrastructure/repositories/time/timezone_respository_interface.dart';

import 'package:http/http.dart' as http;

class TimezoneRepository implements TimezoneRespositoryInterface {
  final String baseUrl = 'http://worldtimeapi.org/api';

  @override
  Future<TimeEntity> getTimeForTimeZone({required String timeZone}) async {
    final response = await http.get(Uri.parse('$baseUrl/timezone/$timeZone'));
    if (response.statusCode == 200) {
      return TimeEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<String>> getTimeZones() async {
    final response = await http.get(Uri.parse('$baseUrl/timezone'));
    if (response.statusCode == 200) {
      {
        return List<String>.from(json.decode(response.body));
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<TimeEntity> getCurrentTimeZone() async {
    final response = await http.get(Uri.parse('$baseUrl/ip'));
    if (response.statusCode == 200) {
      return TimeEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
}
