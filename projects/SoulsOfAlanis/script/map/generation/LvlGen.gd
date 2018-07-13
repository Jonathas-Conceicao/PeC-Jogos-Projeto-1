const TreeMap   = preload("res://script/map/generation/TreeMap.gd")
const InfoRoom  = preload("res://script/map/InfoRoom.gd")

export (bool) var debug_mode = true

const MAX_TRY   = 5
const N_ROOM    = 15
const DEF_ROOM  = "res://scene/map/tests/DummyRoom.tscn"

enum RoomType {loot, ordinary, connection, mission, challenge, final, any, avoid}
enum Half { first, second , any }

var i_rooms = Array() # InfoRoom array, with repetition
var count 	= 0    		# Number of room already picked
var root  	= null

func ready():
	randomize()
	return

# Receives the list of scenes for that level
#func init_rooms(rooms_path = []):
func _init(rooms_path = []):
	#printerr("(DB) Initilizing rooms")
	var f = File.new()
	var has_conn_room = false
	# validation
	for c_room in rooms_path:
		if !(f.file_exists(c_room)):
			debug.printMsg("" + c_room + " does not exists.", debug.msg_type.err, self.debug_mode)
			return null

		var scene = load(c_room).instance()

		var type = first
		if scene.has_method("getSceneType"):
			type = scene.getSceneType()
			if (type == connection): has_conn_room = true
		else:
			debug.printMsg("Couldn't getSceneType, using default", debug.msg_type.wrn, self.debug_mode)

		var half = first
		if scene.has_method("getSceneHalf"):
			half = scene.getSceneHalf()
		else:
			debug.printMsg("Couldn't getSceneHalf, using default", debug.msg_type.wrn, self.debug_mode)

		var mx_rep = 1
		if scene.has_method("getMaxRep"):
			mx_rep = scene.getMaxRep()
		else:
			debug.printMsg("Couldn't getMaxRep, using default", debug.msg_type.wrn, self.debug_mode)

		var n_exit = 1
		if scene.has_method("getNumExit"):
			n_exit = scene.getNumExit()
		else:
			debug.printMsg(" Couldn't getNumExit, using default", debug.msg_type.wrn, self.debug_mode)

		var size = Vector2(1,1)
		if scene.has_method("getSize"):
			size = scene.getSize()
		else:
			debug.printMsg(" Couldn't getSize, using default, this is probably a mistake", debug.msg_type.err, self.debug_mode)


		# fill up the deck
		# NOTE: possible bug, it looks like (from debug) that the reference to
		# room path is the same on every added InfoRoom
		# 1) it may not be a problem,
		#  since is just a reference to the same string path
		for i in range(0, mx_rep):
			self.i_rooms.append(InfoRoom.new(c_room, type, half, n_exit, size))

		pass

	if !has_conn_room:
		debug.printMsg(" It is probably necessary that the system have at least one connection room", debug.msg_type.wrn, self.debug_mode)
	return

# Randomly choosen a scene
# type  : the room type, being the ones defined above
# half  : for what part of the level that scene must belong (confuse? talk to Bretana)
# avoid : room type to avoid picking
# n_try : if the codes tries too much, the it forces a scene to be choosen
# return : InfoRoom
func pick(type = any, half = any, avoid = final, n_try = MAX_TRY, force = false):
	if type == avoid:
		debug.printMsg(" Cannot select and avoid the same type", debug.msg_type.err, self.debug_mode)
		avoid = final
	pass

	self.count += 1
	while (n_try != 0):
		var i_room = self.i_rooms[randi() % i_rooms.size()]
		n_try -= 1
		if force || ( ( (type == any) || (i_room.room_type == type) ) && ( i_room.room_type != avoid ) && ( (half == any) || (i_room.half == half) ) ):
			if i_room.room_type != connection && self.i_rooms.size() > 1:
				self.i_rooms.erase(i_room)
			return i_room
	pass

	debug.printMsg(" Could not find the right, requesting a connection one, and forcing", debug.msg_type.wrn, self.debug_mode)
	return self.pick(connection, any, final, MAX_TRY, true)

# Creates the map
# path_room - the room to start the tree
# generate - wheter or not the should be pick randomlly
# size - if the scene is passed, you probably need to pass its size as well
func createTree(path_room, generate = true, size = null):
	var f = File.new()

	if !generate:
		if (!f.file_exists(path_room)) || (!load(path_room).can_instance()):
			debug.printMsg(" Invalid default initial room", debug.msg_type.err, self.debug_mode)
			exit(2)
			return null
		debug.printMsg(" How did you determinated the room size?", debug.msg_type.err, self.debug_mode)
		return TreeMap.new(self, InfoRoom.new(path_room, ordinary, first, 1, size), null)
	else:
		var r = self.pick(ordinary, first, final)
		return TreeMap.new(self, r, null, 0, r.n_exit, true)
	return



#func _on_Button_pressed():
#  printerr("(DB) Pressed")
#  var s = PoolStringArray([DEF_ROOM, DEF_ROOM])
#  self.init_rooms(s)
#  self.root = createTree(self, DEF_ROOM, self.i_rooms)
#  printTree(self.root, true)
#  printerr("(DB) Succefully generated a #%s rooms map" % self.count)
#  pass # replace with function body
#
