extends Node2D

@onready var player = get_node("/root/Game/Player")

func play_idle_animation():
	#Show the idle sprite when idling, hide the running sprite
	if player.selected_slot == 1: # ONLY %CyborgIdlePistol.visible = true
		%CyborgIdleMG.visible = false
		%CyborgRunMG.visible = false
		%CyborgRunPistol.visible = false
		%CyborgRunShotgun.visible = false
		%CyborgIdleShotgun.visible = false
		%CyborgIdlePistol.visible = true
		%AnimationPlayer.play("IdlePistol")
	if player.selected_slot == 2: # ONLY %CyborgIdleShotgun.visible = true
		%CyborgIdleMG.visible = false
		%CyborgRunMG.visible = false
		%CyborgRunPistol.visible = false
		%CyborgRunShotgun.visible = false
		%CyborgIdlePistol.visible = false
		%CyborgIdleShotgun.visible = true
		%AnimationPlayer.play("IdleShotgun")
	if player.selected_slot == 3: # ONLY %CyborgIdleMG.visible = true
		%CyborgRunMG.visible = false
		%CyborgRunPistol.visible = false
		%CyborgRunShotgun.visible = false
		%CyborgIdlePistol.visible = false
		%CyborgIdleShotgun.visible = false
		%CyborgIdleMG.visible = true
		%AnimationPlayer.play("IdleMG")


func play_run_animation():
	#Show the running sprite when running, hide the idle sprite
	if player.selected_slot == 1: # ONLY %CyborgRunPistol.visible = true
		%CyborgIdleMG.visible = false
		%CyborgRunMG.visible = false
		%CyborgIdleShotgun.visible = false
		%CyborgIdlePistol.visible = false
		%CyborgRunShotgun.visible = false
		%CyborgRunPistol.visible = true
		%AnimationPlayer.play("RunPistol")
	if player.selected_slot == 2: # ONLY %CyborgRunShotgun.visible = true
		%CyborgIdleMG.visible = false
		%CyborgRunMG.visible = false
		%CyborgIdleShotgun.visible = false
		%CyborgIdlePistol.visible = false
		%CyborgRunPistol.visible = false
		%CyborgRunShotgun.visible = true
		%AnimationPlayer.play("RunShotgun")
	if player.selected_slot == 3: # ONLY %CyborgRunMG.visible = true
		%CyborgIdleMG.visible = false
		%CyborgIdleShotgun.visible = false
		%CyborgIdlePistol.visible = false
		%CyborgRunPistol.visible = false
		%CyborgRunShotgun.visible = false
		%CyborgRunMG.visible = true
		%AnimationPlayer.play("RunMG")
	
# func play_GunSmokeIdle_animation():
# 	#Show the idle sprite when idling, hide the running sprite
# 	%GunSmokeIdle.visible = true
# 	%GunSmokeRun.visible = false
# 	%AnimationPlayer.play("GunSmokeIdle")

# func play_GunSmokeRun_animation():
# 	#Show the running sprite when running, hide the idle sprite
# 	%GunSmokeIdle.visible = false
# 	%GunSmokeRun.visible = true
# 	%AnimationPlayer.play("GunSmokeRun")