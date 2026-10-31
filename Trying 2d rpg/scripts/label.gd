extends Node2D
@onready var label_list=[$no_inside_chest/Label,$no_inside_chest/Label0,$no_inside_chest/Label2,$no_inside_chest/Label3,$no_inside_chest/Label4,$no_inside_chest/Label5,$no_inside_chest/Label6,$no_inside_chest/Label7,$no_inside_chest/Label8,$no_inside_chest/Label9]
var a=[1,4,3,5,6,8,9,2,10,7]
func _ready()->void:
	a.shuffle()
	label_list.text=str(a)
		
