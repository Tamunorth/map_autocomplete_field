import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_autocomplete_field/map_autocomplete_field_method_channel.dart';

void main() {
  MethodChannelMapAutocompleteField platform = MethodChannelMapAutocompleteField();
  const MethodChannel channel = MethodChannel('map_autocomplete_field');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
