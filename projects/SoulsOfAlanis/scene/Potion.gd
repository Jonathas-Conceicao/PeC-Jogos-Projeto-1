extends Area2D

func _physics_process(delta):
  
  var bodies = get_overlapping_bodies()
  var item
  
  for body in bodies:
    
    if body.name == "Player" && Input.is_action_pressed("player_attack"):
      $Item.hide()
