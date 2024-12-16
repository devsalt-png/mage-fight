extends Node

@onready var health_status: Label = %"Health Status"
@onready var atk_status: Label = %"ATK Status"
@onready var def_status: Label = %"DEF Status"

var health := 100.0
var atk := 100.0
var def := 100.0

func _10_dmg():
	health -= 10
	if health <= 0:
		health = 0
	health_status.text = "Health: " + str(health)
