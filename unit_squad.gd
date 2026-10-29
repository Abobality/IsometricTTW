extends Node2D

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

var speed: float = 40.0;
var team: int;
var teamColor: Color;
var targetCastle: Node2D;
var state = STATES.MARCHING;
var units: Array = [];

enum STATES {
	IDLE,
	MARCHING,
	ATTACK
	};

func _ready() -> void:
	$Icon.self_modulate = teamColor;
	print(targetCastle)
	

func _physics_process(delta: float) -> void:
	match state:
		STATES.IDLE:
			pass
		STATES.MARCHING:
			marching(delta)
		STATES.ATTACK:
			attack()
			
	if nav_agent.is_navigation_finished():
		state = STATES.ATTACK;
	
	
func attack():
	pass;
	
func marching(delta: float):
	if targetCastle == null:
		return;
		
	if nav_agent.is_navigation_finished():
		nav_agent.target_position = targetCastle.global_position;
		return;
		
	var newPathPos = nav_agent.get_next_path_position()
		
	global_position = global_position.move_toward(newPathPos,speed * delta);
