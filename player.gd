extends CharacterBody2D

signal health_depleted

var health = 100
var speed = 350
var damage = 1

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%Cyborg.play_run_animation()
	else:
		%Cyborg.play_idle_animation()
	
	#Health Bars
	%HealthBar.value = health
	%Overheal.value = health
	if health > 100:
		%Overheal.visible = true
	else:
		%Overheal.visible = false
	
	#print(health) # For testing health increase
	#print(speed) # For testing increase speed button
	
	var mouse_position = get_global_mouse_position()
	
	if mouse_position.x > position.x: #looking right
			%Cyborg.scale.x = 1
			#%Area2D/Hurtbox.position.x = 1
			#%Area2D/Hurtbox.position.y = 6.667
			%CollisionShape2D.position.x = 1
			%CollisionShape2D.position.y = 6.667
			%ShootingPoint.position.x = 18.889
			%ShootingPoint.position.y = -1.667
	elif mouse_position.x < position.x: #looking left
			%Cyborg.scale.x = -1
			#%Area2D/Hurtbox.position.x = -1
			#%Area2D/Hurtbox.position.y = 6.667
			%CollisionShape2D.position.x = -1
			%CollisionShape2D.position.y = 6.667
			%ShootingPoint.position.x = -18.889
			%ShootingPoint.position.y = -1.667
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	# For Gun smoke animation on shoot, does not work, stuck on first frame
		#if velocity.length() > 0.0:
			#%Cyborg.play_GunSmokeRun_animation()
		#else:
			#%Cyborg.play_GunSmokeIdle_animation()
	
	const DAMAGE_RATE = 50.0
	var overlapping_mobs = %Hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		if health <= 0.0:
			health_depleted.emit()

func increase_health():
	health += 25
	print("health increased")

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	%ShootingPoint.add_child(new_bullet)
