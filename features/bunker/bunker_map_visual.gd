extends Node2D

const WORLD_RECT := Rect2(0.0, 0.0, 2304.0, 1344.0)
const ROOM_RECT := Rect2(96.0, 96.0, 2112.0, 1152.0)
const WALKWAY_RECT := Rect2(224.0, 576.0, 1856.0, 192.0)
const STASH_ZONE_RECT := Rect2(1664.0, 192.0, 352.0, 224.0)
const TRADER_ZONE_RECT := Rect2(1664.0, 736.0, 416.0, 192.0)
const TASK_ZONE_RECT := Rect2(224.0, 192.0, 256.0, 192.0)
const SERVICE_ZONE_RECT := Rect2(480.0, 928.0, 352.0, 192.0)


func _ready() -> void:
	queue_redraw()


func _draw() -> void:
	draw_rect(WORLD_RECT, Color(0.05, 0.06, 0.07, 1.0), true)
	draw_rect(ROOM_RECT, Color(0.10, 0.12, 0.13, 1.0), true)
	draw_rect(WALKWAY_RECT, Color(0.13, 0.17, 0.16, 1.0), true)
	draw_rect(STASH_ZONE_RECT, Color(0.16, 0.20, 0.18, 1.0), true)
	draw_rect(TRADER_ZONE_RECT, Color(0.15, 0.16, 0.18, 1.0), true)
	draw_rect(TASK_ZONE_RECT, Color(0.13, 0.16, 0.14, 1.0), true)
	draw_rect(SERVICE_ZONE_RECT, Color(0.11, 0.13, 0.15, 1.0), true)

	_draw_grid_lines()
	_draw_light_pool(Vector2(1840.0, 320.0), 192.0, Color(0.72, 0.86, 0.56, 0.08))
	_draw_light_pool(Vector2(1860.0, 824.0), 176.0, Color(0.86, 0.74, 0.44, 0.08))
	_draw_light_pool(Vector2(352.0, 288.0), 144.0, Color(0.66, 0.74, 0.60, 0.06))
	_draw_light_pool(Vector2(640.0, 1012.0), 160.0, Color(0.46, 0.64, 0.86, 0.05))

	_draw_prop(Rect2(1712.0, 224.0, 272.0, 128.0), Color(0.23, 0.32, 0.27, 1.0), Color(0.63, 0.84, 0.68, 1.0))
	_draw_prop(Rect2(1712.0, 784.0, 320.0, 96.0), Color(0.31, 0.23, 0.18, 1.0), Color(0.90, 0.72, 0.43, 1.0))
	_draw_prop(Rect2(256.0, 224.0, 192.0, 96.0), Color(0.18, 0.24, 0.21, 1.0), Color(0.79, 0.84, 0.63, 1.0))
	_draw_prop(Rect2(512.0, 960.0, 288.0, 128.0), Color(0.19, 0.22, 0.27, 1.0), Color(0.59, 0.73, 0.92, 1.0))
	_draw_prop(Rect2(928.0, 608.0, 288.0, 96.0), Color(0.22, 0.22, 0.24, 1.0), Color(0.74, 0.76, 0.79, 1.0))


func _draw_grid_lines() -> void:
	for x in range(int(ROOM_RECT.position.x), int(ROOM_RECT.end.x), 64):
		draw_line(Vector2(x, ROOM_RECT.position.y), Vector2(x, ROOM_RECT.end.y), Color(0.41, 0.47, 0.42, 0.08), 1.0)

	for y in range(int(ROOM_RECT.position.y), int(ROOM_RECT.end.y), 64):
		draw_line(Vector2(ROOM_RECT.position.x, y), Vector2(ROOM_RECT.end.x, y), Color(0.41, 0.47, 0.42, 0.08), 1.0)


func _draw_light_pool(center: Vector2, radius: float, color: Color) -> void:
	draw_circle(center, radius, color)


func _draw_prop(rect: Rect2, fill: Color, accent: Color) -> void:
	draw_rect(rect, fill, true)
	draw_rect(rect, accent, false, 3.0)
	draw_rect(rect.grow(-12.0), accent.darkened(0.25), false, 1.0)

