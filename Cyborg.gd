extends Node2D

func play_idle_animation():
	#Show the idle sprite when idling, hide the running sprite
	%CyborgIdle.visible = true
	%CyborgRun.visible = false
	%AnimationPlayer.play("Idle")


func play_run_animation():
	#Show the running sprite when running, hide the idle sprite
	%CyborgIdle.visible = false
	%CyborgRun.visible = true
	%AnimationPlayer.play("Run")
	
func play_GunSmokeIdle_animation():
	#Show the idle sprite when idling, hide the running sprite
	%GunSmokeIdle.visible = true
	%GunSmokeRun.visible = false
	%AnimationPlayer.play("GunSmokeIdle")

func play_GunSmokeRun_animation():
	#Show the running sprite when running, hide the idle sprite
	%GunSmokeIdle.visible = false
	%GunSmokeRun.visible = true
	%AnimationPlayer.play("GunSmokeRun")

