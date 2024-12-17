extends Node

class_name PlayerPanelMngr

@onready var health_status: Label = %"Health Status"
@onready var atk_status: Label = %"ATK Status"
@onready var def_status: Label = %"DEF Status"
@onready var dmg_status: Label = %"DMG Status"
@onready var critical: Label = %CRITICAL

var health := 100.0
var atk := 100.0
var def := 100.0
var dmg := 0.0
var player_crit_rate := 0.05
var player_crit_dmg := 0.5

var xx := EnemyPanelMngr.new()

func player_dmg_received(): # this one's incomplete
	xx.e_dmg += 0.0
	health -= xx.e_dmg
	if health <= 0:
		health = 0
	health_status.text = "Health: " + str(health)

func player_dmg_sent():
	xx.e_def += 0.0
	var crit_chance = randf_range(0,1)
	var p_true_dmg = atk * 0.1
	var p_crit = 0.0
	
	if crit_chance <= player_crit_rate:
		dmg = (p_true_dmg - (p_true_dmg / xx.e_def))
		p_crit = (dmg + (dmg * player_crit_dmg))
		dmg_status.text = "DMG: " + str("%.1f" % p_crit)
		critical.text = "CRITICAL"
		critical.modulate = Color.RED
		print(p_crit)
	elif crit_chance >= player_crit_rate:
		dmg = (p_true_dmg - (p_true_dmg / xx.e_def))
		dmg_status.text = "DMG: " + str("%.1f" % dmg)
		critical.text = " "
		print(dmg)
	else:
		critical.text = " "
	
func stats_bonus():
	var atk_multi := 0.0
	var atk_flat := 0
	var def_multi := 0.0
	var def_flat := 0
	var health_multi := 0.0
	var health_flat := 0
	var cr_bonus := 0.0
	var cd_bonus := 0.0
	
	# figure out how to update these. i think if functions can work here
	# if player has hp_artifact, then += such and such
	
	health += health_flat
	health += health * health_multi
	atk += atk_flat
	atk += atk * health_multi
	def += def_flat
	def += def * def_multi
	player_crit_rate += cr_bonus
	player_crit_dmg += cd_bonus
