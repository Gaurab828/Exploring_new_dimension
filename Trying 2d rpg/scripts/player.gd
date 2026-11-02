extends CharacterBody2D
var speed = 200
var player_id=Why.player_id
var z=[11,11,11,11,11,11,11,11,11,11]
var a=str(player_id)
@onready var lost_label=$"../Label3"
@onready var lost_anim=$"../Area2D"
@onready var win_anim=$"../win"
var x=0
@onready var label_list=[$"../no_inside_chest/Label",$"../no_inside_chest/Label0",$"../no_inside_chest/Label2",$"../no_inside_chest/Label3",$"../no_inside_chest/Label4",$"../no_inside_chest/Label5",$"../no_inside_chest/Label6",$"../no_inside_chest/Label7",$"../no_inside_chest/Label8",$"../no_inside_chest/Label9"]
func _process(_delta: float) -> void:
	if x!=5:
		for i in range(10):
			if label_list[i].visible==true and z[i]!=i:
				z[i]=i
				x+=1
				if label_list[i].text==a:
					win()
	elif x==5:
		x+=5
		lost()
func win()->void:
	set_process(false)
	Why.player_id+=1
	win_anim.visible=true
	win_anim.global_position=(global_position-Vector2(5,5))
	$".".visible=false
	get_node("../win/AnimatedSprite2D").play("win")
	await get_node("../win/AnimatedSprite2D").animation_finished
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func lost()->void:
	lost_label.visible=true
	lost_anim.visible=true
	$Camera2D.enabled=false
	get_node("../Area2D/AnimatedSprite2D").play("end")
	await get_node("../Area2D/AnimatedSprite2D").animation_finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")
func _ready() -> void:
	get_node("AnimatedSprite2D").play("idle"+a)
	add_to_group("player")
func _physics_process(_delta: float) -> void:
	var directionx := Input.get_axis("left","right",)
	var directiony := Input.get_axis("up","down")
	anim(directionx)
	if Input.is_action_pressed("run"):
		speed=400
	else:
		speed=200
	if directionx!=0 or directiony!=0:
		if speed==400:
			get_node("AnimatedSprite2D").play("run"+a)
		else:
			get_node("AnimatedSprite2D").play("walk"+a)
	elif x<5:
		get_node("AnimatedSprite2D").play("idle"+a)
	if directionx:
		velocity.x=directionx*speed
	else:
		velocity.x=move_toward(velocity.x,0,speed)
	if directiony:
		velocity.y=directiony*speed
	else:
		velocity.y=move_toward(velocity.y,0,speed)
	move_and_slide()
func anim(directionx)->void:
	if directionx==1:
		get_node("AnimatedSprite2D").flip_h=false
	elif directionx==-1:
		get_node("AnimatedSprite2D").flip_h=true
