#import random
#Can you please take the below code and make it work with the example code using the below code as the main section
#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


extends Node2D

#signal card_free
signal card_freed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#These variables are used to store and track the cards that are in the player's hand, the opponent's hand, and the discard pile
var suits = {"0-21": "trumps", "21-35": "swords", "35-49": "pentacles", "49-63": "cups"}
var stopitnowImeanit = false
var canplay = false
var ranked = false
var dcard = null
var cardcountindex = 0
var cards = Array()
var scards = PackedStringArray()
var reusedcards = Array()
var discardpile = Array()  #Holds a list of cards that have been discarded by both players
var discardpile2 = Array()
var cardspicked = Array()
var actual = Array()
var playerhand = Array()   #Holds a list of cards that belong to the player
var playerhanddiscard = Array() #Holds a list of cards that have been discarded by the player.
var opponenthand = Array()
var opponenthanddiscard = Array()
var cardcount = 0
var handcount = 0
var handcount2 = 0
var showcard = null
var cardn = Array()
var cardc = Array()
var s = Vector2()
var lightpic = preload("res://assets/light.png")
const cardscript = preload("res://cardname.gd")
var backofdeck = preload("res://images/deckback.png")
var backofdeckrs = preload("res://images/deckbackrsize.png")
var inside = false
var selectedcard = null
var playedcard = null
var firstrow = false
var secondrow = false
var cycle = 0
var lastcycle = 0
var lastCardPlayed = 78
var lastCardPlayedmem = null
var lastcard = null
var currentCardPlayed = ""
var trumps = false
var wands = false
var pentacles = false
var cups = false
var swords = false
var valid = false
var wildcard = false
var countme = true
var newGame = true
var history = null
var Opcc = false
var lastsuit = null
var lsuit = "none"
var currentsuit = null
var samesuit = false
var notinhandcount2 = true
var samerank = false
var opponentsamesuit = false
var opponentsamerank = false
var lastcardname = "none"
var playedcardname = "none"
var currentcardplayedname = "none"
var cardcountpluscycle = 0
var cardcountcycle = 0
var cardcounttotal = 0
var oppoenenthandcount = 0
var oppindex = null
var oldoppindex = 0
var nocards = false
var player = 0
var firstplaythroughdeck = true
var top_card = null
var top_rank = null
var firstturn = true
var player_turn = 0
var player1_cardcount = null
var player_cardcount = null
var player2_cardcount = null
var oppygone = 0
var opponentplayedacard = false
var rand_generate
#var indexi = 0	
var index = 0
var indexz = null 
var firstcardplayed = true
var firstcardplayed2 = true
var turncount = 0
var turnmsg = "Turncount is "   #eeps track of the number of turns that have been taken in the game  
#Contains a string of text that updates to display the current turn number. Updates the 'turnmsg' variable with the current turn number
var pauseandchoosesuit = false
var choosepentacles = false
var choosewands = false
var chooseswords = false
var choosecups = false
var timelychoice = false
var bigarea = false
var timeon = false
var chosensuit = null
var chosen = null
var previous_suit = null
var previous1 = null
var previous2 = null
var lcard = null
var ncard = null
var rcheck = null

var deck = []
var discard_pile = []
var players = [1]
var current_player = 0
#var current_suit = ""

# Called when the node enters the scene tree for the first time.
func _ready():#This line simply defines the start of the "_ready()" function. It's a signal that's called when the script is first initialized.
	setCards()
	scards = shuffle(cards)
	#print(scards)
	#vector 2 resize??
	s.x = 0.5
	s.y = 0.5
	#pass # Replace with function body.
	# randomize seed
	rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	# generate a random integer between 1 and 10
	for card in playerhand:
		card.connect("card_freed", self, "_on_card_freed")    

#func _on_card_freed():
#	emit_signal("card_freed", self)
#	#maybe a problem area with two _on_card_freeds
##
	#Initialize current_hand to a list of cards that represents the 
	#player's hand
	#Setup the Tarot deck with 78 cards, including 22 trumps and 14 cards of
	# each of the four suits: pentacles, wands, cups, and swords. The cards in
	# each suit include a page, knight, queen, and king. The cards are shuffled
	# and dealt according to modified crazy eights rules
	#Creates an initial list of cards to be used in the game.
func setCards():
	cards.append("00_Fool")
	cards.append("01_Magician")
	cards.append("02_High_Priestess")
	cards.append("03_Empress")
	cards.append("04_Emperor")
	cards.append("05_Hierophant")
	cards.append("06_Lovers")
	cards.append("07_Chariot")
	cards.append("08_Strength")
	cards.append("09_Hermit")
	cards.append("10_Wheel_of_Fortune")
	cards.append("11_Justice")
	cards.append("12_Hanged_Man")
	cards.append("13_Death")
	cards.append("14_Temperance")
	cards.append("15_Devil")
	cards.append("16_Tower")
	cards.append("17_Star")
	cards.append("18_Moon")
	cards.append("19_Sun")
	cards.append("20_Judgement")
	cards.append("21_World")
	cards.append("22_Ace_of_Wands")
	cards.append("23_Two_of_Wands")
	cards.append("24_Three_of_Wands")
	cards.append("25_Four_o  f_Wands")
	cards.append("26_Five_of_Wands")
	cards.append("27_Six_of_Wands")
	cards.append("28_Seven_of_Wands")
	cards.append("29_Eight_of_Wands")
	cards.append("30_Nine_of_Wands")
	cards.append("31_Ten_of_Wands")
	cards.append("32_Page_of_Wands")
	cards.append("33_Knight_of_Wands")
	cards.append("34_Queen_of_Wands")
	cards.append("35_King_of_Wands")
	cards.append("36_Ace_of_Pentacles")
	cards.append("37_Two_of_Pentacles")
	cards.append("38_Three_of_Pentacles")
	cards.append("39_Four_of_Pentacles")
	cards.append("40_Five_of_Pentacles")
	cards.append("41_Six_of_Pentacles")
	cards.append("42_Seven_of_Pentacles")
	cards.append("43_Eight_of_Pentacles")
	cards.append("44_Nine_of_Pentacles")
	cards.append("45_Ten_of_Pentacles")
	cards.append("46_Page_of_Pentacles")
	cards.append("47_Knight_of_Pentacles")
	cards.append("48_Queen_of_Pentacles")
	cards.append("49_King_of_Pentacles")
	cards.append("50_Ace_of_Cups")
	cards.append("51_Two_of_Cups")
	cards.append("52_Three_of_Cups")
	cards.append("53_Four_of_Cups")
	cards.append("54_Five_of_Cups")
	cards.append("55_Six_of_Cups")
	cards.append("56_Seven_of_Cups")
	cards.append("57_Eight_of_Cups")
	cards.append("58_Nine_of_Cups")
	cards.append("59_Ten_of_Cups")
	cards.append("60_Page_of_Cups")
	cards.append("61_Knight_of_Cups")
	cards.append("62_Queen_of_Cups")
	cards.append("63_King_of_Cups")
	cards.append("64_Ace_of_Swords")
	cards.append("65_Two_of_Swords")
	cards.append("66_Three_of_Swords")
	cards.append("67_Four_of_Swords")
	cards.append("68_Five_of_Swords")
	cards.append("69_Six_of_Swords")
	cards.append("70_Seven_of_Swords")
	cards.append("71_Eight_of_Swords")
	cards.append("72_Nine_of_Swords")
	cards.append("73_Ten_of_Swords")
	cards.append("74_Page_of_Swords")
	cards.append("75_Knight_of_Swords")
	cards.append("76_Queen_of_Swords")
	cards.append("77_King_of_Swords")
	#cards.append("78_Back_of_Deck")
	
	
	#pictures references related to cards/scards 
	actual.append(preload("res://images/deck/00_Fool.png"))
	actual.append(preload("res://images/deck/01_Magician.png"))
	actual.append(preload("res://images/deck/02_High_Priestess.png"))
	actual.append(preload("res://images/deck/03_Empress.png"))
	actual.append(preload("res://images/deck/04_Emperor.png"))
	actual.append(preload("res://images/deck/05_Hierophant.png"))
	actual.append(preload("res://images/deck/06_Lovers.png"))
	actual.append(preload("res://images/deck/07_Chariot.png"))
	actual.append(preload("res://images/deck/08_Strength.png"))
	actual.append(preload("res://images/deck/09_Hermit.png"))
	actual.append(preload("res://images/deck/10_Wheel_of_Fortune.png"))
	actual.append(preload("res://images/deck/11_Justice.png"))
	actual.append(preload("res://images/deck/12_Hanged_Man.png"))
	actual.append(preload("res://images/deck/13_Death.png"))
	actual.append(preload("res://images/deck/14_Temperance.png"))
	actual.append(preload("res://images/deck/15_Devil.png"))
	actual.append(preload("res://images/deck/16_Tower.png"))
	actual.append(preload("res://images/deck/17_Star.png"))
	actual.append(preload("res://images/deck/18_Moon.png"))
	actual.append(preload("res://images/deck/19_Sun.png"))
	actual.append(preload("res://images/deck/20_Judgement.png"))
	actual.append(preload("res://images/deck/21_World.png"))
	actual.append(preload("res://images/deck/22_Ace_of_Wands.png"))
	actual.append(preload("res://images/deck/23_Two_of_Wands.png"))
	actual.append(preload("res://images/deck/24_Three_of_Wands.png"))
	actual.append(preload("res://images/deck/25_Four_of_Wands.png"))
	actual.append(preload("res://images/deck/26_Five_of_Wands.png"))
	actual.append(preload("res://images/deck/27_Six_of_Wands.png"))
	actual.append(preload("res://images/deck/28_Seven_of_Wands.png"))
	actual.append(preload("res://images/deck/29_Eight_of_Wands.png"))
	actual.append(preload("res://images/deck/30_Nine_of_Wands.png"))
	actual.append(preload("res://images/deck/31_Ten_of_Wands.png"))
	actual.append(preload("res://images/deck/32_Page_of_Wands.png"))
	actual.append(preload("res://images/deck/33_Knight_of_Wands.png"))
	actual.append(preload("res://images/deck/34_Queen_of_Wands.png"))
	actual.append(preload("res://images/deck/35_King_of_Wands.png"))
	actual.append(preload("res://images/deck/36_Ace_of_Pentacles.png"))
	actual.append(preload("res://images/deck/37_Two_of_Pentacles.png"))
	actual.append(preload("res://images/deck/38_Three_of_Pentacles.png"))
	actual.append(preload("res://images/deck/39_Four_of_Pentacles.png"))
	actual.append(preload("res://images/deck/40_Five_of_Pentacles.png"))
	actual.append(preload("res://images/deck/41_Six_of_Pentacles.png"))
	actual.append(preload("res://images/deck/42_Seven_of_Pentacles.png"))
	actual.append(preload("res://images/deck/43_Eight_of_Pentacles.png"))
	actual.append(preload("res://images/deck/44_Nine_of_Pentacles.png"))
	actual.append(preload("res://images/deck/45_Ten_of_Pentacles.png"))
	actual.append(preload("res://images/deck/46_Page_of_Pentacles.png"))
	actual.append(preload("res://images/deck/47_Knight_of_Pentacles.png"))
	actual.append(preload("res://images/deck/48_Queen_of_Pentacles.png"))
	actual.append(preload("res://images/deck/49_King_of_Pentacles.png"))
	actual.append(preload("res://images/deck/50_Ace_of_Cups.png"))
	actual.append(preload("res://images/deck/51_Two_of_Cups.png"))
	actual.append(preload("res://images/deck/52_Three_of_Cups.png"))
	actual.append(preload("res://images/deck/53_Four_of_Cups.png"))
	actual.append(preload("res://images/deck/54_Five_of_Cups.png"))
	actual.append(preload("res://images/deck/55_Six_of_Cups.png"))
	actual.append(preload("res://images/deck/56_Seven_of_Cups.png"))
	actual.append(preload("res://images/deck/57_Eight_of_Cups.png"))
	actual.append(preload("res://images/deck/58_Nine_of_Cups.png"))
	actual.append(preload("res://images/deck/59_Ten_of_Cups.png"))
	actual.append(preload("res://images/deck/60_Page_of_Cups.png"))
	actual.append(preload("res://images/deck/61_Knight_of_Cups.png"))
	actual.append(preload("res://images/deck/62_Queen_of_Cups.png"))
	actual.append(preload("res://images/deck/63_King_of_Cups.png"))
	actual.append(preload("res://images/deck/64_Ace_of_Swords.png"))
	actual.append(preload("res://images/deck/65_Two_of_Swords.png"))
	actual.append(preload("res://images/deck/66_Three_of_Swords.png"))
	actual.append(preload("res://images/deck/67_Four_of_Swords.png"))
	actual.append(preload("res://images/deck/68_Five_of_Swords.png"))
	actual.append(preload("res://images/deck/69_Six_of_Swords.png"))
	actual.append(preload("res://images/deck/70_Seven_of_Swords.png"))
	actual.append(preload("res://images/deck/71_Eight_of_Swords.png"))
	actual.append(preload("res://images/deck/72_Nine_of_Swords.png"))
	actual.append(preload("res://images/deck/73_Ten_of_Swords.png"))
	actual.append(preload("res://images/deck/74_Page_of_Swords.png"))
	actual.append(preload("res://images/deck/75_Knight_of_Swords.png"))
	actual.append(preload("res://images/deck/76_Queen_of_Swords.png"))
	actual.append(preload("res://images/deck/77_King_of_Swords.png"))
	#actual.append(preload("res://images/deckbackrsize.png"))

