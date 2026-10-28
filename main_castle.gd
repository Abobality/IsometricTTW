extends Node2D

@export var team: int = 0;
@export var teamColor: Color;

const unitSetup = preload("res://unit_squad.tscn");
var is_setup = false;
var unitNumber: int;
var enemyCastle: Node = null;

func _ready() -> void:
	$Building.self_modulate = teamColor;
	GameManager.registerCastle(team,self)
	findCastle.call_deferred();


func _on_button_pressed() -> void:
	if is_setup==false:
		is_setup = true;
		$Timer.start(2.0)
		
func spawnUnitSquad():
	if enemyCastle == null:
		findCastle();
		print("Enemy not spawn yet");
		return;
	var squad = unitSetup.instantiate();
	squad.teamColor = teamColor;
	squad.targetCastle = enemyCastle;
	squad.team = team;
	get_parent().add_child(squad);
	squad.global_position = $Marker2D.global_position;
	
func findCastle():
	enemyCastle = GameManager.getEnemyCastle(team);
	
	if enemyCastle == null:
		print("Enemy not spawn yet");
		return;
	print(GameManager.castles)
	print(enemyCastle);
	
func _on_timer_timeout() -> void:
	spawnUnitSquad();
