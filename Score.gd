extends Label

var score = 0

func increment_score():
	score += 100
	text = "Score: " + str(score)
