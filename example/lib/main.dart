import 'package:flutter/material.dart';
import 'package:map_autocomplete_field/map_autocomplete_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController addressCtrl = TextEditingController();

  final String yourMapApiKey = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MapTypeAheadField Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25.0),
          child: MapAutoCompleteField(
            googleMapApiKey: yourMapApiKey,
            controller: addressCtrl,
            itemBuilder: (BuildContext context, suggestion) {
              return ListTile(
                title: Text(suggestion.description),
              );
            },
            onSuggestionSelected: (suggestion) {
              addressCtrl.text = suggestion.description;
            },
          ),
        ),
      ),
    );
  }
}
