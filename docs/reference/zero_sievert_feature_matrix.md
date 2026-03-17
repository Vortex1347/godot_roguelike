# ZERO Sievert Feature Matrix

Baseline зафиксирован по публичным материалам Steam на `17 марта 2026 года`.

Источник: [Steam ZERO Sievert](https://store.steampowered.com/app/1782120/ZERO_Sievert/)

| Система | Публичный baseline | Наш план |
| --- | --- | --- |
| Core loop | bunker -> raid -> loot -> extract -> upgrade | Фаза 1 vertical slice |
| Procedural maps | procedural layouts, hiding spots, loot locations, weather | Фаза 1: один map slice, Фаза 2: масштабирование |
| Maps | публично заявлено `6` карт | После vertical slice |
| Weapons | `50+` уникальных пушек | Позже, после одной рабочей weapon family |
| Weapon mods | `150+` модов | Фаза 2 |
| Hunter progression | perks / progression | Фаза 2 |
| Weapon skill system | xp and perks per weapon family | Фаза 2 |
| Factions | Green Army / Crimson Corporation по публичному описанию | Фаза 2 |
| Quests | multiple questlines | Фаза 1 stub, затем Фаза 2 |
| Loot economy | `100+` предметов, trade, craft, base upgrades | Фаза 1 shell, затем расширение |
| Base upgrades | bunker progression | Фаза 2 |
| Modding / Workshop | поздний live-layer | Фаза 3, не раньше |

## Правило использования матрицы

- Любая новая фича сначала сопоставляется с baseline-строкой из этой матрицы.
- Если фича не имеет аналога в baseline или выходит за выбранный milestone, она не добавляется молча.

