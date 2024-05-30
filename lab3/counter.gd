extends Label

var coins = 0

func _ready():
	text = "x"+str(coins)


func _on_coin_coin_collected():
	coins += 1
	if coins == 3:
		get_tree().change_scene_to_file("res://win.tscn")
	_ready()
