extends Node






var timer: Timer


signal hour_changed(hour)
signal season_changed(season)
signal day_changed(day)


enum days {monday, tuesday, wednesday, thursday, friday, saturday, sunday}
enum seasons{winter, spring,summer, autumn }
@export_group("Time settings")
@export var hour: int = 0
@export var hour_duration : float  = 1.0
@export var day = days.monday
@export_range(1,365,1) var days_in_a_season: int = 1
@export var season = seasons.winter
var days_passed = 0




func _ready() -> void:
	timer = Timer.new()
	timer.autostart = true
	add_child(timer)
	timer.wait_time = hour_duration
	timer.timeout.connect(on_timer_timeout)
	if timer.autostart == true:
		timer.start()
	
	
	
	

	
	
func on_timer_timeout():
	if hour == 23:
			days_passed += 1
			hour = 0
			day = (day + 1 ) % days.size()
			day_changed.emit(day)
			
	else:
		hour += 1
		
	hour_changed.emit(hour)
		
		
		
			
	
	if days_passed >= days_in_a_season:
		season = (season + 1) % seasons.size()
		season_changed.emit(season)
		days_passed= 0 
		
	
		
	
func set_hour(hour_set: int):
	if hour_set <=23 and hour_set >=0:
		hour = hour_set
	else: 
		push_error("Invalid hour must be inbetween 0 and 23")
	
	
	
func change_day(day_changed_to: int) -> void:
	if day_changed_to < 0 or day_changed_to >= days.size():
		push_error("Invalid day value: %s" % day_changed_to)
		return

	day = day_changed_to
	day_changed.emit(day)
			
			
func change_season(season_changed_to: int) -> void:
	if season_changed_to < 0 or season_changed_to >= seasons.size():
		push_error("Invalid season value: %s" % season_changed_to)
		return

	season = season_changed_to
	season_changed.emit(season)
	
	
func set_hour_duration(duration: float) -> void:
	if duration <= 0.0:
		push_error("Hour duration must be greater than zero.")
		return

	hour_duration = duration
	timer.wait_time = duration
	



func start_timer(should_run: bool) -> void:
	if should_run:
		timer.start()
	else:
		timer.stop()
		
func set_season_days(num):
	days_in_a_season = num
	
func set_autostart(condition):
	if condition == true:
		timer.autostart = true
	elif condition == false:
		timer.autostart = false
		
	else:
		push_error("invalid value, must be boolean", condition)
		
		
	
