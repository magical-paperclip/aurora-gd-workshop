extends Node2D

# keeps track of where the player should respawn
var last_location: Vector2
# reference to the player so we can move them around
var player: CharacterBody2D

func _ready():
    # find the player node - assumes it's a sibling of this manager
    player = get_node("../Player")
    # start with player's current position as first checkpoint
    last_location = player.global_position

# called by checkpoint areas when player touches them
func update_checkpoint(new_location: Vector2):
    last_location = new_location
    print("checkpoint saved at: ", new_location)

# teleport player back to safety
func respawn_player():
    if player:
        # move player to last safe spot
        player.global_position = last_location
        # stop any weird movement from carrying over
        player.velocity = Vector2.ZERO
        print("respawned player at: ", last_location)

