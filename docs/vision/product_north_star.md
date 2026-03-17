# Product North Star

## Миссия

Собрать на `Godot 4 + GDScript` одиночную `3D top-down magical extraction` игру с максимально близкой к `ZERO Sievert` структурой **по функции**, но с public-safe dark-fantasy сеттингом, собственным набором названий и production-safe proxy pipeline.

## Baseline

- Official parity baseline verified on `March 17, 2026` from:
  - [Steam store page](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
  - [Official Steam news hub](https://store.steampowered.com/news/app/1782120)
- `ZERO Sievert` используется как parity-reference по системам, UX density, extraction pacing и tactical readability, а не как визуальный `1:1` контракт.
- Продуктовый baseline проекта:
  - `3D`
  - `tilted orthographic camera`
  - `grim arcane low-poly`
  - desktop-first
  - single-player
  - public-safe naming
- Functional translation baseline:
  - bunker -> `Ash Sanctum`
  - traders/services -> `Spell Broker`, `Archivist`, `Rune Forge`, `Alchemy Bench`, `Relic Ward`
  - weapons -> spells / tomes / foci
  - weapon mods -> runes / glyphs / seals
  - ammo economy -> mana + catalysts
  - armor/backpacks -> robes + relics + satchels
  - underground special spaces -> ritual dungeons / cursed catacombs
- Chosen defaults for roadmap work:
  - survival stack: almost full parity
  - dungeon layer: authored templates + procedural assembly
  - naming policy: neutral original names
  - naming depth: temporary canonical names, not final lore lock

## Product Pillars

1. Functional parity first: spells, sanctum meta, dungeons, bosses, progression and extraction loop должны повторять глубину референса по функции.
2. Tactical readability: игрок всегда быстро понимает угрозу, лут, выход, касты, статусы и состояние персонажа в `3D top-down` кадре.
3. Sanctum-to-dungeon escalation: безопасный хаб, опасная поверхность и gated boss-content через `dungeon before boss`.
4. Systems depth without code chaos: глубина строится через data-driven модели, сервисы и feature-first архитектуру.
5. Early visual contract: sanctum, wilderness, dungeon и HUD получают читаемый visual contract заранее, а не после появления всей механики.

## Current Implemented Benchmark

На момент этого документа в репозитории уже есть:

- `3D` sanctum benchmark через существующий `BunkerSlice3D` technical route
- walkable hub slice
- live inventory/vault shell
- proxy asset registry
- magical intake flow
- step-by-step verification contract для дальнейшей реализации

## Roadmap Authority

- Канонический execution plan теперь живет в:
  - `docs/roadmap/magical_extraction_master_roadmap.md`
  - `docs/roadmap/magic_parity_mapping.md`
- Эти два документа должны считаться главным source-of-truth для новых системных задач.
- Existing `Bunker*` code names сохраняются как временные technical aliases до отдельного cleanup/rename pass.

## Current Non-Goals

- Этот документный pass не переименовывает runtime API и не исполняет gameplay roadmap.
- `Workshop/modding` не является gate для parity-complete baseline.
- Финальные lore names не фиксируются в этом проходе; пока используются временные canonical names.
