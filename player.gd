extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Movimiento xd
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
			velocity.x = direction * SPEED

			# para voltera sprite
			anim.flip_h = direction > 0

	else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
			# Cuando está quieto, reproduce la animación de parpadeo
			if is_on_floor():
					anim.play("idle_down")

	move_and_slide()
