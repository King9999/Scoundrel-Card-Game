extends Node3D

@export var card_scene: PackedScene
@export var card_data: CardData
@export var deck_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var card:Card = card_scene.instantiate()
	#card.face.material_override.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	#card.face.material_override.albedo_texture = card_data.card_face
	#add_child(card)
	#deck.shuffle_deck()
	#for i in deck.cards.size():
		#deck.cards[i].global_position = Vector3(randf_range(0, 10), randf_range(0, 10), randf_range(0, 10))
	var deck: Deck = deck_scene.instantiate()
	deck.shuffle_deck()
	#for i in deck.cards.size():
		#deck.cards[i].global_position = Vector3(randf_range(0, 10), randf_range(0, 10), randf_range(0, 10))
	add_child(deck)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