func shuffle(cardsy):
		# fisher-yates shuffle: given array with elements 0..n, 
		# for each index i from n down to 1, pick a random index j 
		# and swap elements at i and j.
		
		#var i
		var j
		var tmp
		for i in range(cardsy.size() - 1,0,-1):
		
			randomize()
			j = floor(randf() * (i + 1));
			tmp = cardsy[i]#this.deck[i];
			cardsy[i] = cardsy[j]
			cardsy[j] = tmp
		return cardsy

#This function is called each frame, and it contains the game logic
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This line of code is checking if the number of cards in the deck is equal to 78 and if the deck is being used for the first time.
	#check here for cardcount to be new number when deck is cycled through
	if (cardcount == 78 and firstplaythroughdeck): #or (cardcounttotal == 78 and firstplaythroughdeck):
		scards.clear()
#		scards = discardpile.duplicate()
		firstplaythroughdeck = false
		reusedcards = delete_duplicates(discardpile)
		scards = reusedcards.duplicate()
		#reusedcards = find_duplicates_small(scards)
		print("reused cards")
		print(" r e u s e d c a r d s r e u s e d c a r ds")
		print(reusedcards) # [1, 2, 3, 4, 5, 6]
		shuffle(scards)
		cardcount = 0
#		cardcounttotal = 0
		discardpile.clear()
	elif (cardcount == len(scards)-1):# and firstplaythroughdeck == false: #or (cardcounttotal == len(scards)):# removed two - 1 on len
#		scards.clear()
		scards.clear()
		scards = discardpile.duplicate()
		reusedcards = delete_duplicates(discardpile)
		#reusedcards = find_duplicates_small(scards)
		scards = reusedcards.duplicate()
		print("reused cards")
		print(" r e u s e d c a r d s r e u s e d c a r d s two")
		print(reusedcards) # [1, 2, 3, 4, 5, 6]
		shuffle(scards)
		cardcount = 0
#		cardcounttotal = 0
		discardpile.clear()

		s.x = 0.5
		s.y = 0.5
		cycle = cycle + 1

#	if (get_parent().get_node("GameRoom/Timer").time_left > 0):
	if ($Timer.time_left > 0):
		timeon = true
	else:
		timeon = false
		#print ("Timer is no longer active")	

	#if (get_parent().get_node("GameRoom/Timer2").time_left > 0):
		
	if ($Timer.time_left > 0):
		timelychoice = true
		pauseandchoosesuit = true
	else:
		timelychoice = false
		pauseandchoosesuit = false

	#if samesuit == true or samerank == true:
	if canplay == true:
		get_parent().get_node("AnimatedSprite2D").stop()
		get_parent().get_node("AnimatedSprite2D").hide()
	elif canplay == false:
		get_parent().get_node("AnimatedSprite2D").show()
		get_parent().get_node("AnimatedSprite2D").play("default")

#		get_parent().get_node("AnimatedSprite2D").stop()

	#all check for the same conditions, with the only 
	#difference being the suit that's being checked.
	# If the conditions are met, then certain actions are taken. 
	if(chooseswords or choosewands or choosepentacles or choosecups):
		chosen = true
	if (Input.is_action_just_released("mouseleft") and chooseswords and chosen == true):
		currentsuit ="swords"# chooseswords
#		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		#if chosen == true:
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if (get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == true):
			get_tree().get_root().get_node("GameRoom/choosesuit").hide()
		
		
		#$Timer3.start()
#			#get_tree().get_root().get_node("GameRoom/choosesuit").hide()
#		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
#		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing():
#			#chosen = false
#			pass
		currentsuit = "swords"
		chosen = false
	if (Input.is_action_just_released("mouseleft") and choosecups and chosen == true):
		currentsuit = "cups" #choosecups
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if (get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == true):
			get_tree().get_root().get_node("GameRoom/choosesuit").hide()
#				#get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
#		#if chosen == true:
#			#get_tree().get_root().get_node("GameRoom/choosesuit").hide()
		#$Timer3.start()
#		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
#		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing():
#			#get_tree().get_root().get_node("GameRoom/choosesuit").hide()
		currentsuit = "cups"
		chosen = false
#			pass
	if (Input.is_action_just_released("mouseleft") and choosewands and chosen == true):
		currentsuit = "wands" #choosewands
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if (get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == true):
			get_tree().get_root().get_node("GameRoom/choosesuit").hide()	
		chosen = false
		#$Timer3.start()
#		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
#			#get_tree().get_root().get_node("GameRoom/choosesuit").hide()
#		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing():
#			#get_tree().get_root().get_node("GameRoom/choosesuit").hide()
		currentsuit = "wands"
		#chosen = false
