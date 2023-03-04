import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'map_autocomplete_field_platform_interface.dart';

/// An implementation of [MapAutocompleteFieldPlatform] that uses method channels.
class MethodChannelMapAutocompleteField extends MapAutocompleteFieldPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('map_autocomplete_field');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
