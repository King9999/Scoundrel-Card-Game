"""
Anytime the player receives damage or gains health, a signal is emitted that's picked up by this class to adjust the values.

"""

extends Node2D
class_name HealthBar

@onready var healthbar_back: Sprite2D = $Back
@onready var healthbar_progress: Sprite2D = $Progress
@onready var healthbar_fill: Sprite2D = $Fill
var max_health: float					#this value is based on the health bar's X scale value
var flash_bar: bool						#if true, progress bar flashes
var last_flash_time: float
var flash_rate: float = 0.25

#track previous bar details
var prev_health_scale: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_health = healthbar_fill.scale.x		
	#print("bar width: " + str(max_health))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var new_x = healthbar_fill.scale.x - 0.1 * delta
	#healthbar_fill.scale.x = new_x
	if (flash_bar == true):
		var time = Time.get_unix_time_from_system()
		if time > last_flash_time + flash_rate:
			last_flash_time = time
			healthbar_progress.visible = !healthbar_progress.visible
				

##Shows how much damage player will take before taking the action. [br]
##[param damage_amount] is the damage the player will take, out of 20. This value is converted to a percentage, which is reflected in the bar.
func show_damage_preview(damage_amount: float):
	var game_manager = Singleton.game_manager
	var damage_percent = (game_manager.hit_points - damage_amount) / game_manager.max_hit_points
	#shows how much damage the player will take if they attack a monster
	#amount is the percentage of bar that will be lost.
	
	damage_percent = 1 if damage_percent > 1 else damage_percent
	damage_percent = 0 if damage_percent < 0 else damage_percent
	#print("damage %: " + str(1 - damage_percent))
	prev_health_scale = healthbar_fill.scale.x
	healthbar_fill.scale.x *= damage_percent
	#the damage portion flashes to get player attention.
	flash_bar = true

func undo_damage_preview():
	healthbar_fill.scale.x = prev_health_scale
	flash_bar = false

##Reduces health bar by converting [param damage_amount] into a percentage amount.
func reduce_healthbar(damage_amount: float):
	#health bar is reduced by percentage amount
	#fill bar is reduced immediately, while progress bar slowly decreases
	pass