#			pass
	if (Input.is_action_just_released("mouseleft") and choosepentacles and chosen == true):
		currentsuit = "pentacles" #choosepentacles
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if (get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == true):
			get_tree().get_root().get_node("GameRoom/choosesuit").hide()
		#$Timer3.start()
		currentsuit = "pentacles"
		chosen = false
#		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
#				#get_tree().get_root().get_node("GameRoom/choosesuit").hide()
#		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing():
#				#get_tree().get_root().get_node("GameRoom/choosesuit").hide()
#				#chosen = false
#			pass	
#	if Input.is_action_just_released("mouseleft") and inside == false and (timeon == false or pauseandchoosesuit == false or timelychoice == true):#
		#chosen = true
		#pass		
		
		#This section of code checks for 
		#a bunch of conditions related to user input and game state. 
		
	if Input.is_action_just_released("mouseleft") and inside == false and timeon == false and pauseandchoosesuit == false:# and timelychoice == false):# && cycle == 0:
		print(" handcount at no card click count section  handcount at no card click count section  handcount at no card click count section ")
		print(handcount)
		print(handcount2)
		#add to player hand somehow
		lastcard = playedcard
		lastcardname = playedcardname
		player_turn = next_turn()
		print("!!!!!!!!player_turn - is - " + str(player_turn) + "    !!!!!!!!!!!!!!!")
		if player_turn == 0:
#			if get_node(Sprite3)
	#		get_node("Sprite3").texture = actual[lastcard
#			if playedcard:
#				get_node("Sprite3").texture = actual[playedcard.substr(0,2).to_int()]
	#			discardpile[discardpile.size()-1]
#				var disc = (discardpile[len(discardpile) - 1])#
			if discardpile != null and len(discardpile) - 1 >= 0:
				get_node("Sprite3").texture = actual[discardpile[len(discardpile) - 1].substr(0,2).to_int()]
				get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard
				get_node("Label12").text = playedcardname
				playedcard = discardpile[len(discardpile) - 1]
				print("adiscardpilecalled -- - - ")
			#pauseandchoosesuit = true
			
			#	cardcount = 0
#			if cardcount >= len(scards):
#			if range(scards.size()).has(cardcount):
			if len(scards) >= 1:
				#if len(scards[cardcount]) >= 1: #.length() >= 2:
				showcard = scards[cardcount].substr(0,2).to_int()
				previous1 = showcard #maybe should be playedcard
				#showcard = int(scards[cardcount][0] + scards[cardcount][1])
				get_node("Sprite2D").texture = actual[showcard]
				get_node("Label").text = scards[cardcount]
				get_node("Label2").text = str(cardcount)
				get_node("Timer").start()
				print("called")
				playedcard = showcard
#			else:
#				showcard = scards[cardcount].substr(0,2).to_int()
#				#showcard = int(scards[cardcount][0])
#				get_node("Sprite").texture = actual[showcard]
#				get_node("Label").text = scards[cardcount]
#				get_node("Label2").text = String(cardcount)
#				get_node("Timer").start()
#				print("called2")
				#get_node("Sprite3").texture = actual[previous1]
			if cardcount == len(scards):
				print("No cards currently available %%%%%%%%%No cards currently available%%%%")

#			showcard = scards[cardcount].substr(0,2).to_int()#alredy called.
			###print(String(showcard) + " " + scards[cardcount])

			cardn.append(TextureRect.new())
			#print(" scards and scards size  scards and scards size scards and scards size scards and scards size")
			#print(scards.size())
			#print(scards)
			if cardcounttotal >= 0 and cardcounttotal < scards.size():
#				card = scards[cardcounttotal]
				pass
			if cardcount >= 0 and cardcount < len(cardn):
		# do something with cardn[cardcounttotal]
				if (cardn[cardcounttotal] != null):
					#if(is_instance_valid(cardn[cardcounttotal])):
#						pass
#					else:
	#				weakref(cardn[cardcounttotal]).get_ref()
					if (is_instance_valid(cardn[cardcounttotal])):
						cardn[cardcounttotal].set_script(cardscript)
		###################################################################################################
						var lighter = PointLight2D.new()
						lighter.hide()
						lighter.set_name("lighter")
						lighter.texture = lightpic
						lighter.position.x = 40
						lighter.position.y = 70
						lighter.scale = s
				
						cardn[cardcounttotal].set_name("card" + str(cardcounttotal))#######################################################maybeuse cardcountcycle here
						if len(scards) >= 1:
							cardn[cardcounttotal].cardname = scards[cardcount]########?????????????????????????????????????not sure about cardcount
						cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
				
						cardn[cardcounttotal].connect("mouse_entered", Callable(cardn[cardcounttotal], "entered_mouse")) 
						cardn[cardcounttotal].connect("mouse_exited", Callable(cardn[cardcounttotal], "exited_mouse"))
	
						if handcount < 20:
							if(get_node("HBoxContainer") != null):
								get_node("HBoxContainer").add_child(cardn[cardcounttotal])
								if(get_node("HBoxContainer/card" + str(cardcounttotal)) != null):
									get_node("HBoxContainer/card" + str(cardcounttotal)).add_child(lighter)
									notinhandcount2 = true
							handcount = handcount + 1
							#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
						elif handcount >= 20 and handcount2 < 20: # && cycle == 0:
							if(get_node("HBoxContainer2") != null):
							#	if (cardcounttotal == len(cardn)-1):#started with 78 of cardcounttotal
								get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
								if(get_node("HBoxContainer2/card" + str(cardcounttotal)) != null):
									get_node("HBoxContainer2/card" + str(cardcounttotal)).add_child(lighter)
									notinhandcount2 = false
							handcount2 = handcount2 + 1	
				if len(scards) >= 1:			
					playerhand.append(scards[cardcount])  #Updates the player's hand after each player action
				print("1----------------------player-hand----------------------")
				print(playerhand)
				print("----------------------player-hand-end------------------")
				print(handcount)
				print(handcount2)					
		lastsuit = LCPlayedSuitCheck()#Checks whether the suit of the last card played matches the current suit
		rcheck = RegularRankCheck()
		TrumpRank()
		if samesuit == true:
			canplay = true
			get_parent().get_node("AnimatedSprite2D").hide()
		elif rcheck == true:
			canplay = true
			get_parent().get_node("AnimatedSprite2D").hide()
		elif ranked == true:
			canplay = true
			get_parent().get_node("AnimatedSprite2D").hide()
		elif samesuit == false or samerank == false or ranked == false:
			canplay = false
		
#		if canplay == false:
#			get_parent().get_node("AnimatedSprite2D").show()
#			get_parent().get_node("AnimatedSprite2D").play("default")
##			if lastcard:
#				discardpile.append(lastcard)#this is the thing
#				playerhanddiscard.append(lastcard)
#				playerhand.remove_at(lastcard)
#				get_node("Label9").text = scards[lastcard]
#
#				pass
				######################################################################################################################################
		if lastsuit:
			get_node("Label9").text = lastsuit	#changed lsuit to lastsuit
#				#if lsuit != null:
		#RegularRankCheck()		
			#if player_turn == 1:	
		#opponentplayedacard = false	
		Opponent()#Opponent" function, saying something like, "Calls the 'Opponent' function
		#updates the number of turns taken after each player action
		var t = turnmsg + str(turncount)  #Contains a string of text that is updated after each turn
		print(t)
		#print("!)!)!)!)!)!)!)!))!00000000000000000000000000000000000000000000000000000000!)!))!))!))!!)!)!)")
		if t != null:
			if get_node("turncount") != null:
				get_node("turncount").text = t
		turncount = turncount + 1
		#	opponentPlayCard()
##########################################################################regular card count place was here
		cardcount = cardcount + 1
		cardcounttotal = cardcounttotal + 1
		
	if Input.is_action_just_released("mouseleft") and inside and firstrow and timeon == false:# == false:# and pauseandchoosesuit == false:# or timelychoice == false):
		lastcard = playedcard
		lastcardname = playedcardname
		if has_node("HBoxContainer/" + selectedcard):#Checks whether a node with the specified name exists in the current scene. Calls the 'has_node' function to check whether a node exists
			print("played card " + get_node("HBoxContainer/" + selectedcard).cardname)
			playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
			#playedcardname = 
			playedcardname = get_node("HBoxContainer/" + selectedcard).cardname
			currentCardPlayed = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
			if playedcard != null:  #maybe uncomment
				lastcard = playedcard
				lastcardname = playedcardname
				
			if currentCardPlayed != null:
				lastCardPlayed = currentCardPlayed
			currentcardplayedname = get_node("HBoxContainer/" + selectedcard).cardname
			get_node("Sprite2").texture = actual[playedcard]
			discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)#Updates the list of discarded cards after each player action.
			playerhanddiscard.append((get_node("HBoxContainer/" + selectedcard).cardname)) #Updates the list of discarded cards after each player action
			
			#Not sure about remove_at logic here. not sure where index is updating
			#Invalid get index '0' (on base: 'Array').
		#	var
		
			indexz = playerhand.find("playedcard")
			
			if indexz == -1:
				print("array is empty")
			else:
				if playerhand.size() >= 0:
					if indexz == -1:
						print("negative 1    or -1")
					else:
						playerhand.remove_at(indexz)
					handcount2 = handcount2 - 1
					print(indexz)
				else:
					print("maybe -1 for size?")
