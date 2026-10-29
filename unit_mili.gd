extends Node2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
var squad;
var formation_offset;

func _ready() -> void:
	anim_player.play("move_down")

func _physics_process(delta: float) -> void:
	global_position = squad.global_position + formation_offset;
