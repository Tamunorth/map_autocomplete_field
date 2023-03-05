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

  /// The [MapAutoCompleteField] widget is used here just as any other in a Material App
  /// This sample showcases the barest minimum required to use the Widget.
  ///

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MapTypeAheadField Demo'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                MapAutoCompleteField(
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
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondScreen()));
                    },
                    child: Text('Go to Next'))
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  /// [addressCtrl] :  [TextEditingController] for the MapAutoComplete widget
  final TextEditingController addressCtrl = TextEditingController();

  /// [yourApiKey] : Your Google Places API key
  final String yourApiKey = '';

  /// The [MapAutoCompleteField] widget is used here just as any other in a Material App
  /// This sample showcases the widget with a more robust configuration mostly through the [InputDecoration] parameter.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapTypeAheadField Alt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: MapAutoCompleteField(
          googleMapApiKey: yourApiKey,
          controller: addressCtrl,
          itemBuilder: (BuildContext context, suggestion) {
            return ListTile(
              leading: Icon(Icons.add),
              title: Text(suggestion.description),
            );
          },
          onSuggestionSelected: (suggestion) {
            addressCtrl.text = suggestion.description;
          },
          inputDecoration: const InputDecoration(
            icon: Icon(Icons.add),
            prefixIcon: Icon(Icons.remove),
            suffixIcon: Icon(Icons.access_time_sharp),
            fillColor: Colors.green,
            hintText: 'My Hint',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.green,
              ),
              // borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.green,
              ),
              // borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.green,
              ),
              // borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
