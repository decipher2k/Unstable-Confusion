extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bnLoadImage_pressed():
	var dlg:FileDialog=get_tree().root.find_node("FileDialogLoadImage",true,false)
	dlg.popup_centered()
	pass # Replace with function body.

