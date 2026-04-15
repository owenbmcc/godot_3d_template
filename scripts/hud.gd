extends Control
## hud (head's up display)
## console for messages and counter for items, lives etc
## 
## basic node setup (will need additional ui nodes)
## 
## • Control (hud) # hud.gd
## • Label (console)
## • Label (item_counter)
## ~ Visual for counter (TextureRect, Sprite2D, AnimatedSprite2D, etc).
## 
## connect signals from portal, items collected etc.
## set up ui anchors and add other ui items for layout,
## container, center, vbox, hbox, etc.
## release mouse: set hud > Control > Mouse > Filter > Pass

# messages to player about game info
@export var console : Label

# example of a counter, displays a number
@export var item_counter : Label

func _ready() -> void:
	if console:
		console.text = ""
	mouse_filter = Control.MOUSE_FILTER_PASS

# connect signal from collected item
func _on_collected(item_name: String) -> void:
	if not global.items[item_name]:
		return
	item_counter.text = str(global.items[item_name])

# connect signal from level exit, npc, etc.
func _on_update_console(message: String) -> void:
	console.text = message
