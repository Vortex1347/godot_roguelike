# Bunker Inventory Slice Checklist

## Scene

- Проект стартует сразу в walkable bunker slice, а не в bootstrap-only экран
- Игрок двигается по bunker на `WASD`
- Камера следует за игроком и не выходит за пределы bunker world bounds
- Видны stash, trader, task board и service areas как разные зоны комнаты

## Interaction

- У stash hotspot появляется prompt `E / Open stash / inventory`
- Нажатие `E` у stash hotspot открывает inventory shell
- Нажатие `I` в bunker тоже открывает и закрывает тот же shell
- Trader/task hotspots не ломают flow и отдают status message о будущем шаге

## Inventory / Stash

- В shell одновременно видны stash и player inventory
- Drag-and-drop между контейнерами работает
- Валидный drop переносит предмет
- Невалидный drop отклоняется с понятным status message
- Состояние контейнеров сохраняется после закрытия и повторного открытия shell в рамках сессии

## Verification

- `godot --headless --path /Users/ataiyrysbekov/Documents/GitHub/godot_roguelike --quit`
- `godot --headless --path /Users/ataiyrysbekov/Documents/GitHub/godot_roguelike --script res://tools/inventory_transfer_smoke.gd`
- `godot --path /Users/ataiyrysbekov/Documents/GitHub/godot_roguelike --quit-after 1`
