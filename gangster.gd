extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")
@onready var Score = get_node("/root/Game/ScoreSystem/Score")
@onready var Currency = get_node("/root/Game/CurrencySystem/Currency")

func _ready():
	add_to_group("enemies")
	%Punk.play_run_animation()


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 80.0
	move_and_slide()
	
	#Flipping the sprite
	if direction.x < 0:
		%Punk.scale.x = -1
	else:
		%Punk.scale.x = 1

	
func take_damage():
	health -= player.damage
	%Punk.play_hurt_animation()
	if health == 0:
		queue_free()
		Score.increment_score()
		Currency.increment_currency()
		
	#else:
		#is_hurt = false
		#%Punk.play_run_animation()
		#const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		#var smoke = SMOKE_EXPLOSION.instantiate()
		#get_parent().add_child(smoke)
		#smoke.global_position = global_position


func _on_enemy_animation_player_animation_finished(PunkHurt):
	%Punk.play_run_animation()
