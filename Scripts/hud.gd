extends Control
class_name HUD

@onready var card_text = $"Card Details/Card Text Background/Card Text"
@onready var card_container = $"Card Details"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Singleton.hud = self
	
	#get signal from game manager
	var game_manager = $".."
	game_manager.update_card_details.connect(show_card_details)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_card_details(text: String):
	card_text.text = text
