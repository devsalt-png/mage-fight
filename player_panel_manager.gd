extends Node

@onready var health_status: Label = %"Health Status"
@onready var atk_status: Label = %"ATK Status"
@onready var def_status: Label = %"DEF Status"
@onready var dmg_test_label: Label = %"dmg test label"

var health := 100.0
var atk := 100.0
var def := 100.0
var dmg = 0.0

func _10_dmg(): # this one's incomplete
	health -= 10
	if health <= 0:
		health = 0
	health_status.text = "Health: " + str(health)

func dmg_sent():
	var randNum = randf_range(1, 20)
	dmg = (atk * 0.1) + randNum
	round(dmg)
	dmg_test_label.text = "DMG: " + str(dmg)
	

	
