# Project Architecture

## Принципы

- Архитектура должна оставаться feature-first.
- Domain rules не смешивать с UI orchestration.
- Данные описывать через `Resource`, runtime-состояние через отдельные модели, сценарную логику через scene/controller слои.

## Структура

- `app/` - запуск приложения и bootstrap UI.
- `autoload/` - только cross-feature сервисы:
  - `AppRouter`
  - `SaveService`
  - `RunSession`
  - `Settings`
  - `ContentRegistry`
- `content/definitions/` - static definitions и data contracts.
- `runtime/models/` - save/session/run state.
- `features/raid`, `features/bunker`, `features/inventory`, `features/combat`, `features/traders`, `features/progression` - вертикальные feature-срезы.
- `ui/` - reusable presentation-only компоненты.
- `tools/` - editor tooling и поддерживающие утилиты.

## Class patterns

- `*Def` классы: только форма данных и валидационные инварианты.
- `*Service` классы: правила, формулы, orchestration одного use-case.
- Scene/controller scripts: минимум логики, только сборка зависимостей и реакция на сигнал/ввод.
- View-model/adapters использовать там, где UI начинает вытягивать domain state из нескольких мест.

## Ограничения

- Не превращать autoload в глобальный мусорный контейнер.
- Не хранить квесты, инвентарь, рейд-state и UI-state в одном скрипте.
- Если скрипт приближается к `300` строкам или несет больше одной ответственности, его нужно декомпозировать.
- Addon'ы не подключать без явного решения пользователя и записи в `docs/process/decision_log.md`.

## Тестирование

- Предпочтительный automated test stack: `GdUnit4`, но подключать только после явного выбора пользователя.
- До подключения test addon'а использовать:
  - manual acceptance checklists
  - headless project boot sanity check
  - точечные domain tests после согласования test stack

