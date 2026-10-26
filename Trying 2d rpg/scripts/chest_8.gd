extends Node2D
@onready var sprite = $AnimatedSprite2D
@onready var area = $Area2D
var player_near = false
var opened = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not opened:
		player_near = true
		shake()
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = false
func shake():
	var start = sprite.position
	var tween = create_tween()
	for i in range(0,3):
		tween.tween_property(sprite,"position:x",start.x + 4, 0.1)
		tween.tween_property(sprite,"position:x",start.x - 4, 0.1)
	tween.tween_property(sprite,"position",start,0.04)
func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		try_open()
func try_open():
	if player_near and not opened:
		opened=true
		sprite.play("open")
