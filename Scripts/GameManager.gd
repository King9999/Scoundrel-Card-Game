extends Node3D
class_name GameManager

#@export var card_scene: PackedScene
#@export var card_data: CardData
#@export var card_spaces: Array[Node3D] = []
@onready var camera = $Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Singleton.game_manager = self
	#var card:Card = card_scene.instantiate()
	#card.face.material_override.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	#card.face.material_override.albedo_texture = card_data.card_face
	#add_child(card)
	#deck.shuffle_deck()
	#for i in deck.cards.size():
		#deck.cards[i].global_position = Vector3(randf_range(0, 10), randf_range(0, 10), randf_range(0, 10))
	#var deck: Deck = deck_scene.instantiate()
	#deck.shuffle_deck()
	#for i in deck.cards.size():
		#deck.cards[i].global_position = Vector3(randf_range(0, 10), randf_range(0, 10), randf_range(0, 10))
	#deck.draw_card(4)
	#add_child(deck)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#_get_mouse_input()
	pass

func _get_mouse_input():
	#print(camera.get_viewport().get_mouse_position())
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#cast a ray
		var ray_dist: float = 10
		var space_state = get_world_3d().direct_space_state
		var origin = camera.project_ray_origin(camera.get_viewport().get_mouse_position())
		var hit = origin + camera.project_ray_normal(camera.get_viewport().get_mouse_position()) * ray_dist
		#if a card was hit, display its information
		var query = PhysicsRayQueryParameters3D.create(origin, hit)
		query.collide_with_areas = true

		var result = space_state.intersect_ray(query)
		print(result)
		pass

func _physics_process(delta: float) -> void:
	_get_mouse_input()
