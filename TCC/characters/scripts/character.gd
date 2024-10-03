extends CharacterBody2D
class_name Character 

@onready var anim = $Anim

@export_category("Variables")
@export var _move_speed: float = 64.0

@export var _friction: float = 0.2
@export var _acceleration: float = 0.2



func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()
	
func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
		
	)
	
	if velocity.x != 0:
		anim.play("move_right")
	elif velocity.y > 0:
		anim.play("move_down")
	elif velocity.y < 0:
		anim.play("move_up")
	else:
		anim.play("idle_down")
	
	if velocity.x > 0:
		anim.flip_h = false
	else:
		anim.flip_h = true
	
	if _direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
	
	
	velocity = _direction.normalized() * _move_speed
	
