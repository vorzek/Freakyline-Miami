extends Node2D

func play_run_animation():
	%EnemyAnimationPlayer.play("PunkRun")

func play_hurt_animation():
	%EnemyAnimationPlayer.play("PunkHurt")


func _on_check_hurt_timer_timeout():
	pass # Replace with function body.
