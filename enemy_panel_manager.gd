extends Node

class_name EnemyPanelMngr

@onready var enemy_name: Label = %EnemyName
@onready var enemy_dmg: Label = %EnemyDMG
@onready var enemy_health: Label = %EnemyHealth
@onready var enemy_atk: Label = %EnemyATK
@onready var enemy_def: Label = %EnemyDEF
@onready var enemy_crit: Label = %EnemyCRIT

var e_health := 100.0
var e_atk := 100.0
var e_def := 100.0
var e_dmg = 0.0
var e_crit_rate := 0.05
var e_crit_dmg := 0.5

var xx := PlayerPanelMngr.new()

func enemy_dmg_received(): # this one's incomplete
	xx.dmg += 0.0
	e_health -= xx.dmg
	if e_health <= 0:
		e_health = 0
	enemy_health.text = "Health: " + str(e_health)

func enemy_dmg_sent():
	xx.def += 0.0
	var crit_chance = randf_range(0,1)
	var e_true_dmg = e_atk * 0.1
	var e_crit = 0.0
	
	if crit_chance <= e_crit_rate:
		e_dmg = (e_true_dmg - (e_true_dmg / xx.def))
		e_crit = (e_dmg + (e_dmg * e_crit_dmg))
		enemy_dmg.text = "DMG: " + str("%.1f" % e_crit)
		enemy_crit.text = "CRITICAL"
		enemy_crit.modulate = Color.RED
		print(e_crit)
	elif crit_chance >= e_crit_rate:
		e_dmg = (e_true_dmg - (e_true_dmg / xx.def))
		enemy_dmg.text = "DMG: " + str("%.1f" % e_dmg)
		enemy_crit.text = " "
		print(e_dmg)
	else:
		enemy_crit.text = " "
	
	
