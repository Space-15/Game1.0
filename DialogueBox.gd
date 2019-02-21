#DiDialogueBox.gd
extends RichTextLabel

var dialogue = ["Use the arrow keys to move", "Use the left-mouse button to select", "Press 'z' to attack", "Press 't' to use your torch"]
var page = 0					#Current text passage

func _ready(): 
	set_bbcode(dialogue[page])
	set_visible_characters(0)	#Current chracter position
	set_process_input(true)		#Allows user action

func _input(event):
	if (event.is_action_pressed("ui_accept")):	#Was input mousebutton and was it pressed
		if get_visible_characters() > get_total_character_count():	#If the total number of characters in the text passage has been exceeded,
			if page < dialogue.size()-1:	#if current page number is less than the total number of pages
				page += 1	#Move onto the next page
				set_bbcode(dialogue[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1) #Increments to the next character in the text passage
