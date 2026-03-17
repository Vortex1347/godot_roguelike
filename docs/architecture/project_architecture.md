# Project Architecture

## Принципы

- Архитектура должна оставаться feature-first.
- Domain rules не смешивать с UI orchestration.
- Данные описывать через `Resource`, runtime-состояние через отдельные модели, сценарную логику через scene/controller слои.
- Presentation stack может меняться между `2D` и `3D`, но inventory/services/runtime boundary должен оставаться стабильным.

## Структура

- `app/` - запуск приложения и bootstrap UI.
- `autoload/` - только cross-feature сервисы:
  - `AppRouter`
  - `SaveService`
  - `RunSession`
  - `Settings`
  - `ContentRegistry`
- `assets/intake/` - сырой intake и нормализованные `GLB` до подключения в active scenes.
- `assets/proxy/` - wrapper-сцены и реестр replace-later ассетов.
- `content/definitions/` - static definitions и data contracts.
- `runtime/models/` - save/session/run state.
- `runtime/models/` также содержит session-local инвентарные модели текущего slice:
  - `BunkerSessionState`
  - `ContainerGridState`
  - `ContainerItemState`
  - `ItemStackState`
  - `InventoryDragPayload`
  - `InventoryTransferResult`
- `runtime/models/BunkerSessionState` теперь хранит обе формы bunker position state:
  - `player_position` для legacy `2D` reference slice
  - `player_position_3d` для активного `3D` sanctum benchmark
- `features/raid`, `features/bunker`, `features/inventory`, `features/combat`, `features/traders`, `features/progression` - вертикальные feature-срезы.
- `ui/` - reusable presentation-only компоненты.
- `tools/` - editor tooling и поддерживающие утилиты.
- `docs/roadmap/` - канонические parity-docs для будущей реализации систем, naming glossary и phased checklist.

## Class patterns

- `*Def` классы: только форма данных и валидационные инварианты.
- `*Service` классы: правила, формулы, orchestration одного use-case.
- Для текущего slice отдельными сервисами уже вынесены:
  - `InventoryBootstrapFactory` для session-local seed state
  - `InventoryTransferService` для occupancy rules и move validation
- Scene/controller scripts: минимум логики, только сборка зависимостей и реакция на сигнал/ввод.
- `BunkerSlice3D` отвечает только за 3D scene flow, prompts, hotspot routing и наложение inventory shell.
- `BunkerPlayer3D` отвечает только за movement/facing/camera carrier слой.
- View-model/adapters использовать там, где UI начинает вытягивать domain state из нескольких мест.
- Proxy asset wrappers не должны содержать gameplay logic; только metadata + visual/collision blockout.
- Asset intake держать трехступенчатым: `raw -> normalized GLB -> proxy wrapper`.
- Магический proxy contract добавляет поле `magic_role` для sanctum, dungeon, focus и VFX ассетов.
- Кодовые имена `Bunker*` временно сохраняются как stable API до отдельного cleanup-rename pass; продуктовая терминология при этом уже `sanctum`.
- Future defs / models / services фиксируются сначала в `docs/roadmap/`, а уже потом попадают в runtime code.

## Ограничения

- Не превращать autoload в глобальный мусорный контейнер.
- Не хранить квесты, инвентарь, рейд-state и UI-state в одном скрипте.
- Если скрипт приближается к `300` строкам или несет больше одной ответственности, его нужно декомпозировать.
- Addon'ы не подключать без явного решения пользователя и записи в `docs/process/decision_log.md`.
- Bunker hotspot routing держать через named actions, а не через ad-hoc строки по UI узлам.
- UI shell не должен напрямую решать формулы занятости слотов; это остается обязанностью inventory service.
- Активный startup flow теперь использует `3D sanctum` scene через существующий `BunkerSlice3D` API; legacy `2D bunker` остается в репозитории как short-term reference-only код до cleanup-задачи.
- Внешние replace-later ассеты не подключать напрямую в feature-сцены; использовать proxy wrapper слой и registry.
- Базовый import target для временных внешних ассетов: `GLB`.
- Active magical scenes должны ссылаться только на wrapper layer; прямые ссылки на raw/normalized ассеты запрещены.

## Тестирование

- Предпочтительный automated test stack: `GdUnit4`, но подключать только после явного выбора пользователя.
- До подключения test addon'а использовать:
  - manual acceptance checklists
  - headless project boot sanity check
  - точечные domain smoke scripts после согласования или когда логика достаточно компактна
