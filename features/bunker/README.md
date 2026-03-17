# Bunker Feature

Зона для hub-сцены. По продуктовой терминологии это уже `mage sanctum`, но кодовые имена `bunker/*` временно сохранены ради стабильного API и безболезненного cleanup-прохода позже.

## Текущий baseline

- Активный visual benchmark: `3D tilted-ortho sanctum hall`.
- `bunker_slice_3d.tscn` является основным startup маршрутом.
- Старый `2D bunker` остается только как временный reference slice до отдельной cleanup-фазы.
- Все временные props для sanctum/dungeon slice, которые должны заменяться моделлером, должны идти через `assets/proxy/`.
