extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal collided

var velocity = Vector2()
export var speed = 400


func _ready():
	pass
	
	"""
	func _process(delta):
	
	if Input.is_action_pressed("ui_up"):
		vert = -SpeedVert
	if Input.is_action_pressed("ui_down"):
		vert = SpeedVert
	if Input.is_action_pressed("ui_left"):
		hor = -SpeedHor
	if Input.is_action_pressed("ui_right"):
		hor = SpeedHor
	var move = Vector2(hor,vert)
	var tpos = $tiles.get_cellv(position + move)
	move_and_collide(move)
	print(tpos)
	hor = 0
	vert = 0
    #if (not get_node("PlayerBody").test_move(Position)):
        # get_node("PlayerBody").move(Position)
        #position = Position
	"""

func get_input():
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity.x *= speed
	velocity.y *= speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision:
			emit_signal('collided', collision)
