extends Node2D

func set_enabled(value):
	if value:
		$InteractAreaBill/AnimatedSprite.hide()
		$InteractAreaBill/CollisionShape2D.set_disabled(true)
	
	else:
		$InteractAreaBill/AnimatedSprite.show()
		$InteractAreaBill/CollisionShape2D.set_disabled(false)