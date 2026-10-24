extends CharacterBody2D
var speed = 400

func _ready() -> void:
	get_node("AnimatedSprite2D").play("idle")



func _physics_process(delta: float) -> void:
	process_movement()
	move_and_slide()
	
func process_movement() -> void:
	var directionx := Input.get_axis("left","right",)
	var directiony := Input.get_axis("up","down")
	anim(speed,directionx)
	if Input.is_action_pressed("run"):
		speed=1000
	else:
		speed=400
	if directionx!=0 or directiony!=0:
		get_node("AnimatedSprite2D").play("fly")
	else:
		get_node("AnimatedSprite2D").play("idle")
	if directionx:
		velocity.x=directionx*speed
	else:
		velocity.x=move_toward(velocity.x,0,speed)
	if directiony:
		velocity.y=directiony*speed
	else:
		velocity.y=move_toward(velocity.y,0,speed)
	
func anim(speed,directionx)->void:
	if directionx==1:
		get_node("AnimatedSprite2D").flip_h=false
	elif directionx==-1:
		get_node("AnimatedSprite2D").flip_h=true
