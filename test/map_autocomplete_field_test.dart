import 'package:flutter_test/flutter_test.dart';
import 'package:map_autocomplete_field/map_autocomplete_field_method_channel.dart';
import 'package:map_autocomplete_field/map_autocomplete_field_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMapAutocompleteFieldPlatform
    with MockPlatformInterfaceMixin
    implements MapAutocompleteFieldPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MapAutocompleteFieldPlatform initialPlatform =
      MapAutocompleteFieldPlatform.instance;

  test('$MethodChannelMapAutocompleteField is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMapAutocompleteField>());
  });

  // test('getPlatformVersion', () async {
  //   MapAutocompleteField mapAutocompleteFieldPlugin = MapAutocompleteField();
  //   MockMapAutocompleteFieldPlatform fakePlatform = MockMapAutocompleteFieldPlatform();
  //   MapAutocompleteFieldPlatform.instance = fakePlatform;
  //
  //   expect(await mapAutocompleteFieldPlugin.getPlatformVersion(), '42');
  // });
}
