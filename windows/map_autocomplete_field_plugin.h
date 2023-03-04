#ifndef FLUTTER_PLUGIN_MAP_AUTOCOMPLETE_FIELD_PLUGIN_H_
#define FLUTTER_PLUGIN_MAP_AUTOCOMPLETE_FIELD_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace map_autocomplete_field {

class MapAutocompleteFieldPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MapAutocompleteFieldPlugin();

  virtual ~MapAutocompleteFieldPlugin();

  // Disallow copy and assign.
  MapAutocompleteFieldPlugin(const MapAutocompleteFieldPlugin&) = delete;
  MapAutocompleteFieldPlugin& operator=(const MapAutocompleteFieldPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace map_autocomplete_field

#endif  // FLUTTER_PLUGIN_MAP_AUTOCOMPLETE_FIELD_PLUGIN_H_
