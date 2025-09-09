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
@export var deck: Deck

#consts
const ROOM_SIZE: int = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Singleton.board = self
	room.resize(ROOM_SIZE)
	
	#deck setup
	deck = deck_scene.instantiate()
	deck.shuffle_deck()
	
	#place all cards off to the side
	print("Board Pos: " + str(global_position))
	
	deck.draw_card(4)
	print("Deck Pos " + str(deck.global_position))
	
	#deck.top_level = true

	add_child(deck)
	#var deck_pos = deck.global_position TODO: Find a way to move the deck! This doesn't work for some reason
	#deck.global_position = Vector3(deck_pos.x + 10, deck_pos.y, deck_pos.z + 100)
	print("Deck Pos " + str(deck.global_position))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var deck_pos = deck.global_position
	#deck.global_position = Vector3(deck_pos.x, deck_pos.y, deck_pos.z + 2 * delta)
	pass
