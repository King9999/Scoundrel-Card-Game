extends Node3D
class_name GameManager


signal update_card_details(text: String)

@onready var camera = $Camera3D
var poll_rate: float = 0.15				#used to prevent game from checking for mouse input every frame
var last_poll_time: float

#player data
@export_category("Player Data")
@export var player_name: String
@export var max_hit_points: int = 20
@export var hit_points: int
@export var can_run_away: bool = true			#becomes false when player runs away, preventing running from next room 

@export_category("Room Data")
@export var room_num: int				#current room player is in

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Singleton.game_manager = self
	
	if Singleton.game_manager == null:
		print("I am null")
		
	#player setup
	hit_points = max_hit_points
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#_get_mouse_input()
	pass

func _get_mouse_input():
	var time = Time.get_unix_time_from_system()
	if time < last_poll_time + poll_rate:
		return
		
	last_poll_time = time
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#cast a ray
		var ray_dist: float = 1000
		var space_state = get_world_3d().direct_space_state
		var origin = camera.project_ray_origin(camera.get_viewport().get_mouse_position())
		var hit = origin + camera.project_ray_normal(camera.get_viewport().get_mouse_position()) * ray_dist
		#if a card was hit, display its information
		var query = PhysicsRayQueryParameters3D.create(origin, hit)
		query.collide_with_areas = true

		var result:Dictionary = space_state.intersect_ray(query)	#this collects all information from the ray cast and places them in dictionary
		#print(result)
		
		#display card info.
		if result.has("collider"):
			var card: Card = result["collider"]
			if card != null and card is Card:
				var card_type = CardData.CardType.keys()[card.card_type]	#prints the name of the enum value
				var value = card.card_value
				print("Card is {0} with value {1} ".format([card_type, value]))
				var card_text = "{0}\nValue: {1}".format([card_type, value])
				update_card_details.emit(card_text)							#HUD will be updated

func _physics_process(delta: float) -> void:
	_get_mouse_input()
