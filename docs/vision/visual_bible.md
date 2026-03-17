# Visual Bible

## Active Visual Direction

- Активный стиль: `gritty low-poly`.
- Игра больше не строится как pixel-art clone. Текущий приоритет это крупные читаемые формы, материалы без шумовой перегрузки и управляемый replace-later pipeline.
- Основной target: desktop `1920x1080`, `16:9`.

## Камера и читаемость

- Базовая камера: `Camera3D` в `orthographic` режиме с заметным `tilt`, но без сильной перспективной деформации.
- Камера должна держать игрока и ближайшие utility-зоны в одном тактически читаемом кадре.
- Экранный шум недопустим: силуэты станций, интерактива, контейнеров и игрока должны различаться еще на proxy-этапе.
- Любой новый визуальный элемент сначала проверяется на silhouette readability, затем на детализацию и только потом на декоративность.

## Form Language

- Формы крупные, угловатые и utilitarian.
- В одном кадре должно быть легко отличить:
  - operable station
  - cover / obstacle
  - decorative clutter
  - player silhouette
- Low-poly не означает пустоту: плотность задается группировкой props, светом и material contrast, а не шумными деталями текстур.

## Цвет и атмосфера

- Базовая среда: холодные асфальтово-зеленые, стальные и грязно-оливковые диапазоны.
- Акценты:
  - холодный зеленый для stash/service зон
  - теплый песочно-желтый для trader/task/economy сигналов
  - приглушенный красный для урона и emergency feedback
- Сильные кислотные цвета вне сигналов опасности не использовать.

## Свет, туман, погода

- Ранний visual contract обязан учитывать:
  - слабый направленный indoor fog / atmospheric haze
  - локальные pools of light по станциям
  - читаемые переходы между навигацией, utility zones и shadow pockets
- Освещение не должно разрушать читаемость HUD, интерактива и силуэтов сверху.

## UI Shell

- Плотность интерфейса должна оставаться утилитарной и dense: минимум декора, высокая информационная насыщенность, прямоугольные панели поверх 3D-сцены.
- Каркас UI:
  - bunker overlay
  - inventory/stash grid
  - trader screen
  - quest/task panel
  - будущий raid HUD
- UI-панели строить на прямоугольных блоках с простой рамкой и кратными `8px` отступами.

## 3D Bunker Contract

- Первый `3D` bunker benchmark строится как indoor hall, а не как набор разрозненных комнат.
- Пространственный контракт текущего прохода:
  - центральный проход остается свободным и читаемым
  - stash station находится в upper-right зоне
  - trader counter сидит в lower-right зоне
  - task board сидит в upper-left зоне
  - service / utility corner сидит в lower-left зоне
- Bunker должен читаться как единое операционное помещение с perimeter stations, а не как лабиринт.

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
- Proxy asset не должен подменять domain contract: gameplay и hotspot routing завязаны на bunker scene layout, а не на внутренности временной модели.

## Inventory Shell Contract

- Текущий layout:
  - stash grid: `12x6`
  - player inventory grid: `8x6`
  - slot size: `48px`
- Оба контейнера видны одновременно.
- В `3D bunker` key `I` открывает тот же shell, что и stash hotspot, потому что для этого milestone важнее working transfer loop, чем строгая diegetic изоляция UI.
- Рабочий interaction model: left-button drag-and-drop с reject при выходе за границы или конфликте занятости.

## Current Benchmark Standard

- Bunker hall, props и player silhouette уже должны быть читаемы как final-scale benchmark, а не как абстрактные коробки.
- Для каждого нового placeholder/proxy обязательны:
  - итоговый footprint
  - различимый силуэт сверху
  - цветовая роль
  - понятное место в bunker loop
