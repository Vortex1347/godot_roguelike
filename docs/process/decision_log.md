# Decision Log

## 2026-03-17

### Baseline

- Референсный продукт: live-версия `ZERO Sievert` по публичным материалам Steam на `17 марта 2026 года`.
- Цель: почти `1:1` по ощущениям, pacing, visual density и логике систем, без прямого копирования ассетов.

### Tech stack

- Движок: `Godot 4`
- Язык: `GDScript`
- Базовый target: desktop `1920x1080`, `16:9`, keyboard/mouse first

### Process

- Первый execution-pass ограничен bootstrap-слоем без gameplay.
- После каждого meaningful task обновлять документы и Serena memory.
- Новые addon'ы и внешние зависимости не добавлять молча, несмотря на общую открытость к готовым решениям.
- Guardrail-skills вынесены в локальные Codex skills и продублированы в `AGENTS.md`.

### Architecture

- Feature-first layout обязателен.
- `Resource`-модели, `Service`-классы и минимальный autoload footprint выбраны как базовый архитектурный шаблон.

### 2026-03-17 - Bunker slice decisions

- Main scene больше не показывает только bootstrap panel; проект стартует сразу в walkable bunker slice.
- Для текущего milestone bunker intentionally делает приоритет на environment composition + stash loop, а не на полную hub meta.
- `I` и stash hotspot открывают один и тот же inventory/stash shell, потому что для этого этапа важнее live transfer loop, чем строгая diegetic разница между “inventory” и “stash access”.
- Первый UI storage contract зафиксирован как `stash 12x6` и `player inventory 8x6`.
- Trader и task board оставлены как hotspot-reserved props без полной логики, чтобы композиция bunker уже была ближе к целевому hub.
- Для проверки transfer rules добавлен маленький headless smoke script вместо подключения test addon'а.

### 2026-03-17 - 3D pivot decisions

- Проект больше не целится в `1:1` визуальную копию `ZERO Sievert`; новый курс это `3D top-down extraction`, `inspired-only`.
- Pivot выполняется сразу: активный startup flow переводится на `3D bunker`, а `2D bunker` остается в репозитории как temporary reference-only slice до cleanup-фазы.
- Базовая камера фиксируется как `tilted orthographic`, а не perspective.
- Художественный baseline фиксируется как `gritty low-poly`.
- Первый `3D` benchmark ограничен `bunker hub`; outdoor, бой, AI и экономика в этот шаг не переносятся.
- Интернет-ассеты разрешены только как replace-later proxy слой с обязательной маркировкой, registry и возможностью точечной замены моделлером.
- Для первого `3D` benchmark использованы internal proxy wrappers вместо загрузки внешних паков, чтобы зафиксировать pipeline без новой лицензионной неопределенности.

### 2026-03-17 - Step verification workflow

- Каждый заметный implementation step должен проверяться до следующего шага, а не только в конце большого milestone.
- Визуальные шаги обязаны проходить через открытие проекта и короткую оценку кадра: цвета, композиция, читаемость, масштаб, силуэты.
- Интерактивные и геометрические шаги обязаны проходить через короткую behavioral-проверку: ввод, коллизии, hotspot responses, transitions.
- Если шаг работает технически, но визуально или по поведению выглядит плохо, он не считается завершенным.
- При наличии доступа к screenshot workflow свежий app-window screenshot становится стандартной частью визуальной проверки.
