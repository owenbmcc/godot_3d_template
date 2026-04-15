extends Node
## global references
## save variable counts, config vars etc.
## Project > Project Settings > Globals
## name "global" (all lowercase)

enum ItemTypes {
	COUNTABLE = 0, 	# int, count up or down (ex. coins)
	SINGLE = 1,		# bool, on or off (ex. key for specific door), default off
}

var items = {}

func register_item(item_name, item_type) -> void:
	if item_name in items.keys():
		return
	
	if item_type == ItemTypes.COUNTABLE:
		items[item_name] = 0
	
	if item_type == ItemTypes.SINGLE:
		items[item_name] = false

func update_item(item_name) -> void:
	if typeof(items[item_name]) == TYPE_INT:
		items[item_name] = items[item_name] + 1
	if typeof(items[item_name]) == TYPE_BOOL:
		items[item_name] = !items[item_name]
