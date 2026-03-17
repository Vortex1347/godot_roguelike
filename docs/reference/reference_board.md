# Reference Board

## Цель

Собрать и поддерживать один компактный reference board для visual contract и UX-плотности проекта.

## Источники baseline

- Steam page: [ZERO Sievert](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
- Godot docs/download baseline:
  - [Godot macOS download](https://godotengine.org/download/macos/)
  - [Homebrew godot cask](https://formulae.brew.sh/cask/godot)

## Current Pass: 3D Sanctum Benchmark

### Direction reset

- `ZERO Sievert` больше не является `1:1` visual target. После pivot он используется как anchor по extraction mood, utility density и hub readability.
- Активный контракт теперь: `3D`, `tilted orthographic`, `grim arcane low-poly`, `magical parity`.

### Sanctum composition

- Official Steam overview: [ZERO Sievert on Steam](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
  Transfer: bunker читается как safe operations hub с utility stations по периметру и clear path через центр. В нашем текущем `3D` benchmark это переводится в perimeter stations + центральный коридор sanctum hall.
- Official Steam poster: [tutorial / bunker-related poster](https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1782120/extras/f754439d67ad8e548ef0c8de98761f83.poster.avif?t=1772458263)
  Transfer: плотная, но не хаотичная компоновка зон; у нас это переводится в vault upper-right, spell broker lower-right, scrying board upper-left, rune forge lower-left.
- Public gameplay guide: [This Is The ZERO Sievert Bunker! - The Guide | ZERO Sievert](https://www.youtube.com/watch?v=vVI-Vbpcm4k)
  Transfer: подтверждает utility-heavy hub и иерархию станций; в `3D` их нужно сохранять через форму, свет и проходы, а не через pixel-art detail.

### Player silhouette

- Official Steam poster: [store media poster 01](https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1782120/extras/2b3e4d3636d14c30c6bdbe09c29d0074.poster.avif?t=1772458263)
  Transfer: small readable top-down silhouette с ясным combat-forward носом. В нашем `3D` benchmark это переводится в mage body, satchel mass и отличимый focus/wand silhouette.

### Utility props and hub stations

- Official Steam overview text on bunker/traders/modding stations: [ZERO Sievert on Steam](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
  Transfer: hub должен ощущаться как chain of useful stations, а не пустой лобби-зал. Поэтому активный `3D` blockout уже держит vault, spell broker, scrying board и rune forge.
- Public gameplay guide: [This Is The ZERO Sievert Bunker! - The Guide | ZERO Sievert](https://www.youtube.com/watch?v=vVI-Vbpcm4k)
  Transfer: при следующем visual polish pass уточнить station spacing, signage density и декоративный clutter уже в `3D` prop language.

### Weather, fog, light layers

- Official Steam poster: [wasteland lighting poster](https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1782120/extras/4c36fff43cd0af965ee17bd4625e178f.poster.avif?t=1772458263)
  Transfer: даже в indoor sanctum pass важна направленная атмосферность и light pooling; поэтому текущий `3D` benchmark получил fog + отдельные station lights, а не плоский общий залив.

### Inventory / vault proportions

- Official Steam overview on loot, trading, base upgrades: [ZERO Sievert on Steam](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
  Transfer: инвентарь обязан быть утилитарным и dense, потому что loot/trade/base loop строится вокруг него.
- Public gameplay guide: [This Is The ZERO Sievert Bunker! - The Guide | ZERO Sievert](https://www.youtube.com/watch?v=vVI-Vbpcm4k)
  Transfer: текущий shell берет за рабочий контракт `12x6` для vault и `8x6` для player inventory, с одновременной видимостью обоих контейнеров.

### Spell broker screen layout

- Official Steam poster: [loot and questing poster](https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1782120/extras/2f83efa1664e81bfb6c202ba284b0d74.poster.avif?t=1772458263)
  Transfer: spell broker flow пока не реализуется, но торговая зона уже присутствует как hotspot-reserved `3D` prop cluster, чтобы композиция sanctum не потребовала переезда в следующем milestone.

### Proxy asset policy

- Active repo contract: любые replace-later модели идут через `assets/proxy/` и реестр `assets/proxy/PROXY_asset_registry.csv`.
- Текущий sanctum benchmark намеренно использует `internal proxy blockout`, чтобы 3D-моделлер потом мог заменить wrapper-сцены без переделки feature flow.

## Правило работы

- Каждый новый визуальный референс должен попадать в одну из категорий выше.
- Если референс влияет на product scope или архитектуру UI, обновлять также `visual_bible.md` и `decision_log.md`.