#			for phi in playerhand:
#				if playerhand.size() >= 0:
#					if playerhand[int(phi)-1] != null:
#						print(playerhand[int(phi)-1])
#				else:
#					print("running on empty")		
#				if(playedcard == int(phi)): #int(playerhand[phi.substr(0,2)]) -1):
#					handcount = handcount - 1			
#					playerhand.remove_at(int(phi))#opponenthand[index]
			
			#	firstrow = false
			#	inside = false
				print(handcount)

			print("************** player hand discard ****************")
			print(playerhanddiscard)
			print(str(handcount) + " - handcount")
			print("^^^^^^^^^^discardpile^^^^^^^^^^^^^^^^^^^^")
			print(discardpile)
			#reusedcards.append(get_node("HBoxContainer/" + selectedcard))
			var selectedtemp = selectedcard.substr(0,2).to_int()
			if is_instance_valid(cardn[selectedtemp]):
				cardn[selectedtemp].free()
			emit_signal("card_freed", selectedcard)
			get_node("HBoxContainer/" + selectedcard).free()#queue_free()#.hidewasusedhereforatry
			
			#self.card_freed(selectedcard)
#			if handcount < 20 && handcount2 == 0:
#				handcount = handcount - 1
#			elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
#				handcount = handcount - 1
			if handcount < 20 && handcount2 == 0:
				handcount = handcount - 1
			elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
				handcount = handcount - 1

			print("2----------------------player-hand----------------------")
			print(playerhand)
			print("----------------------player-hand-end------------------")
			print(handcount)
			print(handcount2)	
		
		
			#print(currentCardPlayed)
			#print("there here")#printprintprintprint
			lastsuit = LCPlayedSuitCheck()#Checks whether the suit of the last card played matches the current suit
			rcheck = RegularRankCheck()
			TrumpRank()
			if samesuit == true:
				canplay = true
				get_parent().get_node("AnimatedSprite2D").hide()
			elif rcheck == true:
				canplay = true
				get_parent().get_node("AnimatedSprite2D").hide()
			elif ranked == true:
				canplay = true
				get_parent().get_node("AnimatedSprite2D").hide()
			elif samesuit == false or samerank == false or ranked == false:
				canplay = false
				#not sure about this show() instance
				get_parent().get_node("AnimatedSprite2D").show()		
#			if canplay == false:
#				get_parent().get_node("AnimatedSprite2D").show()
#				get_parent().get_node("AnimatedSprite2D").play("default")

#			if samesuit == true or samerank == true or ranked == true:
#				canplay = true
#			else:
#				canplay = false
#				pass
			if lastsuit:
				get_node("Label9").text = lastsuit	
			#RegularRankCheck()
			#opponentplayedacard = false
			Opponent()#Opponent" function, saying something like, "Calls the 'Opponent' function
			#updates the number of turns taken after each player action
			var t = turnmsg + str(turncount)  #Contains a string of text that is updated after each turn
			if t != null:
				if get_node("turncount") != null:
					get_node("turncount").text = t
			turncount = turncount + 1
			#cardcount = cardcount + 1
			#lastCardPlayed = currentCardPlayed

		
	if Input.is_action_just_released("mouseleft") and inside and secondrow and timeon == false:# and pauseandchoosesuit == false:# or timelychoice == false):
		lastcard = playedcard
		lastcardname = playedcardname

		if has_node("HBoxContainer2/" + selectedcard):#Checks whether a node with the specified name exists in the current scene. Calls the 'has_node' function to check whether a node exists
			print("played card" + get_node("HBoxContainer2/" + selectedcard).cardname)
			playedcard = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
			playedcardname = get_node("HBoxContainer2/" + selectedcard).cardname
			
			currentCardPlayed = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
			if playedcard != null: # maybe uncomment
				lastcard = playedcard
				lastcardname = playedcardname
			if currentCardPlayed != null:
				lastCardPlayed = currentCardPlayed

			currentcardplayedname = get_node("HBoxContainer2/" + selectedcard).cardname
			get_node("Sprite2").texture = actual[playedcard]
			###print(get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int())
			discardpile.append(get_node("HBoxContainer2/" + selectedcard).cardname)  #Updates the list of discarded cards after each player action.
			#discardpile2.append(get_node("HBoxContainer2/" + selectedcard))
			playerhanddiscard.append((get_node("HBoxContainer2/" + selectedcard).cardname)) #Updates the list of discarded cards after each player action
			
			
			indexz = playerhand.find("playedcard")
			
			if indexz == -1:
				print("array is empty")
			else:
				if playerhand.size() >= 0:
					if indexz == -1:
						print("negative 1    or -1")
					else:
						playerhand.remove_at(indexz)
					handcount2 = handcount2 - 1
					print(indexz)
				else:
					print("maybe -1 for size?")
			
			
			
			print("************** player hand discard ****************")
			print(playerhanddiscard)#maybe should be different variable name since this is selected card something or other start here !!!!!!!!!!!!!!!!!!!!!!!!!!
			print("^^^^^^^^^^discardpile^^^^^^^^^^^^^^^^^^^^")
			print(discardpile)
#			reusedcards.append(get_node("HBoxContainer2/" + selectedcard))
			emit_signal("card_freed", selectedcard)
			get_node("HBoxContainer2/" + selectedcard).free()#queue_free()
			handcount2 = handcount2 - 1
			#print(currentCardPlayed)
			
			
			
			
			print("there there")	
			print("3----------------------player-hand----------------------")
			print(playerhand)
			print("----------------------player-hand-end------------------")
			print(handcount)
			print(handcount2)	
			
			lastsuit = LCPlayedSuitCheck()#Checks whether the suit of the last card played matches the current suit
			if lastsuit:
				get_node("Label9").text = lastsuit
				#if lsuit != null:
				#not sure about label11 here
				#get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard playedcard
			#RegularRankCheck()				
			rcheck = RegularRankCheck()
			TrumpRank()
			#opponentplayedacard = false
			Opponent()#Opponent" function, saying something like, "Calls the 'Opponent' function

			var t = turnmsg + str(turncount) #Contains a string of text that is updated after each turn
			if t != null:
				if get_node("turncount") != null:
					get_node("turncount").text = t
			turncount = turncount + 1
			#lastsuit = LCPlayedSuitCheck()#Checks whether the suit of the last card played matches the current suit
			if samesuit == true:
				canplay = true
				get_parent().get_node("AnimatedSprite2D").hide()
			elif samerank == true:
				canplay = true
				get_parent().get_node("AnimatedSprite2D").hide()
			elif ranked == true:
				canplay = true
				get_parent().get_node("AnimatedSprite2D").hide()
			elif samesuit == false or samerank == false or ranked == false:
				canplay = false
		
#			if canplay == false:
#				get_parent().get_node("AnimatedSprite2D").show()
#				get_parent().get_node("AnimatedSprite2D").play("default")
#			if samesuit == true or samerank == true or ranked == true:
#				canplay = true
#			else:
#				canplay = false
	#		pass
		#cardcount = cardcount + 1
			#pass
		#lastCardPlayed = currentCardPlayed

	
func next_turn() -> int:
	if(current_player == 1):
		current_player = 0
		return current_player
	else:
		current_player = 1
		return current_player


#func LCPlayedStart(currentCardPlayed):
#	lastCardPlayed = currentCardPlayed
	#Checks whether the suit of the last card played matches the current suit.
	
	#Checks whether the suit of the last card played matches the current suit
	#Performs a check on the suit of the last card played
func LCPlayedSuitCheck() -> String:
	#print(currentCardPlayed)
	print(playedcard)
	print("that was the current card played")
	
	if (len(discardpile) <= 0):
		return ""
#fairly certain these two lines aren't needed
#	lastCardPlayed = discardpile[len(discardpile) - 1]
#	currentCardPlayed = lastCardPlayed
	#print(len(discardpile))
	#lastCardPlayedmem = lastCardPlayed
	#lastCardPlayed = currentCardPlayed	
	#############################################
	else:
		lastcard = discardpile[len(discardpile) - 1] #maybe move this somewhere else but it works for now
		lastcardname = (discardpile[len(discardpile) - 1])#.cardname
	#showcard = scards[playedcard].substr(0,2).to_int()
	#showcard = scards[currentCardPlayed].substr(0,2).to_int()
	#showcard = currentCardPlay
	if playedcard != null:
		print("hello playedcard here")
		if discardpile:
			print("hey I guess there's a discard pils")
#		if discardpile != null:
#			#maybe make currentsuit here a lastsuit...
#			currentsuit = discardpile[len(discardpile) - 1]  #Performs a check on the suit of the last card played
#			print("the current suit is " + str(currentsuit))
#			print("textextextext ------------------------------aboveaboveabove----------------------")
			
		#currentCardPlayed = currentCardPlayed.substr(0,2).to_int()
		#print(String(currentCardPlayed) + " yoyoyoyoyoyoyoyoy")
