# Visual Bible

## Active Visual Direction

- Активный стиль: `grim arcane low-poly`.
- Игра больше не строится как pixel-art clone. Текущий приоритет это крупные читаемые формы, материалы без шумовой перегрузки и управляемый replace-later pipeline.
- Основной target: desktop `1920x1080`, `16:9`.
- Визуальная тема проекта: `mage sanctum + mutant wilderness + cursed dungeons`.
- Public-safe names обязательны даже на уровне UI-моков и roadmap-доков.

## Камера и читаемость

- Базовая камера: `Camera3D` в `orthographic` режиме с заметным `tilt`, но без сильной перспективной деформации.
- Камера должна держать игрока и ближайшие utility-зоны в одном тактически читаемом кадре.
- Экранный шум недопустим: силуэты станций, интерактива, контейнеров и игрока должны различаться еще на proxy-этапе.
- Любой новый визуальный элемент сначала проверяется на silhouette readability, затем на детализацию и только потом на декоративность.

## Form Language

- Формы крупные, угловатые и ritual-utilitarian.
- В одном кадре должно быть легко отличить:
  - operable station
  - cover / obstacle
  - decorative clutter
  - player silhouette
  - hostile silhouette
  - hazard / anomaly silhouette
- Low-poly не означает пустоту: плотность задается группировкой props, светом и material contrast, а не шумными деталями текстур.

## World Layers

- `Ash Sanctum`:
  - безопасное, утилитарное, плотное, но не хаотичное пространство
  - station lighting и perimeter layout важнее декоративного clutter
  - визуальный язык: stone, wood, bronze, ritual glass, parchment, metal bindings
- Surface wilderness:
  - ruined paths, sick vegetation, corrupted clearings, abandoned camps, occult debris
  - дистанционная читаемость маршрутов, cover и extraction зон обязательна
  - мутировавшие существа и world hazards должны читаться сверху до атаки
- Cursed dungeons:
  - более высокий contrast, локальные pools of light, trap telegraphing и читаемые gate/lock language
  - boss prelude должен ощущаться плотнее, давяще и опаснее, чем surface layer
  - dungeon rooms не должны превращаться в visually noisy лабиринт

## Character And Enemy Silhouettes

- Player silhouette:
  - mage body
  - satchel mass
  - clearly readable focus / tome / wand / staff direction
- Hostile silhouettes:
  - `Cursed Beasts` читаются по низкому профилю и резкому броску
  - `Blighted Humanoids` читаются по upright stance и weapon-or-cast pose
  - `Arcane Aberrants` читаются по асимметрии, glow masses и hazard aura
  - `Dungeon Guardians` читаются как элитные, тяжелые, gate-anchored silhouettes
- Boss silhouette обязан отличаться уже по массе, ритму движения и VFX envelope, а не только по полоске HP.

## Цвет и атмосфера

- Базовая среда: темный камень, старое дерево, окисленная бронза, сдержанный verdigris, bone-ivory и ember-gold.
- Акценты:
  - холодный verdigris для vault/archive зон
  - теплый amber-gold для spell broker / scrying сигналов
  - тусклый moon-cyan для arcane utility и cast/VFX сигналов
  - sick green и violet-gray для corruption / blight зон
  - приглушенный красный для урона и emergency feedback
- Сильные кислотные цвета и фэнтезийная candy-палитра недопустимы.

## Свет, туман, погода

- Ранний visual contract обязан учитывать:
  - слабый направленный indoor fog / atmospheric haze
  - локальные pools of light по станциям
  - читаемые переходы между навигацией, utility zones и shadow pockets
  - погодные состояния на surface maps
  - контрастный, но не слепящий trap / hazard telegraphing в dungeon layer
- Освещение не должно разрушать читаемость HUD, интерактива и силуэтов сверху.

## UI Shell

- Плотность интерфейса должна оставаться утилитарной и dense: минимум декора, высокая информационная насыщенность, прямоугольные панели поверх 3D-сцены.
- Каркас UI:
  - sanctum overlay
  - inventory/vault grid
  - spell broker screen
  - scrying/task panel
  - будущий raid HUD
  - map / field chart
  - status cluster
- UI-панели строить на прямоугольных блоках с простой рамкой и кратными `8px` отступами.
- Spell/VFX language не должна спорить с HUD: combat readability всегда важнее декоративной магии.

## 3D Sanctum Contract

- Первый `3D` sanctum benchmark строится как indoor hall, а не как набор разрозненных комнат.
- Пространственный контракт текущего прохода:
  - центральный проход остается свободным и читаемым
  - vault / archive station находится в upper-right зоне
  - spell broker desk сидит в lower-right зоне
  - scrying board сидит в upper-left зоне
  - rune forge / alchemy corner сидит в lower-left зоне
- Sanctum должен читаться как единое операционное помещение с perimeter stations, а не как лабиринт.

## Surface Contract

- Surface maps должны ощущаться как extraction spaces, а не как арены.
- В каждом кадре surface layer обязана быть видна логика:
  - traversal path
  - cover
  - lootable POI
  - extraction direction
  - hazard or anomaly risk
- Dungeon entrances должны читаться как high-risk invitation, а не как случайная декорация.

## Dungeon Contract

- Dungeon-before-boss loop обязателен как structural parity rule.
- Dungeon layout строится на authored room templates + procedural assembly, а не на чистом случайном лабиринте.
- В dungeon слое отдельно читаются:
  - locks / ritual gates
  - elite encounters
  - trap telegraphs
  - reward rooms
  - boss threshold
- Перед входом в boss arena должен ощущаться pacing shift: меньше шума, больше напряжения, выше контраст visual cues.

## Proxy Asset Standard

- Любой replace-later prop идет через `assets/proxy/`.
- Wrapper-сцены обязаны иметь префикс `PROXY_` или `TMP_`.
- Для каждого proxy-ассета обязательны:
  - `asset_id`
  - `source`
  - `license_note`
  - `used_in`
  - `replace_status`
  - `replacement_owner`
  - `magic_role`
- Proxy asset не должен подменять domain contract: gameplay и hotspot routing завязаны на sanctum scene layout, а не на внутренности временной модели.

## Inventory Shell Contract

- Текущий layout:
  - vault grid: `12x6`
  - player inventory grid: `8x6`
  - slot size: `48px`
- Оба контейнера видны одновременно.
- В `3D sanctum` key `I` открывает тот же shell, что и vault hotspot, потому что для этого milestone важнее working transfer loop, чем строгая diegetic изоляция UI.
- Рабочий interaction model: left-button drag-and-drop с reject при выходе за границы или конфликте занятости.

## Verification Rule

- Любой заметный visual step проверяется сразу после внедрения, а не в конце milestone.
- Обязательные проверки:
  - screenshot-based review
  - colors / composition / scale / silhouette pass
  - direct behavior check, если элемент интерактивный
- Визуально слабый или нечитаемый step не считается завершенным даже если технически он работает.

## Current Benchmark Standard

- Sanctum hall, props и mage silhouette уже должны быть читаемы как final-scale benchmark, а не как абстрактные коробки.
- Для каждого нового placeholder/proxy обязательны:
  - итоговый footprint
  - различимый силуэт сверху
  - цветовая роль
  - понятное место в sanctum loop
