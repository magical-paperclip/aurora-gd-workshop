extends Area2D

# references to important nodes we need to work with
var checkpoint_manager: Node2D
var player: CharacterBody2D

func _ready():
    # get references to manager and player
    checkpoint_manager = get_node("../../CheckpointManager")
    player = get_node("../../Player")
    
    # connect signal so we know when something enters death zone
    body_entered.connect(_on_body_entered)

# triggered when anything enters our death area
func _on_body_entered(body):
    # only kill the player, not other objects
    if body.name == "Player":
        kill_player()

# handle the death sequence
func kill_player():
    # give feedback that player died
    print("ouch! player died")
    
    # tiny pause makes death feel more impactful
    await get_tree().create_timer(0.1).timeout
    
    # bring player back to life at last checkpoint
    checkpoint_manager.respawn_player()
    
    # could add screen shake, particle effects, or sounds here
