extends Node3D
class_name Card

@export var face: MeshInstance3D
#@onready var card_back: MeshInstance3D = $Back
#enum CardType { MONSTER, WEAPON, POTION }
@export var card_face: StandardMaterial3D
@export var card_type: CardData.CardType
@export var card_value: int			#this value is shared between all card types

#rotations in degrees for placing card face down or face up
const FACE_DOWN_ANGLE: Vector3 = Vector3(90, 0, 0)
const FACE_UP_ANGLE: Vector3 = Vector3(-90, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#face.material_override.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	pass

##gets data from resource and applies to card node.
func set_card_data(data: CardData):
	face.material_override.albedo_texture = data.card_face
	card_type = data.card_type
	card_value = data.card_value

func set_face_down():
	set_rotation_degrees(FACE_DOWN_ANGLE)

func set_face_up():
	set_rotation_degrees(FACE_UP_ANGLE)
