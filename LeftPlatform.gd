extends CharacterBody2D

var speed=300

func _physics_process(delta):
	# Detect up/down/left/right keystate and only move when pressed
	velocity = Vector2()
	if Input.is_action_pressed('left_down'):
		velocity.y += 1
	if Input.is_action_pressed('left_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity*delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
