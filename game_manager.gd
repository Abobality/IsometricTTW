extends Node

var castles: Dictionary = {};

func registerCastle(team_id: int,castle: Node):
	castles[team_id] = castle;
	
func unregisterCastle(team_id: int):
	castles.erase(team_id);
	
func getEnemyCastle(my_team_id:int):
	for id in castles:
		if id != my_team_id:
			return castles[id];
		return null;
