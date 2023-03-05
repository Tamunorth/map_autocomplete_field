# map_autocomplete_field

![version](https://img.shields.io/badge/version-0.0.1-blue.svg)

This package provides the responses from Google places api as options on a Dropdown, the Dropdown is
a modified TextField.

This custom widget combines the functionality of Dropdown and TexField and as such is easily
dismissed when focus is lost, which was something lacking in most of the solutions out there, which
was one of the main triggers for this solution.

Another slight issue this aims to solve is to provide a highly customisable TextField solution for
Google Places API, Providing a widget that naturally blends with your already existing custom
TextField, just with a slight super-power.




 <img src="https://res.cloudinary.com/dxfwzjz4k/image/upload/v1677955495/GitHub%20Pakages/Simulator_Screen_Shot_-_iPhone_13_mini_-_2023-03-04_at_19.44.10_t3iuid.png" alt="preview" width="300"/> 
 <img src="https://res.cloudinary.com/dxfwzjz4k/image/upload/v1677994380/GitHub%20Pakages/Simulator_Screen_Shot_-_iPhone_13_mini_-_2023-03-05_at_06.31.58_dxbk4m.png" alt="preview" width="300"/> 

## Getting Started

To install, add it to your `pubspec.yaml` file:

```
dependencies:
    map_autocomplete_field: <latest>

```

## How to use it

```dart
import 'package:map_autocomplete_field/map_autocomplete_field.dart';
```

## Simple Implementation

```dart

Widget build(BuildContext context) {
  return Scaffold(
      body: Center(
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
          )
      )
  );
}
```

## With more customisation

```dart

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('MapTypeAheadField Alt'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(25),
      child: MapAutoCompleteField(
        googleMapApiKey: yourMapApiKey,
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
```

The constructor has 8 attributes related to the API:

- `String googleMapApiKey` is a required attribute. It is the Google Maps API Key your application
  is using, make sure Places API is enabled on the Google Developer console.

- `(Place) void onSuggestionSelected` is a callback function called when the user selects one of the
  autocomplete options.

- `String locale` A location which you would like to restrict your results. Check the full list
  of [supported  country code](Wikipedia: List of ISO 3166 country codes or the ISO Online Browsing
  Platform) in the documentation.

### The `Suggestion` class

This class will be returned on the `onSuggestionSelected` methods. It allows us to get more
information about the user selected place.

Initially, it provides you with only basic information:

- `description` contains the human-readable name for the returned result. For establishment results,
  this is usually the business name.
- `placeId`A textual identifier that uniquely identifies a place. For more information about place
  IDs, see the [Place IDs](https://developers.google.com/places/web-service/place-id) overview.


