extends CharacterBody2D

# movement constants - tweak these to change how the player feels
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# grab gravity from project settings so it matches other physics objects
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
    # apply gravity when not touching ground
    # this makes the player fall naturally
    if not is_on_floor():
        velocity.y += gravity * delta

    # jump only when on ground and space is pressed
    # prevents double jumping by checking is_on_floor()
    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    # get left/right input (-1 for left, 1 for right, 0 for none)
    var direction = Input.get_axis("ui_left", "ui_right")
    if direction:
        # move in the direction pressed
        velocity.x = direction * SPEED
    else:
        # gradually slow down when no input (feels more natural)
        velocity.x = move_toward(velocity.x, 0, SPEED)

    # actually move the player and handle collisions automatically
    move_and_slide()
