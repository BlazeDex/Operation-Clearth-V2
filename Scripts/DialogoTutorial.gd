extends Control

var dialogo = [
	"¡Hola, bienvenido al mundo de Clearth! En este momento estás realizando algunas pruebas iniciales antes de comenzar con tu misión.",
	"Si continúas avanzando por este camino terminarás encontrandote con una criaturas conocidas como 'Grubs'.",
	"Pero no te preocupes demasiado por el momento. Descubrirás una forma de derrotarlos."
]
 
var index = 0
var text_speed = 0.01

func _ready():
	load_text()
	
func load_text():
	if index < dialogo.size():
			$RichTextLabel.text = str(dialogo[index])
			$RichTextLabel.percent_visible = 0 
			$Tween.interpolate_property(
				$RichTextLabel, 'percent_visible', 0, 3, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
			index += 1
	else:
		queue_free()
		
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and get_node("../../Control").visible == true:
		load_text()
