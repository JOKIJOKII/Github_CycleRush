extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction_x := Input.get_axis("KeyLeft", "KeyRight")
	var direction_y := Input.get_axis("KeyUp", "KeyDown")
	var direction = Vector2(direction_x, direction_y)
	
	if direction.length() > 1:
		direction = direction.normalized()
		
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	move_and_slide()
	
	if direction_x > 0:
		$AnimatedSprite2D.play("walkSide")
		$AnimatedSprite2D.flip_h = false
	elif direction_x < 0:
		$AnimatedSprite2D.play("walkSide")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idleSide")

	if direction_y < 0:
		$AnimatedSprite2D.play("walkBack")
		$AnimatedSprite2D.flip_h = false
	elif direction_y > 0:
		$AnimatedSprite2D.play("walkFront")
		$AnimatedSprite2D.flip_h = false
	if direction == Vector2(0,0):
		$AnimatedSprite2D.play("idleFront")
		$AnimatedSprite2D.flip_h = false
