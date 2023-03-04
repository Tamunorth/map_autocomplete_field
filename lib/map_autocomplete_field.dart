import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:map_autocomplete_field/services/places_service.dart';

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
    this.textFieldConfiguration,
    this.contentPadding,
    this.fillColor,
    this.hintStyle,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.transitionBuilder,
  }) : super(key: key);
  final TextEditingController controller;
  final FutureOr<Iterable<dynamic>> Function(String)? suggestionsCallback;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final void Function(dynamic) onSuggestionSelected;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? hint;
  final TextFieldConfiguration? textFieldConfiguration;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final Widget Function(BuildContext, Widget, AnimationController?)?
      transitionBuilder;

  final String googleMapApiKey;
  final String? locale;

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
            textFieldConfiguration: textFieldConfiguration ??
                TextFieldConfiguration(
                  controller: controller,
                  decoration: InputDecoration(
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
                    locale: 'ng',
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
