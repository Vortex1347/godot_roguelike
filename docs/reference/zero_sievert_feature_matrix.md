# ZERO Sievert Feature Matrix

Baseline зафиксирован по официальным материалам Steam на `17 марта 2026 года`.

После перехода на magical parity эта матрица используется как comparative reference по systems parity, UX density и roadmap phase coverage.

Источники:

- [Steam ZERO Sievert store page](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
- [Official Steam news hub](https://store.steampowered.com/news/app/1782120)

| System | Public Baseline | Magical Counterpart | Roadmap Phase | Source Status | Notes |
| --- | --- | --- | --- | --- | --- |
| Core loop | bunker -> raid -> loot -> extract -> upgrade | `Ash Sanctum -> surface raid / dungeon run -> loot -> extract -> sanctum growth` | `1, 6, 7, 8, 12` | `verified_store` | Functional parity, not visual cloning |
| Procedural maps | procedural layouts, hiding spots, loot locations, weather | corrupted wilderness with procedural POIs, extraction sigils, loot spawns, weather and dungeon entrances | `7` | `verified_store` | Outdoor parity stays extraction-first |
| Maps | publicly listed `6` maps | selected surface maps via temporary IDs `Map_Surface_01+` with later count parity review | `7, 14` | `verified_store` | Final content count gated after core systems |
| Weapons | `50+` unique guns | spell families, tomes and foci | `3, 4, 14` | `verified_store` | `spells = weapons` rule |
| Weapon mods | `150+` mods | runes / glyphs / seals | `4, 12, 14` | `verified_store` | `runes = mods` rule |
| Hunter progression | skills / perks / progression | spell mastery, faction reputation and sanctum unlocks | `4, 11, 14` | `verified_store` | Magical progression split across mastery + factions |
| Weapon skill system | xp and perks per weapon family | spell mastery XP and spell-family perks | `4` | `verified_store` | One mastery track per spell family |
| Factions | multiple factions with tension and progression | `Order of Glass`, `Cinder Compact`, `Mire Choir`, `Pale Wardens` | `11, 14` | `verified_store` | Temporary canonical names only |
| Quests | multiple questlines | contracts, rituals, delivery/explore/kill chains, main spine | `11` | `verified_store` | Task board becomes scrying/contracts surface |
| Loot economy | `100+` items, trade, craft, base upgrades | monster parts, cursed artifacts, catalysts, sanctum materials, trade/craft loop | `5, 12, 14` | `verified_store` | Dense item economy preserved |
| Base upgrades | bunker progression | sanctum modules and workstations | `6, 12, 14` | `verified_store` | `bunker upgrades = sanctum modules` |
| Traders / services | trader ecosystem and station utility | spell broker, archivist, alchemy, rune forge, relic ward | `6, 12, 13, 14` | `verified_store` | Service roles are public-safe aliases |
| Hazards / anomalies | weather, environmental danger, anomaly-like threats | corruption fields, cursed weather, arcane anomalies, trap zones | `2, 7, 8, 14` | `mixed_official_audit_required` | Exact live parity needs further audit |
| Underground special spaces | deeper high-risk spaces and special encounters | ritual dungeons / cursed catacombs before boss arenas | `8, 9, 14` | `audit_required` | Structure chosen for parity even where official text is less explicit |
| HUD / PDA / map | dense tactical UI and task management | raid HUD, scrying slate, field chart, vault UI, compare overlays | `13` | `verified_store` | UI density parity is mandatory |
| Extraction loop | extraction points, loss risk, return summary | extraction sigils / gates, overloaded return risk, sanctum summary | `1, 7, 13, 15` | `verified_store` | End-to-end parity gate |
| Modding / Workshop | later live-layer | post-parity appendix only | `appendix` | `verified_store` | Explicitly outside parity-complete gate |

## Правило использования матрицы

- Любая новая фича сначала сопоставляется с baseline-строкой из этой матрицы.
- Если фича не имеет аналога в baseline или выходит за выбранный milestone, она не добавляется молча.
- `Source Status` трактуется так:
  - `verified_store` - формулировка подтверждена официальной store page
  - `verified_news` - формулировка подтверждена официальным Steam news hub
  - `mixed_official_audit_required` - есть частичное официальное основание, но parity-detail требует отдельного аудита
  - `audit_required` - функциональная parity-цель выбрана осознанно, но точная reference detail еще должна быть перепроверена
