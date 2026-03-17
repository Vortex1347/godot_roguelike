# Asset Intake

Эта зона нужна для входящего потока временных внешних ассетов до того, как они попадут в `assets/proxy/` и active scene flow магического parity-проекта.

## Intake Flow

`raw drop -> normalize to GLB -> proxy wrapper -> registry entry -> scene usage`

## Структура

- `assets/intake/raw/` - исходные архивы и распакованные материалы как их скачали.
- `assets/intake/normalized/` - очищенные и нормализованные `GLB`-файлы для Godot.
- `assets/proxy/` - wrapper-сцены и registry; только отсюда разрешено ссылаться из игровых сцен.

## Правила

- Не подключать сырье из `raw/` прямо в `features/` или `app/`.
- Если ассет пришел в `FBX` или `Blend`, сначала нормализовать в `GLB`.
- При замене временного ассета финальной моделью сохранять `asset_id` и wrapper-path, а не ломать сценовые ссылки.
- Каждый реально используемый внешний ассет обязан иметь запись в `assets/proxy/PROXY_asset_registry.csv`.
- Для каждого временного magical ассета дополнительно фиксировать `magic_role`.

## Команды

- Проверить Blender:
  - `blender --version`
- Базовый ручной экспорт в `GLB`:
  - открыть исходник в Blender
  - почистить scale/origin/material slots
  - экспортировать в `assets/intake/normalized/.../*.glb`
- После нормализации:
  - создать или обновить `PROXY_*.tscn`
  - занести запись в registry
  - только потом подключать ассет в sanctum/player/spell scene

## Ближайший import-pass

- `environment_sanctum` - structural kit для sanctum hall, archive shelves, ritual stations и dungeon room dressing
- `character_mage` - базовый mage/humanoid carrier
- `animations_humanoid` - idle, move, cast, hit, death
- `focus_props` - tome, wand, staff, relic
- `magic_vfx` - projectile, cast-start и impact placeholders
