extends FileDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func alert(text: String, title: String='Message') -> void:
	var dialog = AcceptDialog.new()
	dialog.dialog_text = text
	dialog.window_title = title
	dialog.connect('modal_closed', dialog, 'queue_free')
	add_child(dialog)
	dialog.popup_centered()

func _on_FileDialog_file_selected(path):
	var env=OS.get_environment("TEMP")
	var directory:Directory=Directory.new()
	directory.copy(env+"\\squirrel-0.png",path)
	alert("File saved.")
	pass # Replace with function body.
