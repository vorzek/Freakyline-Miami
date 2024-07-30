extends Label

var wave = 1

func increment_wave():
	wave += 1
	text = "Wave: " + str(wave)
