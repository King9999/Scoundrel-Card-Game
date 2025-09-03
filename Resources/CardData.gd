"""
Data for all cards in the game.
"""

extends Resource
class_name CardData

enum CardType { MONSTER, WEAPON, POTION }
@export var card_face: CompressedTexture2D
@export var card_type: CardType
@export var card_value: int			#this value is shared between all card types
