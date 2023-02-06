extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thread

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func go(txt:String):
	var bn:Button=get_tree().root.find_node("Button",true,false)
	bn.disabled=true
	var lbl:Label=get_tree().root.find_node("lblOutput",true,false)
	lbl.text="Generating..."
	
	var sd=get_tree().root.find_node("SD",true,false)
	sd.b=txt
	sd.running=true
	while sd.finished==false:
		pass
	
	var image = Image.new()
	var env=OS.get_environment("TEMP")
	image.load(env+"\\squirrel-0.png")
	var t = ImageTexture.new()
	t.create_from_image(image)
	var textureRect:TextureRect=get_tree().root.find_node("TextureRect",true,false)
	textureRect.texture = t	
	lbl.text="Output:"	
	bn.disabled=false
	
	var bnSave:Button=get_tree().root.find_node("bnSave",true,false)
	bnSave.disabled=false
		
	pass
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

func _on_Button_pressed():
	var textEdit:TextEdit=get_tree().root.find_node("TextEdit",true,false)
	var txt=textEdit.text
	
	if(txt==""):
		alert("Please enter text.","Error")
	else:		
		thread = Thread.new()
		thread.start(self,"go",txt)
	pass # Replace with function body.
