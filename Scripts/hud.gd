extends Control
class_name HUD

@onready var card_text = $"Card HUD/Card Text"
@onready var card_container = $"Card HUD"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Singleton.hud = self
	
	card_container.visible = false
	#get signal from game manager
	var game_manager = $".."
	game_manager.update_card_details.connect(show_card_details)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_card_details(show_window: bool, text: String):
	card_container.visible = show_window
	card_text.text = text
