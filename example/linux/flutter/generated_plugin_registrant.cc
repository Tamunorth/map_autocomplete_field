//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <map_autocomplete_field/map_autocomplete_field_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) map_autocomplete_field_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MapAutocompleteFieldPlugin");
  map_autocomplete_field_plugin_register_with_registrar(map_autocomplete_field_registrar);
}
