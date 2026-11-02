extends Area2D
var chat_zone=false
var is_chatting=false

func _process(_delta):
	if Input.is_action_pressed("chat"):
		is_chatting=true

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		chat_zone=true
		

func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		chat_zone=false

func _on_dialouge_dialogue_finished():
	is_chatting=false
