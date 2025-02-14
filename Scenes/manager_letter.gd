class_name ManagerLetters
extends Node

static var lettersRef: ManagerLetters

func _init() -> void:
	if not lettersRef: lettersRef = self
	else: queue_free()


signal letters_updated
signal letters_created(quantity: int)
signal letters_spend(quantity: int)

var _letters: int = 0


func get_letters() -> int:
	return _letters


func create_letters(quantity: int) -> void:
	if quantity <= 0 : return
	
	_letters += quantity
	
	letters_created.emit(quantity)
	letters_updated.emit()


func can_spend(quantity: int) -> bool:
	if quantity < 0 : return false
	
	if quantity > _letters : return false
	
	return true


func spend_letters(quantity: int) -> Error:
	if quantity < 0 : return Error.FAILED
	
	if quantity > _letters : return Error.FAILED
	
	_letters -= quantity
	letters_spend.emit(quantity)
	letters_updated.emit()
	
	return Error.OK
