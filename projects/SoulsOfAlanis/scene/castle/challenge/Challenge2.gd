extends Node2D

enum RoomType {loot, ordinary, connection, mission, challenge, final, any, avoid}
enum Half { first, second , any }

func _ready():
	#$CameraLimit.set_limits(3,3)
	#$Player/Camera.update_limits()
	return

func getSceneType():
	return challenge

func getSceneHalf():
	return first

func getMaxRep():
	return 3

func getNumExit():
	return 1

func getSize():
	return Vector2(3, 3)
