# godot_roguelike

Bootstrap-репозиторий для точной по ощущениям Godot-копии `ZERO Sievert` с ранним visual foundation и feature-first архитектурой.

## Текущее состояние

- Реализован только bootstrap-слой без gameplay.
- Созданы базовые автозагрузки, стартовая сцена, архитектурные документы и guardrails для агента.
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
- `content/definitions/` - `Resource`-модели для статических данных.
- `features/` - feature-first срезы по доменам.
- `runtime/models/` - модели session/save/run state.
- `docs/` - продуктовые, визуальные, архитектурные и процессные документы.
- `tests/` - acceptance checklists и будущие automated tests.

## Правила bootstrap-этапа

- Не добавлять addon'ы и сторонние runtime-системы без отдельного выбора пользователя.
- Любой meaningful task закрывать только после проверки результата, обновления `docs/` и синхронизации Serena memory.
- Поддерживать сцены и код маленькими, typed и разнесенными по ответственности.

