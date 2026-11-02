extends Control

signal dialogue_finished

@export_file("*.json") var d_log
var dialogue =[]
var current_d_id=0
var d_active=false
func _ready() -> void:
	$NinePatchRect.visible=false
func start()->void:
	if d_active:
		return
	else:
		d_active=true
	dialogue=load_dialogue()
	current_d_id=-1
	next_script()
func load_dialogue():
	var file=FileAccess.open("res://dialouge/dialouge.json",FileAccess.READ)
	var content=JSON.parse_string(file.get_as_text())
	return content
func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
func next_script():
	current_d_id+=1
	if current_d_id>=dialogue.size():
		d_active=false
		$NinePatchRect/main.text=str(Why.player_id)
		emit_signal("dialogue_finished")
	$NinePatchRect/main.text = dialogue[current_d_id]["hi"]
	
