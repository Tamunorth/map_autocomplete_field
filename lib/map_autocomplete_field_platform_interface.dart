import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'map_autocomplete_field_method_channel.dart';

abstract class MapAutocompleteFieldPlatform extends PlatformInterface {
  /// Constructs a MapAutocompleteFieldPlatform.
  MapAutocompleteFieldPlatform() : super(token: _token);

  static final Object _token = Object();

  static MapAutocompleteFieldPlatform _instance = MethodChannelMapAutocompleteField();

  /// The default instance of [MapAutocompleteFieldPlatform] to use.
  ///
  /// Defaults to [MethodChannelMapAutocompleteField].
  static MapAutocompleteFieldPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MapAutocompleteFieldPlatform] when
  /// they register themselves.
  static set instance(MapAutocompleteFieldPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
