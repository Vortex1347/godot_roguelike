# godot_roguelike

Godot-проект для `3D top-down magical extraction` игры с functional parity-ориентиром на `ZERO Sievert`, ранним visual foundation, proxy-asset контрактом и feature-first архитектурой.

## Текущее состояние

- Активный маршрут проекта переведен на `3D sanctum visual benchmark`.
- Стартовая сцена открывает tilted-ortho mage sanctum hub с live `inventory/vault` shell поверх `Node3D`-сцены.
- Старый `2D bunker` сохранен в репозитории как временный reference-only slice и больше не является основным startup flow.
- Добавлен proxy-asset contract в `assets/proxy/` для replace-later моделей и будущей замены финальными ассетами.
- Runtime/addon зависимости намеренно не подключены до отдельного согласования.
- Starter asset intake адаптирован под sanctum/dungeon/mage/focus/VFX bundle.

## Быстрый старт

1. Установить Godot 4 через Homebrew:
   ```bash
   brew install --cask godot
   ```
2. Проверить CLI:
   ```bash
   godot --version
   ```
3. Открыть проект:
   ```bash
   godot --path .
   ```
4. Для быстрой безоконной проверки использовать:
   ```bash
   godot --headless --path . --quit
   ```

## Структура

- `app/` - стартовая сцена и bootstrap UI.
- `autoload/` - минимальные cross-feature singletons.
- `assets/intake/` - сырой intake и нормализованные `GLB` до попадания в proxy layer.
- `assets/proxy/` - временные proxy-wrapper'ы и реестр replace-later ассетов.
- `content/definitions/` - `Resource`-модели для статических данных.
- `features/` - feature-first срезы по доменам.
- `runtime/models/` - модели session/save/run state.
- `docs/` - продуктовые, визуальные, архитектурные и процессные документы.
- `tests/` - acceptance checklists и будущие automated tests.

## Правила текущего этапа

- Не добавлять addon'ы и сторонние runtime-системы без отдельного выбора пользователя.
- Любой meaningful task закрывать только после проверки результата, обновления `docs/` и синхронизации Serena memory.
- Поддерживать сцены и код маленькими, typed и разнесенными по ответственности.
- Любой временный внешний ассет сначала попадет в proxy-зону и будет занесен в `assets/proxy/PROXY_asset_registry.csv`.
- Внешние архивы сначала складывать в `assets/intake/raw/`, затем нормализовать в `GLB` и только потом поднимать в `assets/proxy/`.
- Для активного magical vertical slice registry дополнительно хранит `magic_role`.