#		print(len(scards)-1)
#		print(currentCardPlayed)
		if (int((playedcard)) >= (len(scards)-1)):#################:
			print("Error: playedcard is out of bounds2")
			return ""
#		print(String(currentCardPlayed) )
#		print(scards[int(currentCardPlayed)])
#		print("+++++")
		if (int((playedcard)) <= 21):
			trumps = true
			print("trumps")
			wands = false
			pentacles = false
			cups = false
			swords = false
			currentsuit = "trumps"
			#get_node("Label9").text = "trumps"
#			print("so I guess pickSuit")
#			pickSuit()
			if lastsuit:
				print(str(lastsuit) + "lastsuit -----current suit " + currentsuit)
				get_node("Label9").text = lastsuit
			if currentsuit:
				get_node("Label10").text = currentsuit
				get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard
		elif (int((playedcard)) > 21 and (int(playedcard)) <= 35):
			wands = true
			print("wands")
			trumps = false
			pentacles = false
			cups = false
			swords = false
			currentsuit = "wands"
			if lastsuit:
				get_node("Label9").text = lastsuit #"wands"
				
				#duplicates in this area up and down
			if currentsuit:
				get_node("Label10").text = currentsuit
				get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard
		elif (int((playedcard)) > 35 and (int(playedcard)) <= 49):
			pentacles = true
			print("pentacles")
			trumps = false
			wands = false
			cups = false
			swords = false
			currentsuit = "pentacles"
			if lastsuit:
				get_node("Label9").text = lastsuit#"pentacles"
			if currentsuit:
				get_node("Label10").text = currentsuit
				get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard
		elif(int((playedcard)) > 49 and int((playedcard)) <= 63):
			cups = true
			print("cups")
			trumps = false
			wands = false
			pentacles = false
			swords = false
			currentsuit = "cups"
			if lastsuit:
				get_node("Label9").text = lastsuit#"cups"
			if currentsuit:
				get_node("Label10").text = currentsuit
				get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard
		elif(int((playedcard)) > 63 and int((playedcard)) <= 77):
			swords = true
			print("swords")
			trumps = false
			wands = false
			pentacles = false
			cups = false
			currentsuit = "swords"
			if lastsuit:
				get_node("Label9").text = lastsuit#"swords"
			if currentsuit:
				get_node("Label10").text = currentsuit
				get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard playedcard
		elif(int(playedcard) == 78):
			get_node("Label9").text = "deckback"
			currentsuit = "none this is the deckback"
		print("currentsuit is ------> " + currentsuit)
		
		
		#something here is off with lastsuit and currentsuit
		
		#if lastsuit == null:
		#lastsuit = currentsuit
		if lastsuit == null:
			if lastsuit == currentsuit:
				samesuit = true
				print("the suit is the same condition ::true::")
			else:
				samesuit = false
				print("the suit is not the same ::false::")
			lastsuit = currentsuit	
#		else:
#			lastsuit = currentsuit
	
		#lastCardPlayed = currentCardPlayed
	return currentsuit
	

		
func RegularRankCheck():
##############################################
##This section of logic needs scrutiny      ##
##############################################

	if(playedcard):
		if(lastcard):
			print(playedcard)
			print(lastcard)
			print("+++++++++++++++++played card and lastcard respectively+++++++++++++++++++++++++++++++++++++++++")
#			if playedcard.find(lastcard):
#				samerank = true
#			else:
#				samerank = false
			#seems to work now with this find statement.
			if (playedcardname.find(lastcardname)):
#			if (int(playedcard) == int(lastcard)):
				samerank = true
				print("rank is the same" + str(playedcard) + "  " + str(lastcard))
			else:
				samerank = false
#			if (int(playedcard) <= 21 and int(lastcard) <= 21):
#				#TrumpRank() depricated using a function for one if statement seems too much
#				#do trump rank here
#				#not sure if picking suit shuold be here
#				if (int(playedcard) > int(lastcard)):
#					playerpickSuit()
#					#currentsuit = "trumps"
#					print(" - ranking just occured - current card greater than last card")
#					print(currentsuit)
##					if chosensuit:
##						get_node("Label10").text = chosensuit
#					get_node("Label9").text = lastsuit #current_suit
#	#				currentsuit = chosensuit
#				else:
#					if (int(playedcard) <= 21):
#						pickSuit()
#
#				get_node("Label9").text = lastsuit #current_suit
#				#if(int(playedcard) > 21 and int(lastcard) > 21):
#			if (currentcardplayedname.substr(3,4) == lastcardname.substr(3,4)):
#				samerank = true
#				print("This is the current and last card rank match" + currentcardplayedname + " ------last-card-name------>>>" + lastcardname)
#				print(currentcardplayedname.substr(3,4) + " ------  " + lastcardname.substr(3,4))
#			else:
#				print("no match for rank")
#				samerank = false
##				else:
#					if (int(currentCardPlayed) <= 21):
#						pickSuit()
#	#pass
#possibly make a return samerank statement
			return samerank
	
func TrumpRank():
	print("do trump rank here")
	#if(currentCardPlayed):
	if playedcard:
		if(int(playedcard) <= 21):
			if (int(playedcard) > int(lastcard)):
				playerpickSuit()
				ranked = true
			else:
				ranked = false
				pickSuit()
	#pass
	
		#Handles logic related to the opponent's actions
func Opponent():
	#rcheck = RegularRankCheck
	print("opponent:")
	
	#maybe don't need both these two blocks
	if cardcount < scards.size():
		if scards[cardcount] != null:
			var card = scards[cardcount]
			print(card)
			if int(card) >= 0:
				showcard = card.substr(0,2)
				playedcard = showcard
				playedcardname = card
			else:
				showcard = card.substr(0,1)
				playedcard = showcard
				playedcardname = card
			nocards = false

			playedcardname = card
			#print("testbed area areaarea areaarea areaarea areaarea areaarea areaarea areaarea areaarea area" + scards[cardcount])
		

#	nocards = true#not sure why I had a nocards set to true here
	for card in scards:
		if card != null:
			var areyouseriouslen = card.substr(0,2)
			#areyouseriouslen = int(areyouseriouslen)
			var converted_int = areyouseriouslen.to_int()
			#if areyouseriouslen.is_number():
#			playedcard = int(card.substr(0,2))
#			playedcardname = card
			if converted_int != 0: #maybe needs to be >=
				showcard = converted_int
				nocards = false
				break
			playedcard = showcard#???
			#int(card.substr(0,2))
			playedcardname = card
			print("a playedcard instance is set.")
		if card == null:
			print("No more cards in deck, wait until cards are played. Opponent Turn.")
		#	get_node("Timer").start()#maybe maybe maybe maybe 
			#opponentPlayCard()
			get_node("Sprite2D").texture = backofdeckrs

			#break    #not sure if need break here
	#if range(scards.size()).has(cardcount):
	if cardcount >= 0 and cardcount <= scards.size(): #not sure if <= would be better or not
		#I'm getting an Invalid get index '0' (on base: 'Array'). with this line
		if len(scards) >= 1:
			if is_instance_valid(scards[cardcount]):
				print("has instance valid scards-cardcount")
				if (cardcount == int(scards[cardcount].substr(0,2))):
#		elif cardcount == scards.substr(0,2).isdigit():
					print("No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%No cards currently available%%%%%%%%%%%%%%%%%%%")
					#nocards = true
			#showcard == 78#maybe not showcard 78 here
#	if (cardcount == len(scards)-1):#not sure about a minus one here
#		pass#figure this out later
	if nocards:
		print("No more cards in deck, wait until cards are played. Opponent Turn.")
	#	get_node("Timer").start()#maybe maybe maybe maybe 
		#opponentPlayCard()
		get_node("Sprite2D").texture = backofdeckrs
		return
#	else:
	if(player_turn == 1):
#			if oldoppindex != null:
##				var previous2 = lastcard.substr(0,2).to_int()
#				get_node("Sprite3").texture = actual[oldoppindex]#showcard]
	#				var disc = (discardpile[len(discardpile) - 1])#
		if discardpile:
			get_node("Sprite3").texture = actual[discardpile[len(discardpile) - 1].substr(0,2).to_int()]
			get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcard	
			lcard = discardpile[len(discardpile) - 1]#playedcard	
#			if oldoppindex != null:
#				var previous = lastcard.substr(0,2).to_int()
#				if player_turn == 0:
#					get_node("Sprite3").texture = actual[showcard]
#					pauseandchoosesuit = true
#				if player_turn == 1:
#					get_node("Sprite3").texture = actual[oldoppindex]#showcard]
			#discardpile.append(lastcard)##########################################maybe this needs uncommented not sure
		#	get_node("Label3").text = lastcardname# scards[cardcount]#######################################################################################################
		get_node("Label3").text = ("blah" + playedcardname)#scards[lastCardPlayed]# scards[cardcount]#######################################################################################################
		get_node("Label4").text = str(cardcount)
			
			#get card for opponent
			#showcard = scards[cardcount].substr(0,2).to_int()#already called
		print(str(showcard)) 
		if len(scards) >= 1:
			print(scards[cardcount])
		
		if len(scards) >= 1:
			if scards[cardcount] != null:
