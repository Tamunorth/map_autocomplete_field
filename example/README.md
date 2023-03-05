# search_place_autocomplete

![version](https://img.shields.io/badge/version-0.0.1-blue.svg)

This package provides the responses from Google places api as options on a Dropdown, the Dropdown is
a modified TextField, This custom widget combines the functionality of Dropdown and TexField and as
such is easily dismissed when focus is lost, which was something lacking in most of the solutions
out there, which was one of the main triggers for this solution, Another slight issue this aims to
solve is to provide a highly customisable TextField solution for Google Places API, Providing a
widget that naturally blends with your already existing custom TextField, just with a slight
super-power.




 <img src="github-assets/preview.png" alt="preview" width="300"/> 

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

The constructor has 8 attributes related to the API:

- `String googleMapApiKey` is a required attribute. It is the Google Maps API Key your application is
  using, make sure Places API is enabled on the Google Developer console.
- `(Place) void onSuggestionSelected` is a callback function called when the user selects one of the
  autocomplete options.
- `String locale` A location which you would like to restrict your results. Check
  the full list of [supported  country code](Wikipedia: List of ISO 3166 country codes or the ISO
  Online Browsing Platform) in the documentation.

### The `Suggestion` class

This class will be returned on the `onSuggestionSelected` methods. It allows us to get more
information about the user selected place.

Initially, it provides you with only basic information:

- `description` contains the human-readable name for the returned result. For establishment results,
  this is usually the business name.
- `placeId`A textual identifier that uniquely identifies a place. For more information about place
  IDs, see the [Place IDs](https://developers.google.com/places/web-service/place-id) overview.


