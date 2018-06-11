# Bat - Foe
extends KinematicBody2D

const Foe = preload("res://script/Classes/Foe.gd")
const Attack = preload("res://script/Classes/Attack.gd")

const MAXSPEED = 350
const UP = Vector2(0, 0)

enum MOVEMENTS  { IDLE, PATROL, SENTINEL }
enum DIRECTIONS { UP, DOWN, LEFT, RIGHT }

var speed = 350

var direction = RIGHT
var movement = PATROL
var velocity = Vector2(0, 0)

onready var windowsize = OS.get_window_size()
var data

func _ready():
	data = Foe.new(Attack.Slash, Foe.Air)
	self.add_child(data)
	set_process(true)
	$WaitTimer.start()
	$WaitTimer2.start()
	pass

func _physics_process(delta):
	pass


func act():
	if movement == PATROL:
    	act_patrol()
	if movement == IDLE:
		act_idle()
	if movement == SENTINEL:
		act_sentinel()
	pass

func act_idle():
	pass

func act_patrol():
	var d
	d = randi()%5+1
	match d:
		1:
			direction = RIGHT
		2:
			direction = LEFT
		3:
			direction = UP
		4:
			direction = DOWN
	pass

func act_sentinel():
	pass

func update_velocity():
	match direction:
		RIGHT:
			velocity.x =  1
		LEFT:
			velocity.x = -1
		UP:
			velocity.y = -1
		DOWN:
			velocity.y =  1
 
func _on_takeDamage(agressor, attack):
	var damage = data.takeAttack(attack)
	print ("Bat received ", damage, " from: ", agressor.get_name())
	var dp = calcPercentage(self.data.getMaxHP(), damage)
	setKnockBack(self, dp, attack.direction)
	if data.getHP() <= 0:
		queue_free()
	return

func update_position():
	var pos = get_position()
	if pos.x < 0:
		direction = RIGHT
	if pos.x > windowsize.x:
		direction = LEFT
	if pos.y < 0:
		direction = DOWN
	if pos.y > windowsize.y:
		direction = UP
	set_position(get_position() + velocity)
	pass

func _on_WaitTimer_timeout():
	update_velocity()
	update_position()
	$WaitTimer.start()
	pass # replace with function body


func _on_WaitTimer2_timeout():
	act()
	pass # replace with function body


func _on_HitBox_body_entered(body):
	match direction:
			RIGHT:
				direction = LEFT
			LEFT:
				direction = RIGHT
			UP:
				direction = DOWN
			DOWN:
				direction = UP
	if (body.has_method("_on_takeDamage") and (not body.has_method("foe"))):
		var attack = data.genAttack()
		body._on_takeDamage(self, attack)
	pass # replace with function body

func setKnockBack(host, itencity, direction):
	pass

func calcPercentage(h, l):
	return (l*100)/h
	
func foe():
	pass