#			if cardcount >= 0
			##########get_node("Sprite").texture = actual[showcard]
				showcard = scards[cardcount].substr(0,2).to_int()
				get_node("Label").text = scards[cardcount]
				get_node("Label2").text = str(cardcount)
			if firstcardplayed:
				get_node("Sprite4").texture = actual[showcard]
				firstcardplayed = false
			else:
				if playedcard:
					var pc = int(playedcard.substr(0,2))
					get_node("Sprite4").texture = actual[pc]
			get_node("Label5").text = scards[cardcount]
			get_node("Label6").text = str(cardcount)
			var opponentmsg = "Your Oppenent Took a Card -" + scards[cardcount]
			print(opponentmsg)


		cardn.append(TextureRect.new())
#			cardcount = cardcount + 1
#			cardcounttotal = cardcounttotal + 1
		if cardcounttotal >= 0 and cardcounttotal < len(cardn):
			if range(cardn.size()).has(cardcounttotal):
#				  print()
	#		if len(cardn) 
#			if (cardn[cardcounttotal] != null):
#					if index >= 0 and index < len(opponenthand):# tried indenting down to break not sure if correct
				if(is_instance_valid(cardn[cardcounttotal])):
					cardn[cardcounttotal].set_script(cardscript)
		###################################################################################################
					var lighter = PointLight2D.new()
					lighter.hide()
					lighter.set_name("lighter")
					lighter.texture = lightpic
					lighter.position.x = 40
					lighter.position.y = 70
					lighter.scale = s
			
					cardn[cardcounttotal].set_name("card" + str(cardcounttotal))#######################################################maybeuse cardcountcycle here
					if len(scards) >= 1:
							#if oppindex != null:
						cardn[cardcounttotal].cardname = scards[cardcount]
#						else:
#							cardn[cardcounttotal].cardname = scards[cardcounttotal]
					#????\/????
					cardn[cardcounttotal].add_child(lighter)
					cardn[cardcounttotal].add_child(Sprite2D.new())
					if scards:
						if scards.size() >= 0:
							showcard = scards[cardcount].substr(0,2).to_int()
					if oppindex != null:
						cardn[cardcounttotal].get_child(0).set_texture(actual[oppindex])
					else:
						cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
					cardn[cardcounttotal].get_child(0).set_scale(Vector2(0.16, 0.16))
					cardn[cardcounttotal].get_child(0).set_position(Vector2(0,0))
			

			
#maybe not take these out not sure	
#		cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
#		cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
					if len(scards) >= 1:
						opponenthand.append(scards[cardcount])
					print("----------------------opponent-hand----------------------")
					print(opponenthand)
					print("----------------------opponent-hand-end------------------")
					#opponentplayedacard = false
					$Timer.start()
					#get_node("Timer").start() # this calls the opponentPlayCard
					get_node("Sprite4/PointLight2D").show()
					
					#lastsuit = LCPlayedSuitCheck()
#			print(opponenthanddiscard)
					#RegularRankCheck()
	###lastsuit off regularrankcheck off
# Function to handle the opponent's turn and play a card from their hand
func opponentPlayCard():
	oppygone = 0#maybe not needed
	print("the opphand   ")
	for i in range(len(opponenthand)):
		print("here aya aye aye aye aye aye here :" + str(i))
		# if (playedcard):
	# Loop through the opponent's hand
	for ophand in opponenthand:
		# Extract the index of the card
		oppindex = ophand.substr(0,2).to_int()
		print(ophand + " :oyoyoyoyooyoyoyoyoyoyoyoyoyoyoy")
		currentCardPlayed = top_rank
		# Get the last played suit from a function (not shown)
		#maybe put back in not sure...
		#lastsuit = LCPlayedSuitCheck()

#was using remove instead of erase not sure what to use now remove_at or earse...
#messing with ifs and elifs

		# Check for opponent's trumps (cards with index <= 21)
		if oldoppindex > 0:# and oppindex != null:
#		if oppindex != null:
			if oppindex <= 21 and oldoppindex <= 21:
				stopitnowImeanit = true
				#play the card
				print("I should play my TRUMP card! yay!!")
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = lastsuit  #ophand#playedcardname#scards[cardcount]#double check this
				get_node("Label4").text = str(cardcount)#and this
				discardpile.append(ophand)	#Updates the list of discarded cards after each player action.
				#not sure about index variable
				#if oppindex >= 0 and
				opponenthanddiscard.append(ophand)
#				opponenthand.remove_at(opponenthand[oppindex])
#				opponenthand.remove_at(ophand)				
#				opponenthand[oppindex]
 # Check for same rank card in opponent's hand and remove it
				if index >= 0 and index < len(opponenthand):
					if ophand.substr(0, 2) == opponenthand[index].substr(0, 2):
						print(index, opponenthand[index])
						opponenthanddiscard.append(opponenthand[index])
						opponenthand.remove_at(index)
				# Decide the next suit to be played
				
########################################################################

#				if oppindex > oldoppindex:
#					playerpickSuit()
#				else:
#					pickSuit()
#				if lastsuit:
#					print(lastsuit)
#				if oppindex != null:
#					oldoppindex = oppindex
#
#				for indexx in range(len(opponenthand)):
#					print(str(indexx) + "-index-and-opponent-hand-index-" + opponenthand[indexx])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						#opponenthand[index].
#						#ophand.remove_at(index)
#						opponenthand.remove_at(indexx)
#						print("match------match-------match-----")
#						break

				#if index >= 0 and index < len(opponenthand):# tried indenting down to break not sure if correct
#				for index in range(len(opponenthand)-1): # removed - 1 from len ohand
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						print(str(index) + "was index and now opponenthand index" + opponenthand[index])
#						opponenthanddiscard.append(opponenthand[index])
##						OS.remove(opponenthand, index)
## was remove_at index instead of oppindex
#						#opponenthand.remove_at(ophand.substr(0,2))
#						opponenthand.erase(index)
			
					##############lastsuit = LCPlayedSuitCheck()
				if oppindex > oldoppindex:
					playerpickSuit()
				else:
					pickSuit()
					#opponentplayedacard = true		
				if lastsuit:
				############get_node("Label9").text = lastsuit	
					print(lastsuit)
					print(" variable above is lastsuit" + lastsuit)
#		if oppindex != null:
#		#else:
#			oldoppindex = oppindex
#					#break
##		elif oldoppindex != null and oppindex != null:		
#			opponentplayedacard = true
#

#check here for indentation issue or better elifs


#experimenting
#take out and try...
		#if oldoppindex != null and oppindex != null:
		if (oldoppindex > 0):
			if(oppindex > 21 and oppindex < 78 and canplay):
#			if (ophand.substr(3,4) == lastcardname.substr(3,4)):
	# Check if the card has the same suit as the last played card
#	if (playedcardname.find(lastcardname)):
##			if (int(playedcard) == int(lastcard)):
#				samerank = true
#				print("rank is the same" + str(playedcard) + "  " + str(lastcard))
#			else:
#				samerank = false
#
				if ophand.find(lastcardname):# == lastcardname.substr(3, 4):
					samerank = true
					print("worked then")
				else:
					samerank = false
				
				print("opponent play card for rank " + str(oppindex) + "  -- for card " + lastcardname + " and " + ophand)
#				opponentsamerank = true
#
				#not sure about same rank
				#if samerank:
			
				#print("opponent play card for rank" + str(oppindex) + "  -- for card" + lastcardname + " and " + ophand)
#				opponentsamerank = true
					# Update UI with card details
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#lastcardname#playedcardname#scards[cardcount]
				get_node("Label4").text = str(cardcount)
				discardpile.append(ophand)		#Updates the list of discarded cards after each player action.
				#hereherehereherehrereherehere
				#print("IN FUNCTION JUNCTION ******look here for index, opponenthand[index]********")	
				opponenthanddiscard.append(ophand)
