extends GridContainer;
const ItemClass = preload("Item.gd");
const ItemSlotClass = preload("ItemSlot.gd")


var index = 0

const slotTexture = preload("res://Images/square.png")
const itemImages = [
	preload("res://Images/Baguette with shadows.png"),
	preload("res://Images/inventoryIcons/htankIcon.png"),
	preload("res://Images/Oxygen Tank with Shadow.png"),
	preload("res://Images/inventoryIcons/radarIcon.png"),
	preload("res://Images/inventoryIcons/boosterIcon.png"),
	preload("res://Images/inventoryIcons/fluxIcon.png"),
]

const itemDictionary = {
	0: {
		"itemName": "Baguette",
		"itemIcon": itemImages[0]
	},
	1: {
		"itemName": "OxygenTank",
		"itemIcon": itemImages[2]
	},
	2: {
		"itemName": "Radar",
		"itemIcon": itemImages[3]
	},
	
	3: {
		
		"itemName": "Rocket Booster",
		"itemIcon": itemImages[4]
	},
	
	4: {
		"itemName": "flux capacitor",
		"itemIcon": itemImages[5]
	},
	
	5:
		{
		"itemName": "hydrogenTank",
		"itemIcon": itemImages[1]
			
		}
	
}

var slotList = Array()
var itemList = Array()

var holdingItem = null

func _ready():
	
	Global.Inventory = self
	
	for item in itemDictionary:
		var itemName = itemDictionary[item].itemName
		var itemIcon = itemDictionary[item].itemIcon
		
		itemList.append(ItemClass.new(itemName, itemIcon, null))
	
	for i in range(20):
		var slot = ItemSlotClass.new(i)
		slotList.append(slot)
		add_child(slot)



func removeItem():
	index = index-1
	
func addItem(name):
			
	if name == "baguette":
		slotList[index].setItem(itemList[0])
		index+=1

	elif name == "tank":
		slotList[index].setItem(itemList[1])
		index+=1
		
	elif name == "radar":
		slotList[index].setItem(itemList[2])
		index+=1
	
	elif name == "booster":
		slotList[index].setItem(itemList[3])
		index+=1
	
	elif name == "flux":
		 slotList[index].setItem(itemList[4])
		 index+=1
		
	elif name == "hydrogenTank":
		slotList[index].setItem(itemList[5])
		index+=1							
	

func _input(event):
	if holdingItem != null && holdingItem.picked:
		holdingItem.rect_global_position = Vector2(event.position.x, event.position.y)

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var clickedSlot;
		for slot in slotList:
			var slotMousePos = slot.get_local_mouse_position()
			var slotTexture = slot.texture;
			var isClicked = slotMousePos.x >= 0 && slotMousePos.x <= slotTexture.get_width() && slotMousePos.y >= 0 && slotMousePos.y <= slotTexture.get_height()
			if isClicked:
				print("clicked" + str(slot))
				clickedSlot = slot
				
				if clickedSlot.item != null:
					removeItem()
					if clickedSlot.item.name == "Baguette":				
						clickedSlot.useItem()
						Global.Player.heal_lp(20)
					    	
					elif clickedSlot.item.name == 	"OxygenTank":
						clickedSlot.useItem()
						Global.Player.gain_o2(20)
						
					   	
func save():
	pass
	
func load_state(data):
	pass
					
				
				
					
				
				
				
			
				
			
					
				
				
				
	
				
		
