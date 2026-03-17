# Magic Parity Mapping

Official parity baseline verified on `March 17, 2026` from:

- [Steam ZERO Sievert store page](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
- [Official Steam news hub](https://store.steampowered.com/news/app/1782120)

Этот документ нужен, чтобы будущий implementer не изобретал thematic translation заново. `ZERO Sievert` здесь выступает только как functional reference.

## Правила

- `Parity Rule` описывает, что именно обязано совпадать **по функции**.
- `Public-Safe Alias` использует временные canonical names, а не финальный lore lock.
- `Current Repo Alias` фиксирует существующую техническую опору, если она уже есть.
- `Source Status`:
  - `verified_store`
  - `verified_news`
  - `mixed_official_audit_required`
  - `audit_required`

| Reference Function | Magical Counterpart | Parity Rule | Public-Safe Alias | Current Repo Alias | Source Status | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Bunker hub | Sanctum hub | Safe prep space, services, storage, upgrades, day refresh | `Ash Sanctum` | `BunkerSlice3D`, `BunkerSessionState` | `verified_store` | Technical `Bunker*` names remain temporary |
| Traders / hub services | Guild vendors and sanctum workstations | Distinct service roles, refresh loops, item/service economy | `Spell Broker`, `Archivist`, `Rune Forge`, `Alchemy Bench`, `Relic Ward` | `OPEN_TRADER`, `features/traders/` | `verified_store` | Can split into more roles later without changing parity rule |
| Weapons | Spells / tomes / foci | Offensive loadout families with mastery and upgrade surface | `Spell Tomes`, `Foci` | starter `Focus` silhouette, inventory shell | `verified_store` | `spells = weapons` |
| Weapon mods | Runes / glyphs / seals | Compatibility matrix and stat-altering customization layer | `Runes`, `Glyphs`, `Seals` | no runtime alias yet | `verified_store` | `runes = mods` |
| Ammo / reload economy | Mana + catalysts + cast cycle | Resource spend, tempo pressure, wrong-resource failure, recovery cadence | `Mana`, `Catalysts` | no runtime alias yet | `verified_store` | `mana + catalysts = ammo/reload economy` |
| Armor / backpacks | Robes + relics + satchels | Defense, utility stats and carry-capacity loop | `Robes`, `Relics`, `Satchels` | `Field Satchel` UI term | `verified_store` | Relics cover utility gear role |
| Hunter progression | Spell mastery + guild progression | Multi-axis progression through perks, faction gates and unlocks | `Spell Mastery`, `Guild Standing` | `features/progression/` | `verified_store` | Split between mastery and factions |
| Weapon skill system | Spell-family mastery XP | Each offensive family gets its own XP and perk track | `Mastery Paths` | no runtime alias yet | `verified_store` | One track per spell family |
| Factions | Orders / compacts / choirs / wardens | Reputation, hostility, quest and economy gates | `Order of Glass`, `Cinder Compact`, `Mire Choir`, `Pale Wardens` | `FactionDef` planned | `verified_store` | Temporary canonical names |
| Mutants / hostile ecology | Cursed beasts, blighted humanoids, arcane aberrants | Same role coverage across melee, ranged, packs, elites, special threats | `Cursed Beasts`, `Blighted Humanoids`, `Arcane Aberrants` | future AI/runtime layers | `mixed_official_audit_required` | Exact family count audited later |
| Anomalies / environmental hazards | Corruption fields, cursed weather, trap zones | Hazard pressure, route denial, DOT/status and telegraphed danger | `Arcane Anomalies`, `Corruption Fields` | future `AnomalyDef` | `mixed_official_audit_required` | Functional parity chosen early |
| Underground special spaces | Ritual dungeons / cursed catacombs | Boss content is gated behind dungeon completion, not instant arena entry | `Dungeon_01+`, `Cursed Catacombs` | no runtime alias yet | `audit_required` | Roadmap locks dungeon-before-boss structure |
| Boss spaces / special encounters | Dungeon boss arenas | Phase-based apex fights with loot/reward gate | `Boss_01+` | future `BossDef` | `audit_required` | Uses content IDs until lore lock |
| Quests / task board | Contracts / rituals / expedition tasks | Main spine + side objectives + turn-in loop | `Scrying Board`, `Contracts` | `OPEN_TASK_BOARD` | `verified_store` | Task surface remains dense and utilitarian |
| Loot economy | Monster parts, cursed artifacts, catalysts, materials | Dense extraction economy with trade, craft, repair and upgrade sinks | `Relic Shards`, `Catalysts`, `Sanctum Materials` | `LootService`, inventory shell | `verified_store` | Keeps pressure on inventory and extraction choices |
| Base upgrades | Sanctum modules and workstations | Meta-progression through build/upgrade loop and passive outputs | `Sanctum Modules` | future `SanctumModuleDef` | `verified_store` | `bunker upgrades = sanctum modules` |
| HUD / PDA / map screens | Raid HUD + scrying slate + field chart | Same tactical information density and screen switching pressure | `Scrying Slate`, `Field Chart`, `Vault UI` | current inventory shell | `verified_store` | UI parity is mandatory |
| Extraction loop | Extraction sigils / gates | Risky exit flow, denial states, overloaded pressure, return summary | `Extraction Sigils` | `ExtractionRunService` | `verified_store` | End-to-end golden path must stay close by function |
| Modding / Workshop | Post-parity appendix only | Not required for parity-complete gate | `Appendix Only` | none | `verified_store` | Explicitly out of scope for current roadmap gate |
