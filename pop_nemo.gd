extends Node

var volume

var animation_finished = true

func _ready() -> void:
	get_viewport().transparent_bg = true
	$PopNemo.connect("animation_finished", on_animation_finished)


func _process(_delta: float) -> void:
	volume = abs(AudioServer.get_bus_peak_volume_left_db(AudioServer.get_bus_index("Master"), 0))
	if volume < 50:
		$PopNemo.play("talk")
		animation_finished = false
	
	if animation_finished:
		$PopNemo.play("idle")


func on_animation_finished() -> void:
	animation_finished = true