##					#################lastsuit = LCPlayedSuitChe
				# Check for same rank card in opponent's hand and remove it
				for indexx in range(len(opponenthand)-1):
					if ophand.substr(0, 2) == opponenthand[indexx].substr(0, 2):
						print(indexx, opponenthand[indexx])
						opponenthanddiscard.append(opponenthand[indexx])
						opponenthand.remove_at(indexx)
						break
		#		opponentplayedacard = true
				if oppindex != null:
					oldoppindex = oppindex
					#opponentPlayCard()
					#break		
				#if oldoppindex != null and oppindex != null:
				#work on the logic here... maybe some more if statements on non lastsuit options
			#############################################indent only two
			# Check for different suits (wands, pentacles, cups, and swords)
		if (oldoppindex > 0):
			#oldoppindex != null and oppindex != null:
			if (oppindex > 21 && oppindex <= 35) and lastsuit == "wands" and canplay:# or oppindex > 21 && oppindex <= 35:
				print("opponent play card for wands" + str(oppindex))
				#if (lastsuit == "wands"):
				opponentsamesuit = true
				#play the card
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = str(cardcount)
				discardpile.append(ophand)		#Updates the list of discarded cards after each player action.
				#not sure about this one line
				#opponenthanddiscard.append(ophand)
	#			opponenthand.remove_at(ophand)		
				for indexx in range(len(opponenthand)-1):
					if(ophand.substr(0,2) == opponenthand[indexx].substr(0,2)):
						print(index, opponenthand[indexx])
						opponenthanddiscard.append(opponenthand[indexx])
						opponenthand.remove_at(indexx)
						break
				#opponentplayedacard = true
				#########lastsuit = LCPlayedSuitCheck()
				lastsuit= "wands"
				if oppindex != null:
					oldoppindex = oppindex
				#break
			
				#if oldoppindex != null and oppindex != null:
		if (oldoppindex > 0):
				#if oldoppindex != null and oppindex != null:
			if(oppindex > 35 && oppindex <= 49) and lastsuit == "pentacles" and canplay:
				#if (lastsuit == "pentacles"):
				opponentsamesuit = true
				print("opponent play card for pentacles" + str(oppindex))
			
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = str(cardcount)
				discardpile.append(ophand)		#Updates the list of discarded cards after each player action.
				#not sure about this line
				#opponenthanddiscard.append(ophand)
		
				for indexx in range(len(opponenthand)):
					if(ophand.substr(0,2) == opponenthand[indexx].substr(0,2)):
						print(indexx, opponenthand[indexx])
						opponenthanddiscard.append(opponenthand[indexx])
						opponenthand.remove_at(indexx)
						break

				#opponentplayedacard = true
				lastsuit = "pentacles"
				if oppindex != null:
					oldoppindex = oppindex
				#break
					#if oldoppindex != null and oppindex != null:
		if (oldoppindex > 0):
				#if oldoppindex != null and oppindex != null:
			if (oppindex > 49 && oppindex <= 63) and lastsuit == "cups" and canplay:
				#if(lastsuit == "cups"):
				opponentsamesuit = true				
				
				print("opponent play card for cups" + str(oppindex))
				opponentsamesuit = true	
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = str(cardcount)
				discardpile.append(ophand)#Updates the list of discarded cards after each player action.
		
				opponenthanddiscard.append(ophand)
				for indexx in range(len(opponenthand)):
					if(ophand.substr(0,2) == opponenthand[indexx].substr(0,2)):
						print(indexx, opponenthand[indexx])
						opponenthanddiscard.append(opponenthand[index])
						opponenthand.remove_at(indexx)
						break

				lastsuit = "cups"
				#opponentplayedacard = true
				if oppindex != null:
					oldoppindex = oppindex
				#break
					#if oldoppindex != null and oppindex != null:
			if (oldoppindex > 0):
					#if oldoppindex != null and oppindex != null:
				if (oppindex > 63 and oppindex <= 77) and lastsuit =="swords" and canplay:	
					#if (lastsuit == "swords"):
					opponentsamesuit = true
					
					
					print("opponent play card for swords" + str(oppindex))
					opponentsamesuit = true
					get_node("Sprite2").texture = actual[oppindex]
					get_node("Label3").text = ophand#playedcardname# scards[cardcount]
					get_node("Label4").text = str(cardcount)
					discardpile.append(ophand)	#Updates the list of discarded cards after each player action.
					opponenthanddiscard.append(ophand)

					for indexx in range(len(opponenthand)):				
						if(ophand.substr(0,2) == opponenthand[indexx].substr(0,2)):
							print(indexx, opponenthand[indexx])
							opponenthanddiscard.append(opponenthand[indexx])
							opponenthand.remove_at(indexx)
							break
				#opponenthand.remove_at(ophand)
			
#indentation may be off for this block
					lastsuit = "swords"
			#lsuit = LCPlayedSuitCheck()
				#	opponentplayedacard = true
			if oppindex != null:
				oldoppindex = oppindex
				#break
			if(oppindex == 78):
					print("deckback")
			#break				
#		if oppindex != null:
#		#else:
#			oldoppindex = oppindex
					#break
#		elif oldoppindex != null and oppindex != null:		
#####################################################    ################### ######## ############# ######## not sure if this is neeeded or not really unsure.
# Play the trump card (index <= 21)
#		if ophand != null and oppindex <= 21 and stopitnowImeanit:
##			print("I should play my TRUMP card! yay!!")
#				#play the card
#			print("I should play my TRUMP card! yay!!")
#			get_node("Sprite2").texture = actual[oppindex]
#			get_node("Label3").text = lastsuit  #ophand#playedcardname#scards[cardcount]#double check this
#			get_node("Label4").text = str(cardcount)#and this
#			discardpile.append(ophand)	#Updates the list of discarded cards after each player action.
#				#not sure about index variable
#				#if oppindex >= 0 and
#			opponenthanddiscard.append(ophand)
##				opponenthand.remove_at(opponenthand[oppindex])
##				opponenthand.remove_at(ophand)				
##				opponenthand[oppindex]
# # Check for same rank card in opponent's hand and remove it
#			#if index >= 0 and index < len(opponenthand):
#			for indexx in range(len(opponenthand)-1):
#				if ophand.substr(0, 2) == opponenthand[indexx].substr(0, 2):
#					print(index, opponenthand[indexx])
#					opponenthanddiscard.append(opponenthand[indexx])
#					opponenthand.remove_at(indexx)
#			stopitnowImeanit = false
# had an issue with indexx added - 1 to see if it fixes it.
	#leaving these less indented maybe needs change or not
	#opponentplayedacard = true

	lastsuit = LCPlayedSuitCheck()#Checks whether the suit of the last card played matches the current suit

		#elif oppindex != null:# not sure if this is needed in this case kindof
		#indented to merge to last if.
	oldoppindex = oppindex
		#oppindex = 0
	print(lastsuit)
	print("= lastsuit")


#
##seeing if it breaks having this commented out....
#			#with if ophand != null: not sure if should just be oppindex...
#		if oppindex != null:
#			if oppindex <= 21:
#			#play the card
#				print("I should play my TRUMP card!!!")
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname#scards[cardcount]#double check this
#				get_node("Label4").text = str(cardcount)#and this
#				discardpile.append(ophand)	
#				if index >= 0 and index < len(opponenthand):# tried indenting down to break not sure if correct
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						print(index, opponenthand[index])
#						opponenthanddiscard.append(opponenthand[index])
#						opponenthand.remove_at(index)
#					opponentplayedacard = true
#					#########lastsuit = LCPlayedSuitCheck()
#					pickSuit()
#				else:
#					print("Index out of range")	

#		if oppindex != null:# not sure if this is needed in this case kindof
#		#indented to merge to last if.
#			oldoppindex = oppindex
#			#oppindex = 0
#			print(lastsuit)
#			print("= lastsuit")
		#lsuit = LCPlayedSuitCheck()
#			if lastsuit:
#				get_node("Label9").text = lastsuit	
#				print(lastsuit)
#				print("lastsuit" + lastsuit)
			#break
#		lastCardPlayed = playedcard		
	lastcard = playedcard	# maybe needed maybe not
	lastcardname = playedcardname
	oppygone = oppygone + 1

	#opponentplayedacard = true #not sure needed
#			print("^^^^^^^^^^^^^opponent hand discard^^^^^^^^^^^^^^^^^^^^^^^^")
	#lastsuit = LCPlayedSuitCheck()
#			print(opponenthanddiscard)
#


#maybe needed not sure
##maybe not needed
#	RegularRankCheck()
#	if discardpile:
#		get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcar
#		ncard = discardpile[len(discardpile) - 1]#playedcard	
#	print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")		
#	print("new opponent hand is ")
#	print(opponenthand)
	#for o in opponenthand:
	#	print(o)
		
func playerpickSuit():
	#not sure if need timer2 or not
	#$Timer2.start()
	#$Timer2.start()
	#get_parent().get_node("GameRoom/")
	#find_node("choosesuit").show()
	get_parent().get_node("choosesuit/acewands/PointLight2D").hide()
	get_parent().get_node("choosesuit/acepentacles/PointLight2D").hide()
	get_parent().get_node("choosesuit/acecups/PointLight2D").hide()
	get_parent().get_node("choosesuit/aceswords/PointLight2D").hide()
	#.get_node("choosesuit").show()
#	if(timelychoice == true):
	get_tree().get_root().get_node("GameRoom/choosesuit").show()
	get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadein")

	get_parent().get_node("choosesuit/acewands/PointLight2D").hide()
	get_parent().get_node("choosesuit/acepentacles/PointLight2D").hide()
	get_parent().get_node("choosesuit/acecups/PointLight2D").hide()
	get_parent().get_node("choosesuit/aceswords/PointLight2D").hide()
	#get_parent().get_node("GameRoom/choosesuit").show()
	print("Suit will be picked.")
	#lastsuit = LCPlayedSuitCheck()
	pauseandchoosesuit = true
	
	#if chosen:
	if Input.is_action_just_released("mouseleft") and choosewands: # and get_tree().get_root().get_node("GameRoom/choosesuit").visible == true: # and pauseandchoosesuit == false:	
		currentsuit = "wands"
