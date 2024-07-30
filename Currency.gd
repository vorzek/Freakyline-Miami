extends Label

var currency = 0

func increment_currency():
	currency += 100

func _physics_process(delta):  # always keep the currency text display updated
	text = "Currency: \n" + str(currency)
