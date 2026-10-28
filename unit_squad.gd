extends Node2D

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

var speed: float = 100.0;
var team: int;
var teamColor: Color;
var targetCastle: Node2D;

func _ready() -> void:
	$Icon.self_modulate = teamColor;
	print(targetCastle)
	

func _physics_process(delta: float) -> void:
	if targetCastle == null:
		return;
		
	if nav_agent.target_position.distance_to(targetCastle.global_position)>50.0:
		nav_agent.target_position = targetCastle.global_position;
		
		var newPathPos = nav_agent.get_next_path_position()
		
		global_position = global_position.move_toward(newPathPos,speed * delta);
