extends Node

export var NumExit = 1
enum RoomType { loot, ordinary, connection, quest, challenge, final, any }
enum Half { first, second, any }

func getNumExit():
	return NumExit
	
func getSceneType():	
	return RoomType.challenge
	
func getSceneHalf():
	return Half.first

func getSize():
	return Vector2(1, 1.2)
	
func _ready():
	$ChallengeDisplay.set_text("Kill all the enemies")
	$ChallengeDisplay/NPPainel/Container/Message.set_text("Kill all the enemies")