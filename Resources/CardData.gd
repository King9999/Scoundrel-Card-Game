"""
Data for all cards in the game.
"""

extends Resource
class_name CardData

enum CardType { MONSTER, WEAPON, POTION }
@export var card_face: StandardMaterial3D
@export var card_type: CardType
@export var card_value: int			#this value is shared between all card types

func _ready():
	card_face.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
