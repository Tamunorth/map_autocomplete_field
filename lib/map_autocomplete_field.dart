import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:map_autocomplete_field/services/places_service.dart';

/// Takes the required values [controller], [onSuggestionSelected], [googleMapApiKey]
/// and [itemBuilder] (This describes haw the items in the DropDown of suggestions should look, usually a [ListTile] is used here, any widget would work).
///
///Optionally a [validator] can be provided as well and Behaves like a FormField when Wrapped with a [Form] widget.
///
/// The [textFieldConfiguration] parameter takes a [TextFieldConfiguration] object, which is used to customize the look
/// of the widget.
///
/// It also take a [locale] parameter which is used to limit the range of the search region to a particular locale, if no locale is set,
/// the result span the globe, which no not be desirable behaviour for some use cases.

class MapAutoCompleteField extends StatelessWidget {
  const MapAutoCompleteField({
    Key? key,
    required this.controller,
    this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSuggestionSelected,
    this.onSaved,
    this.hint = 'Address',
    this.validator,
    required this.googleMapApiKey,
    this.locale,
    this.contentPadding,
    this.fillColor,
    this.hintStyle,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.transitionBuilder,
    this.inputDecoration,
    this.selectedTextStyle,
    this.focusNode,
  }) : super(key: key);
  final TextEditingController controller;
  final FutureOr<Iterable<dynamic>> Function(String)? suggestionsCallback;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final void Function(dynamic) onSuggestionSelected;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? hint;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final TextStyle? selectedTextStyle;
  final Widget Function(BuildContext, Widget, AnimationController?)?
      transitionBuilder;

  final InputDecoration? inputDecoration;
  final String googleMapApiKey;
  final String? locale;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Pallets.grey50,
          ),
          child: TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              focusNode: focusNode,
              controller: controller,
              style: selectedTextStyle,
              decoration: inputDecoration ??
                  InputDecoration(
                    fillColor: fillColor ?? const Color(0xffBFBFBF),
                    hintText: hint,
                    hintStyle: hintStyle ??
                        const TextStyle(
                          color: Color(0xff808080),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                    focusedBorder: focusedBorder ??
                        const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBFBFBF),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                    contentPadding: contentPadding ??
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                    border: border ??
                        const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBFBFBF),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                    enabledBorder: enabledBorder ??
                        const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBFBFBF),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                  ),
            ),
            suggestionsCallback: suggestionsCallback ??
                (query) {
                  return PlacesService.getSuggestion(
                    query,
                    googleMapApiKey: googleMapApiKey,
                    locale: locale,
                  );
                },
            itemBuilder: itemBuilder,
            transitionBuilder: transitionBuilder ??
                (BuildContext context, Widget suggestionsBox,
                    AnimationController? controller) {
                  return suggestionsBox;
                },
            hideOnEmpty: false,
            hideOnLoading: true,
            hideOnError: false,
            onSuggestionSelected: onSuggestionSelected,
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
