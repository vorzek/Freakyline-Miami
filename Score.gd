extends Label

var score = 0

func increment_score():
	score += 1000
	text = "Score: " + str(score)
