# godot_roguelike

Godot-проект для `3D top-down extraction` игры, вдохновленной `ZERO Sievert`, с ранним visual foundation, proxy-asset контрактом и feature-first архитектурой.

## Текущее состояние

- Активный маршрут проекта переведен на `3D bunker visual benchmark`.
- Стартовая сцена открывает tilted-ortho bunker hub с live `inventory/stash` shell поверх `Node3D`-сцены.
- Старый `2D bunker` сохранен в репозитории как временный reference-only slice и больше не является основным startup flow.
- Добавлен proxy-asset contract в `assets/proxy/` для replace-later моделей и будущей замены финальными ассетами.
- Runtime/addon зависимости намеренно не подключены до отдельного согласования.

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
