extends Control

var typeLetterButton: Button
var lettersTypedLabel: Label
var typedLetters: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_connect_nodes()
	_connect_button_signals()
	_update_label()

# Connect the variables to nodes in the scene tree
func _connect_nodes() -> void:
	lettersTypedLabel = get_node("%Label")
	typeLetterButton = get_node("%Button")

# Connect the button signals
func _connect_button_signals() -> void:
	typeLetterButton.button_up.connect(_on_button_pressed)

# Update the label on top of the screen
func _update_label() -> void:
	lettersTypedLabel.text = "Letters typed: %s" %typedLetters

# Update value
func _type_letter() -> void:
	typedLetters += 1
	_update_label()

# Button press callback function
func _on_button_pressed() -> void:
	_type_letter()
