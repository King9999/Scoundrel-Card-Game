extends Node3D
class_name Card

@export var face: MeshInstance3D
#@onready var card_back: MeshInstance3D = $Back
#enum CardType { MONSTER, WEAPON, POTION }
@export var card_face: StandardMaterial3D
@export var card_type: CardData.CardType
@export var card_value: int			#this value is shared between all card types

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#face.material_override.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	pass

##gets data from resource and applies to card node.
func set_card_data(data: CardData):
	face.material_override.albedo_texture = data.card_face
	#print(face.material_override.albedo_texture)
	card_type = data.card_type
	card_value = data.card_value
