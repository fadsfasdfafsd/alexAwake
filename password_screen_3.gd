extends Node2D

@onready var password_input = $CanvasLayer/VBoxContainer/PasswordInput
@onready var message_label = $CanvasLayer/VBoxContainer/MessageLabel

var correct_password = "VICTORY"

func _ready():
	password_input.grab_focus()

func _on_confirm_button_pressed():
	var input_password = password_input.text
	
	if input_password == correct_password:
		get_tree().change_scene_to_file("res://arix-awakened/scenes/ui/win_menu.tscn")
	else:
		message_label.text = "كلمة المرور خاطئة!"
		password_input.text = ""
		password_input.grab_focus()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://arix-awakened/scenes/ui/main_menu.tscn")

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ENTER:
		_on_confirm_button_pressed()
