extends Node2D

var team: String;
var teamColor: Color;

func _ready() -> void:
	$Icon.self_modulate = teamColor;
