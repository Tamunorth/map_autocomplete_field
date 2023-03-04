#include "include/map_autocomplete_field/map_autocomplete_field_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "map_autocomplete_field_plugin.h"

void MapAutocompleteFieldPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  map_autocomplete_field::MapAutocompleteFieldPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
