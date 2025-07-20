extends Area2D

# need reference to manager to update spawn point
var checkpoint_manager: Node2D

func _ready():
    # find the checkpoint manager in the scene
    checkpoint_manager = get_node("../../CheckpointManager")
    # automatically connect the signal when something enters our area
    body_entered.connect(_on_body_entered)

# runs whenever something enters the checkpoint area
func _on_body_entered(body:Node2D):
    # only care about the player, ignore other objects
    if body.name == "Player":
        # respawnpoint is a marker2d child that shows exact spawn location
        var respawn_point = $RespawnPoint
        # tell the manager to remember this spot
        checkpoint_manager.update_checkpoint(respawn_point.global_position)
        
        # let player know they hit a checkpoint
        print("checkpoint reached!")
        # add sound effects or animations here if you want



