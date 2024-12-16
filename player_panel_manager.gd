extends Node

@onready var health_status: Label = %"Health Status"
var health := 100

func _10_dmg():
	health -= 10
	print(health)
	health_status.text = "Health: " + str(health)
