extends Control

var dialogo = [
	"Hola, explorador. ¡Bienvenido al mundo de Clearth! O al menos lo que queda de él.",
	"Verás, nos encontramos en el año 2072. Actualmente el estado medioambiental del planeta es horrible. La ciudades en las que habitamos actualmente", 
	"se encuentran completamente envueltas en polución, tal como puedes notar a través de la ventana del laboratorio.",
	"El aire es demasiado denso y bastante nocivo en ciertas zonas debido a la casi nula cantidad de árboles derivado de la tala excesiva.",
	"Por otra parte, el agua. Ese recurso indispensable para la mayoría de los seres vivos, se encuentra mayormente contaminada en las afueras de la ciudad.",
	"A consecuencia de lo anterior, la calidad de vida de las personas se ha reducido drásticamente. Además de que la mayoría nace con alguna enfermedad.",
	"Son muy pocos aquellos que nacen sin ninguna complicación similar, como tú, por ejemplo.",
	"Tu objetivo aquí es salir del laboratorio y dirigirte a las afueras para poder purificar la mayor cantidad de fuentes de agua que encuentres.",
	"Pero cuidado, la razón por la que nos mantenemos alejados de ese lugar es por las diversas criaturas que merodean por ahí, y como ya sabes, no todos tienen un buen estado de salud.",
	"Cuentas con un arma especial, diseñada para derrotar a las criatura mutantes conocidas como 'Grubs'.",
	"Si bien tu arma es poderosa, esta consume energía. Así que no te confíes y procura optimizar bien este recurso.",
	"Por último, posees un dispositivo llamado 'Purificador', el cual es indispensable para cumplir con tu objetivo.",
	"Asegúrate de que el agua se encuentre dentro del rango de alcance, ya que este dispositivo también consume tu energía, y lo hace en mayor medida que tu arma.",
	"Para salir del laboratorio necesitarás desbloquar la puerta resolviendo un circuito, para eso tendrás que interactuar con la computadora correspondiente a dicha puerta.",
	"Sin nada más que decirte, espero que tengas éxito en tu misión. Y recuerda, ¡no te rindas!"
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
		Resources.dialogo1 = true
		
func _process(delta):
	if Resources.dialogo1 == true:
		queue_free()
	elif Input.is_action_just_pressed("ui_accept"):
		load_text()
