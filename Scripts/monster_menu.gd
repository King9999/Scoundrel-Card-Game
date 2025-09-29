extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_barehanded_mouse_entered() -> void:
	var game_manager = Singleton.game_manager
	if game_manager.selected_card == null:
		return
	
	#calculate damage and get damage preview
	game_manager.health_bar.show_damage_preview(game_manager.selected_card.card_value)
	


func _on_attack_barehanded_mouse_exited() -> void:
	var game_manager = Singleton.game_manager
	if game_manager.selected_card == null:
		return
	
	#calculate damage and get damage preview
	game_manager.health_bar.undo_damage_preview()
