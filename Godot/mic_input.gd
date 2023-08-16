extends Node

var record_bus_index: int
var record_effect: AudioEffectRecord
var recording: AudioStreamSample

func _ready() -> void:
	
	record_bus_index = AudioServer.get_bus_index('Record')
	# Only one effect on the bus, so can just assume index 0 for record effect
	record_effect = AudioServer.get_bus_effect(record_bus_index, 0)
	start_recording()
	
func start_recording() -> void:
	record_effect.set_recording_active(true)
	print("Start")

func stop_recording() -> void:
	record_effect.set_recording_active(false)
	print("Stop")
	recording = record_effect.get_recording()

#func _on_amp_spinbox_value_changed(value: float) -> void:
#	mic_input.volume_db = linear2db(value)
