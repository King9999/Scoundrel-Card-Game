"""
Board contains the nodes for cards and the deck.
"""

extends MeshInstance3D
class_name Board

@export var deck_scene: PackedScene
@export var card_spaces: Array[Node3D] = []
@export var weapon_position: Node3D							#defeated monsters also go here.
@export var monsters_defeated_by_weapon: Array[Card] = []	#monsters currently killed are placed on top of weapon
@export var room: Array[Card] = []				#holds references to cards on the board.

#consts
const ROOM_SIZE: int = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Singleton.board = self
	room.resize(ROOM_SIZE)
	
	#deck setup
	var deck: Deck = deck_scene.instantiate()
	deck.shuffle_deck()
	deck.draw_card(4)
	add_child(deck)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
