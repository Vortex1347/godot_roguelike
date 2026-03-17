# Task Log

Записи ниже отражают историю шагов проекта. Актуальный execution baseline определяется последними milestone-записями и документами в `docs/roadmap/`.

## 2026-03-17 - Bootstrap pass

- Установлен `Godot 4.6.1` через Homebrew и подтвержден CLI.
- Установочный шаг под Godot подготовлен в `README.md`.
- Создан минимальный `Godot 4` project scaffold без gameplay-слоя.
- Добавлены autoload skeleton'ы, data definitions и базовая стартовая сцена.
- Созданы `AGENTS.md`, vision/reference/architecture документы и bootstrap acceptance checklist.
- Добавлен каркас `docs/reference/reference_board.md` для следующего visual pass.
- Созданы и провалидированы локальные Codex skills: `godot-ask-first`, `godot-architecture-guardrails`, `context-sync`.
- Headless и обычный запуск проекта прошли bootstrap-проверку.

## 2026-03-17 - Bunker + Inventory slice

- `app` переведен с bootstrap-only экрана на walkable bunker slice как основной стартовый flow.
- Добавлен indoor bunker blockout с player placeholder, камерой, perimeter stations, hotspots и prompt/status overlay.
- Добавлен working `inventory/stash` shell с session-local состоянием и real drag-and-drop transfer rules.
- Добавлены runtime models для item/container/drag/transfer/bunker session state.
- Добавлен `tools/inventory_transfer_smoke.gd` для сервисной проверки переносов.
- Обновлены `reference_board`, `visual_bible` и `project_architecture` под текущий bunker milestone.
- Проверки: `godot --headless --path ... --quit`, `godot --headless --path ... --script res://tools/inventory_transfer_smoke.gd`, `godot --path ... --quit-after 1`.

## 2026-03-17 - Full pivot to 3D bunker benchmark

- Активный startup flow переведен с `2D bunker` на `3D tilted-ortho bunker benchmark`.
- Добавлены `BunkerSlice3D`, `BunkerPlayer3D`, `BunkerHotspot3D` и новый `Node3D` bunker hall с low-poly blockout, station lights и fog.
- Working `inventory/stash` shell сохранен поверх `3D`-сцены без переписывания runtime inventory моделей и transfer service.
- Добавлен proxy-asset contract: `assets/proxy/`, wrapper-сцены `PROXY_*` и `PROXY_asset_registry.csv`.
- Обновлены `README`, `product_north_star`, `visual_bible`, `reference_board`, `zero_sievert_feature_matrix`, `project_architecture`, `decision_log`.
- Добавлен `tests/checklists/bunker_3d_benchmark.md` для визуального и interaction acceptance-прохода.
- Проверки: `godot --headless --path ... --quit`, `godot --headless --path ... --script res://tools/inventory_transfer_smoke.gd`, `godot --path ... --quit-after 1`, app-window screenshot через helper из `$screenshot`.

## 2026-03-17 - Workflow verification rule

- В `AGENTS.md` добавлено обязательное правило: каждый заметный implementation step теперь закрывается коротким запуском и точечной визуально-поведенческой проверкой до перехода к следующему шагу.
- В `decision_log` зафиксировано, что визуальные изменения должны проверяться по кадру, цветам, композиции и читаемости, а интерактивные изменения по вводу, коллизиям и реакциям.

## 2026-03-17 - Inventory preview fix + asset intake setup

- Исправлен runtime bug в inventory drag-preview через корректный Godot 4 theme override API.
- Добавлен `tools/inventory_preview_smoke.gd` для целевой проверки preview path без ручного кликанья по UI.
- Создана intake-структура: `assets/intake/raw/`, `assets/intake/normalized/`, `assets/intake/STARTER_bundle_sources.md`.
- Обновлены `README`, `assets/proxy/README.md`, `project_architecture`, `decision_log` под новый intake flow `raw -> normalized GLB -> proxy`.
- Проверки: `godot --headless --path ... --script res://tools/inventory_preview_smoke.gd`, `godot --headless --path ... --script res://tools/inventory_transfer_smoke.gd`, `godot --headless --path ... --quit`, обычный короткий запуск проекта.

## 2026-03-17 - Magical sanctum retheme for asset intake

- Intake docs и starter source bundle переведены с bunker/sci-fi на `sanctum / mage / humanoid animations / focus props / magic_vfx`.
- Созданы локальные drop-зоны `environment_sanctum`, `character_mage`, `animations_humanoid`, `focus_props`, `magic_vfx`.
- Proxy contract расширен полем `magic_role`; registry и wrapper metadata обновлены под sanctum-терминологию.
- Source-of-truth docs переведены на `mage sanctum` baseline без API rename-прохода.
- Следующий шаг после этого прохода: заменить internal blockout текущего sanctum slice на реальные free starter assets из intake.

## 2026-03-17 - Master roadmap docs pass for magical parity

- Обновлены `product_north_star`, `visual_bible`, `zero_sievert_feature_matrix`, `decision_log` и `task_log` под baseline `public-safe magical parity by function`.
- Добавлены canonical roadmap docs:
  - `docs/roadmap/magic_parity_mapping.md`
  - `docs/roadmap/magical_extraction_master_roadmap.md`
- В `zero_sievert_feature_matrix` добавлены `Magical Counterpart`, `Roadmap Phase`, `Source Status`.
- Зафиксированы roadmap defaults:
  - almost full survival stack
  - authored templates + procedural dungeon assembly
  - neutral original names
  - temporary canonical names
- Зафиксировано правило: existing `Bunker*` code names остаются technical aliases до отдельного cleanup/rename pass.
- `Workshop/modding` вынесен в out-of-scope appendix и не считается gate для parity-complete roadmap.
