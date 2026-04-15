"""
for hud (head's up display)
console for messages and counter for items, lives etc

basic node setup (will need additional ui nodes)

• Control (hud) # hud.gd
	• Label (console)
	• Label (counter)

connect signals from portal, items collected etc.
release mouse: set hud > Control > Mouse > Filter > Pass
"""
extends Control

@export var console : Label
@export var counter : Label

func _ready():
	console.text = ""

func _on_collectible_item_collected():
	counter.text = str(global.apple_count)

func _on_pickup_area_update_console(message):
	console.text = message

func _on_portal_update_console(message):
	console.text = message
