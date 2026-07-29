if (instance_number(obj_gamecontroller) > 1) { instance_destroy() exit }

is_connecting_controller = 3
gamepad_active = 0
gamepad_id = 0
gamepad_shoulderlb_reassign = 0
gamepad_type = ""
_load_enabled = false

if (!variable_global_exists("gamepad_type")) global.gamepad_type = "N/A"

enable_loading = function() { _load_enabled = true }
