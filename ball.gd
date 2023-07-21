extends CharacterBody2D
var p1_score=0 # left counter # левый счетчик
var p2_score=0 # right counter # правый счетчик
const SPEED = 300.0 # speed # скорость
var velocity2=Vector2(200,300) # direction # направление


func _ready():
	velocity=velocity2

func _physics_process(delta):
	#move ball and check for collisions #движение мяча и обработка столкновений
	var collision=move_and_collide(velocity*delta)
	if collision:
		#change direction (reflection) #изменяем направление(отражаем напрвление)
		velocity=velocity.bounce(collision.get_normal())
		var collision_name=collision.get_collider().get_name()
		#check for goals #проверяем на голы
		if collision_name=='lg'||collision_name=='rg':
			var coords=get_viewport_rect().size / 2
			self.global_position=Vector2(coords[0],coords[1])
			if collision_name=="lg":
				p2_score += 1
				var lc=get_node("../Right2")
				lc.text=str(p2_score)
			elif collision_name=="rg":
				p1_score += 1
				var rc=get_node("../Left2")
				rc.text=str(p1_score)
			
			
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
