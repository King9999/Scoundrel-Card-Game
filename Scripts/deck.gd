"""
Contains an array of Card nodes
"""

extends Node3D
class_name Deck

@export var cards: Array[Card] = []
@export var card_data: Array[CardData] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func draw_card(amount: int):
	#adds cards to the room. Four cards make up a room
	if amount <= 0:
		assert(false, "Cannot draw 0 cards")
		return
	pass


##Creates a fresh deck of cards. Card data is inserted to cards at random 
func shuffle_deck():
	#safety check
	if (cards.size() != card_data.size()):
		assert(false, "Card Data array doesn't match size of Card array!")
		return
	
	var used_data: Array[bool]
	used_data.resize(card_data.size())		#contents of array defaults to false upon resizing
		
	for i in cards.size():
		#randomly apply card data to cards
		var rand_num: int
		while true:
			rand_num = randi() % used_data.size()
			if used_data[rand_num] == false:
				break
				
		#add card data to card node	
		used_data[rand_num] = true
		cards[i].set_card_data(card_data[rand_num])	
