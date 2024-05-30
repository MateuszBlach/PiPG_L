extends CharacterBody3D

const SPEED = 6
const ROTSPEED = 7

func _ready():
	pass

func  _physics_process(delta):
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = -SPEED
		$MeshInstance3D.rotate_z(deg_to_rad(ROTSPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = SPEED
		$MeshInstance3D.rotate_z(deg_to_rad(-ROTSPEED))
	else:
		velocity.x = lerp(velocity.x,0.0,0.1)
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = SPEED
		$MeshInstance3D.rotate_x(deg_to_rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = -SPEED
		$MeshInstance3D.rotate_x(deg_to_rad(ROTSPEED))
	else:
		velocity.z = lerp(velocity.z,0.0,0.1)
		
	move_and_slide()


func _on_enemy_body_entered(body):
	if body.name == "Steve":
		get_tree().change_scene_to_file("res://game_over.tscn")
