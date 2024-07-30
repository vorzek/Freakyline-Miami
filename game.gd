extends Node2D

@onready var gangster = preload("res://gangster.tscn")
@onready var pickup = preload("res://pick_up.tscn")

var enemy_alive = 0
var current_wave = 1
var enemies_per_wave = 2

func _ready():
	spawn_wave() #initial wave
	%ScoreSystem.visible = true #ensure score is shown
	%CurrencySystem.visible = true #ensure currency is shown

func _on_player_health_depleted(): #on death
	get_tree().paused = true
	%ScoreSystem.visible = false
	%GameOver.visible = true
	%GameOver/ColorRect/Label.show_final_score()
	
func are_enemies_remaining():
	enemy_alive = get_tree().get_nodes_in_group("enemies").size()
	#print(enemy_alive)

func spawn_enemy():
	print("enemy spawned")
	var new_enemy = gangster.instantiate()
	new_enemy.add_to_group("enemies")
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)
	print(self.global_position)

func spawn_wave():
	for i in range(current_wave * enemies_per_wave):
		spawn_enemy()

func wave_system():
	if enemy_alive == 0:
		%ShopMenu.show_shop()
		current_wave += 1
		%ScoreSystem/Wave.increment_wave()
		spawn_wave()

func spawn_pickup():
	var new_pickup = pickup.instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_pickup.global_position = %PathFollow2D.global_position
	add_child(new_pickup)

func _on_timer_timeout():
	are_enemies_remaining()
	wave_system()

func _on_pickup_timeout():
	spawn_pickup()
