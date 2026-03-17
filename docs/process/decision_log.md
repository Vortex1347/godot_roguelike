# Decision Log

Исторические записи ниже сохраняются как журнал смены курса. Актуальный baseline и обязательные решения нужно читать по самым свежим записям и по `docs/roadmap/`.

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

### 2026-03-17 - Inventory preview fix and asset intake

- Ошибка drag-preview в inventory фиксируется точечно через Godot 4 theme override API, а не обходным переписыванием inventory UI.
- Базовый ingest-формат для временных внешних ассетов зафиксирован как `GLB`.
- Введен обязательный intake flow: `assets/intake/raw -> assets/intake/normalized -> assets/proxy -> scene usage`.
- Если сайты паков не дают прямой архивный URL для автоматического скачивания, архивы допускается загружать вручную в `assets/intake/raw/` без нарушения asset contract.

### 2026-03-17 - Magical parity retheme for sanctum intake

- Тематический baseline проекта смещен из generic sci-fi bunker benchmark в `mage sanctum` и dark-fantasy extraction parity.
- В рамках этого прохода кодовые имена `Bunker*` и existing feature paths не переименовываются, чтобы не раздувать дифф без продуктовой ценности; смысловой перевод выполняется через docs, UI и proxy metadata.
- Starter asset bundle теперь собирается под `sanctum environment + mage character + humanoid animations + focus props + magical VFX`.
- Proxy registry и wrapper metadata расширены полем `magic_role`, чтобы 3D-моделлер и будущий агент различали sanctum props, focus meshes и spell VFX без догадок.
- Текущий live shell переводится на лексикон `vault / field satchel / spell broker / scrying board / rune forge`, не ломая inventory runtime contract.

### 2026-03-17 - Master roadmap adoption for magical parity

- Source-of-truth проекта больше не трактуется как `inspired-only`; начиная с этого pass он описывает `public-safe magical parity by function`.
- Official parity baseline для roadmap фиксируется по [Steam store page](https://store.steampowered.com/app/1782120/ZERO_Sievert/) и [official Steam news hub](https://store.steampowered.com/news/app/1782120) на `March 17, 2026`.
- Для roadmap работы выбраны defaults:
  - survival stack = almost full parity
  - dungeon layer = authored templates + procedural assembly
  - naming policy = neutral original names
  - naming depth = temporary canonical names
- Existing `Bunker*` code names и paths сохраняются как technical aliases до отдельного cleanup phase.
- `docs/roadmap/magical_extraction_master_roadmap.md` и `docs/roadmap/magic_parity_mapping.md` становятся canonical execution docs для следующих implementers.
- `Workshop/modding` выводится за пределы parity-complete gate и учитывается только как appendix / later layer.
