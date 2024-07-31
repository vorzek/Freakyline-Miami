extends CharacterBody2D

signal health_depleted

var health = 100
var speed = 350
var damage = 1
var selected_slot = 1
 

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%Cyborg.play_run_animation()
	else:
		%Cyborg.play_idle_animation()
	
	#Health Bars
	%HealthBar.visible = true
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
	
	if Input.is_action_just_pressed("slot1"):
		selected_slot = 1
		%CyborgIdleShotgun.visible = false
		%CyborgRunShotgun.visible = false
		%CyborgIdlePistol.visible = true
		%CyborgRunPistol.visible = true	
		%CyborgRunMG.visible = false		
		%CyborgIdleMG.visible = false	


	if Input.is_action_just_pressed("slot2"):
		selected_slot = 2
		%CyborgIdleShotgun.visible = true
		%CyborgRunShotgun.visible = true
		%CyborgIdlePistol.visible = false
		%CyborgRunPistol.visible = false
		%CyborgRunMG.visible = false		
		%CyborgIdleMG.visible = false	

	if Input.is_action_just_pressed("slot3"):
		selected_slot = 3
		%CyborgIdleShotgun.visible = false
		%CyborgRunShotgun.visible = false
		%CyborgIdlePistol.visible = false
		%CyborgRunPistol.visible = false
		%CyborgRunMG.visible = true		
		%CyborgIdleMG.visible = true	

	if Input.is_action_just_pressed("shoot"):
		shoot()

	# if Input.is_action_pressed("shoot"):
	# 	_on_fast_shoot_timer_timeout()
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

func shoot(): # Normal fire for pistol, special fire for shotgun
	print("shooting")
	if selected_slot == 1:
		const BULLET = preload("res://bullet.tscn")
		var new_bullet = BULLET.instantiate()
		%ShootingPoint.add_child(new_bullet)
		
	elif selected_slot == 2:								
		const SHOTGUNBULLET = preload("res://ShotgunBullet.tscn")
		for i in range(3): # Shoot 3 bullets
			var new_shotgunbullet = SHOTGUNBULLET.instantiate()
			%ShootingPoint.add_child(new_shotgunbullet)


func _on_fast_shoot_timer_timeout(): # For MG shooting, can increase fire rate by changing timer wait time
	if Input.is_action_pressed("shoot"):       # Still kinda unresponsive tho since first bullet will wait for timer to trigger, so it wont trigger on click
		if selected_slot == 3:
			const MGBULLET = preload("res://ShotgunBullet.tscn")
			var new_mgbullet = MGBULLET.instantiate()
			%ShootingPoint.add_child(new_mgbullet)
