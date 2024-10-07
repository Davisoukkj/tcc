extends Area2D
class_name EndPortal


var _player_ref: Character = null

@export_category("Variables")
@export var _teleport_position: Vector2

@export_category("Objects")
@export var _animation: AnimationPlayer = null


func _on_body_entered(_body) -> void:
	if _body is Character:
		_player_ref = _body
		get_tree().change_scene_to_file("res://characters/END/jump_scare.tscn")
