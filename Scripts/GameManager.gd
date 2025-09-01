extends Node3D

@export var card_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var card = card_scene.instantiate()
	add_child(card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
