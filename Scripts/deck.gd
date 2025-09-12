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
	if amount <= 0 || amount > 4:
		assert(false, "Cannot draw 0 or more than 4 cards")
		return
	
	var board = Singleton.board	
	#cards must be placed in designated nodes on the board.
	for i in amount:
		var card: Card = cards.pop_front() 		#removes top card
		board.room[i] = card
		card.global_position = board.card_spaces[i].global_position
		
		#rotate card on its x axis so it lays flat
		card.set_face_up()
		card.disable_collision(false)			#can now hover over the card to view its data
		print("Card Pos: " + str(board.room[i].global_position))
		#print(card.rotation)


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
		cards[i].disable_collision(true)		#by default, collision boxes are disabled until the card is drawn. This prevents hovering over the deck to get info
		
		#create pile of cards
		if i > 0:
			var new_pos_y = cards[i - 1].global_position.y + (0.01 * i)
			cards[i].global_position = Vector3(cards[i].global_position.x, new_pos_y, cards[i].global_position.z)
		
		cards[i].set_face_down()
