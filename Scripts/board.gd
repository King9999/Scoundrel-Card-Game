"""
Board contains the nodes for cards and the deck.
"""

extends MeshInstance3D

@export var card_positions: Array[Node3D] = []
@export var weapon_position: Node3D							#defeated monsters also go here.
@export var monsters_defeated_by_weapon: Array[Card] = []	#monsters currently killed are placed on top of weapon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
