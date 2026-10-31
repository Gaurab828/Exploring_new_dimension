extends Node
var l =[1,2,3,4,5,6,7,8,9,10]
@onready var list=[$Label1,$Label2,$Label3,$Label4,$Label5,$Label6,$Label7,$Label8,$Label9,$Label0]
func _ready() -> void:
	l.shuffle()
	for i in range(10):
		list[i].text=str(l[i])

func _process(_delta: float) -> void:
	pass
