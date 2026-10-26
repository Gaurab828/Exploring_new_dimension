extends CharacterBody2D
var speed = 200
var a="6"
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
	else:
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
