import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

class PlacesService {
  static Future<List<Suggestion>> getSuggestion(String input,
      {String? locale, required String googleMapApiKey}) async {
    if (input.isEmpty) return [];

    const uuid = Uuid();
    String sessionToken = uuid.v4();
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';

    String localeComponent =
        locale != null ? " &components=country:$locale" : '';
    String request =
        '$baseURL?input=$input&key=$googleMapApiKey&sessiontoken=$sessionToken$localeComponent';

    log("GET: $request");

    final response = await Dio().get(request);

    if (response.statusCode == 200) {
      final result = response.data;

      log(result['predictions'].toString());

      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>(
              (p) => Suggestion(
                p['place_id'],
                p['description'],
              ),
            )
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(
    this.placeId,
    this.description,
  );

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}
