extends Node
@onready var label_list=[$Label,$Label0,$Label2,$Label3,$Label4,$Label5,$Label6,$Label7,$Label8,$Label9]
var a=[1,4,3,5,6,8,9,2,10,7]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a.shuffle()
	for i in range(10):
		label_list[i].text=str(a[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#for i in range(10):
		#if label_list[i].visible==true:
			#print(label_list[5].text)