#		pauseandchoosesuit = false
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == false:
			get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").hide()
		
	elif Input.is_action_just_released("mouseleft") and chooseswords:# and get_tree().get_root().get_node("GameRoom/choosesuit").visible == true:# and pauseandchoosesuit == false:
		currentsuit = "swords" 
#		pauseandchoosesuit = false
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == false:
			get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").hide()

	elif Input.is_action_just_released("mouseleft") and choosepentacles:# and get_tree().get_root().get_node("GameRoom/choosesuit").visible == true:# and pauseandchoosesuit == false:
		currentsuit = "pentacles"
#		pauseandchoosesuit = false
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == false:
			get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").hide()

	elif Input.is_action_just_released("mouseleft") and choosecups == true: # and get_tree().get_root().get_node("GameRoom/choosesuit").visible == true:##and pauseandchoosesuit == false:
		currentsuit = "cups"
#		pauseandchoosesuit = false
		get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
		if get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == false:
			get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").hide()
	
	
	#not sure if this section is needed or not
#	#lastsuit = chosensuit
#	if currentsuit:
#		get_node("Label10").text = currentsuit
##		lastsuit = chosensuit
#		pauseandchoosesuit = false
#		chosen = true  
#	get_node("Label9").text = lastsuit
#	# a - 1 on len discardpile
#	if discardpile:
#		get_node("Label11").text = discardpile[len(discardpile) -1]#playedcar
#	#currentsuit = chosensuit
#	#chosen = true  
#
			
func pickSuit():
	print("Suit will be picked. pickSuit() ran... ")
	#lsuit = LCPlayedSuitCheck()
	var rand_int = rand_generate.randi_range(1,4)
	# print random number
	#print (rand_int)

	if rand_int == 1:
		lastsuit = "wands"
		wands = true
		print("wands picked")
		trumps = false
		pentacles = false
		cups = false
		swords = false
		currentsuit = "wands"
#		get_node("Label9").text = "wands"
	if rand_int == 2:
		lastsuit = "pentacles"
		pentacles = true
		print("pentacles picked")
		trumps = false
		wands = false
		cups = false
		swords = false
		currentsuit = "pentacles"
	##	get_node("Label9").text = "pentacles"
	if rand_int == 3:
		lastsuit = "cups"
		cups = true
		print("cups picked")
		trumps = false
		wands = false
		pentacles = false
		swords = false
		currentsuit = "cups"
	##	get_node("Label9").text = "cups"
	if rand_int == 4:
		lastsuit = "swords"
		swords = true
		print("swords picked")
		trumps = false
		wands = false
		pentacles = false
		cups = false
		currentsuit = "swords"
#		get_node("Label9").text = "swords"		
	
	if playedcard:
		if int(playedcard) >= len(scards) - 1:#maybe not this - 1 here     #-1:#################:
			print("Error: currentCardPlayed is out of bounds1")
			return ""
		print("+++the current card+++")		
		print(str(playedcard)) 
		if len(scards) >= 1:
			print(scards[int(playedcard)])
			print("++++the current card ends++++")
		if lastsuit:
			get_node("Label9").text = "- picksuit() - " + lastsuit	
	#var rand_int = rand_generate.randi_range(1,4)
	# print random number
			get_node("Label10").text = currentsuit	
			print(str(rand_int) + " is random for " + lastsuit + " lastsuit")
#	if lastsuit:
			if lastsuit == currentsuit:
				samesuit = true
				print("the suit is the same condition ::true::")
			else:
				samesuit = false
				print("the suit is not the same ::false::")
		#lastsuit = currentsuit	
			if discardpile:
				get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcar
#		get_node("Label11").text = playedcard

	
		
#	if lastsuit == null:				###not sure what was going on here 
##		lastsuit = currentsuit
##		if lastsuit != null:
#	if lastsuit:
#		if lastsuit == currentsuit:
#			samesuit = true
#			print("the suit is the same condition ::true::")
#		else:
#			samesuit = false
#			print("the suit is not the same ::false::")
#		#lastsuit = currentsuit	
#		if discardpile:
#			get_node("Label11").text = discardpile[len(discardpile) - 1]#playedcar
##		get_node("Label11").text = playedcard
#

func get_resized_texture(t: Texture, width: int = 0, height: int = 0) -> Texture:
	if t != null:
		var image = t.get_image()
	
		if width > 0 && height > 0:
			image.resize(width, height)
		
		var new_texture = ImageTexture.new()
	
		new_texture = ImageTexture.create_from_image(image)
		return new_texture
	else:
		print("Unsupported texture type.")
		return null

	
func entered_mouse():
	self.get_node("lighter").show()  
	
func exited_mouse():
	self.get_node("lighter").hide()
	#get_node("HBoxContainer/card" + String(cardcount-1) + "/lighter").hide()



func _on_HBoxContainer_mouse_entered():
	firstrow = true

func _on_HBoxContainer_mouse_exited():
	firstrow = false

func _on_HBoxContainer2_mouse_entered():
	secondrow = true

func _on_HBoxContainer2_mouse_exited():
	secondrow = false


#func find_duplicates_small(a):
#	var duplicates = []
##	var j = 0
##	var k = 0
#	for j in range(0, a.size()):
#		for k in range(j+1, a.size()):
#			if a[j] == a[k]:
#				duplicates.append(a[k])
#
#	print(" DRUMROLL THE DUPLICATES ARE DRUMROLL THE DUPLICATES ARE DRUMROLL THE DUPLICATES ARE")
#	print(duplicates)
#	return duplicates
#
				
func delete_duplicates(array: Array):
	var result = []
	for i in range(array.size()):
		var duplicated = false
		for j in range(i+1, array.size()):
			if array[i] == array[j]:
				duplicated = true
				break
		if not duplicated:
			result += [array[i]]
	return result

func _on_Timer_timeout():
	#opponentplayedacard = false	
	opponentPlayCard()
	get_node("Sprite4/PointLight2D").hide()


func _on_Timer2_timeout():
	get_tree().get_root().get_node("GameRoom/choosesuit").hide()
#	get_parent().get_node("GameRoom/choosesuit").hide()
	pickSuit()
	pauseandchoosesuit = true
	#pass # Replace with function body.

func _on_Area2Dwands_mouse_entered():
	print("wands chosen")
	choosewands = true
	#if bigarea == false:
	get_parent().get_node("choosesuit/acewands/PointLight2D").show()
	

func _on_Area2Dwands_mouse_exited():
	choosewands = false
	print("not wands")
	#if bigarea == true:
	get_parent().get_node("choosesuit/acewands/PointLight2D").hide()
#	pass # Replace with function body.


func _on_Area2Dpentacles_mouse_entered():
#	pass # Replace with function body.
	choosepentacles = true
	#if bigarea == false:
		#pass # Replace with function body.
	print("pentacles chosen")
#	if Input.
	get_parent().get_node("choosesuit/acepentacles/PointLight2D").show()


func _on_Area2Dpentacles_mouse_exited():
	choosepentacles = false
	print("not pentacles")
	#pass # Replace with function body
	#if bigarea == true:
	get_parent().get_node("choosesuit/acepentacles/PointLight2D").hide()

func _on_Area2Dcups_mouse_entered():
	#pass # Replace with function body.
	choosecups = true
	#if bigarea == false:
		#pass # Replace with function body.
	print("cups chosen")
	get_parent().get_node("choosesuit/acecups/PointLight2D").show()

			
func _on_Area2Dcups_mouse_exited():
	#pass # Replace with function body.
	print("not cups")
	choosecups = false
	#pass # Replace with function body.
	#if bigarea == true:
	get_parent().get_node("choosesuit/acecups/PointLight2D").hide()	


func _on_Area2Dswords_mouse_entered():
#	pass # Replace with function body.
	chooseswords = true
	#if bigarea == false:
	print("swords chosen")
		#pass # Replace with function body.
	get_parent().get_node("choosesuit/aceswords/PointLight2D").show()
	
	
func _on_Area2Dswords_mouse_exited():
	print("not swords")
	#pass # Replace with function body.
	chooseswords = false
	#pass # Replace with function body.
	#if bigarea == true:
	get_parent().get_node("choosesuit/aceswords/PointLight2D").hide()


func _on_Area2D_mouse_entered():
#	if player_turn == 0:
	timelychoice = true
	bigarea = true
#	if (timelychoice):
#		if(bigarea):
#			pass # Replace with function body.


func _on_Area2D_mouse_exited():
	bigarea = false
	timelychoice = false

func _on_Timer3_timeout():
#	get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").play("fadeout")
#	if (get_tree().get_root().get_node("GameRoom/choosesuit/AnimationPlayer").is_playing() == false):
#		get_tree().get_root().get_node("GameRoom/choosesuit").hide()
	chosen = false

func _on_h_box_container_mouse_entered():
	firstrow = true

func _on_h_box_container_mouse_exited():
	firstrow = false

func _on_card_freed(card):
#	var cardx = card as int
	if card:
		playerhand.remove_at(card.substr(0,2).to_int())
	#pass


