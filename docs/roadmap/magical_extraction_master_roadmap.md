# Magical Extraction Master Roadmap

Official parity baseline verified on `March 17, 2026` from:

- [Steam ZERO Sievert store page](https://store.steampowered.com/app/1782120/ZERO_Sievert/)
- [Official Steam news hub](https://store.steampowered.com/news/app/1782120)

Этот файл — главный phased checklist проекта. Он должен быть достаточно конкретным, чтобы следующий implementer не принимал архитектурные, системные или naming-решения от себя.

## Status Vocabulary

- `planned` - задача признана обязательной, но не начата
- `benchmark` - есть vertical-slice / placeholder реализация, но parity не закрыта
- `in_progress` - активная реализация в работе
- `audit_required` - parity-goal выбран, но reference detail или balance detail еще нужно подтвердить
- `parity_complete` - задача закрыта по текущему parity gate
- `out_of_scope` - вне текущего parity gate

## Verification Modes

- `doc_review`
- `headless_smoke`
- `visual_screenshot + behavior_walkthrough`
- `behavior_walkthrough`
- `controller_walkthrough`
- `parity_audit`

## Phase 0 Glossary And Naming Freeze

### Temporary canonical names

- Hub: `Ash Sanctum`
- Service roles:
  - `Spell Broker`
  - `Archivist`
  - `Rune Forge`
  - `Alchemy Bench`
  - `Relic Ward`
- Factions:
  - `Order of Glass`
  - `Cinder Compact`
  - `Mire Choir`
  - `Pale Wardens`
- Enemy families:
  - `Cursed Beasts`
  - `Blighted Humanoids`
  - `Arcane Aberrants`
  - `Dungeon Guardians`
- Content IDs:
  - `Map_Surface_01`, `Map_Surface_02`, `Map_Surface_03`
  - `Dungeon_01`, `Dungeon_02`
  - `Boss_01`, `Boss_02`

### Naming rules

- Shipping docs используют public-safe original names.
- Final lore names не фиксируются в этом roadmap.
- Existing `Bunker*` code names сохраняются как temporary technical aliases до отдельного cleanup phase.

## Canonical Future Interfaces

### Static defs

- `SpellDef`
- `RuneDef`
- `CatalystDef`
- `RobeDef`
- `RelicDef`
- `SatchelDef`
- `ConsumableDef`
- `FactionDef`
- `QuestDef`
- `MapDef`
- `DungeonDef`
- `BossDef`
- `AnomalyDef`
- `SanctumModuleDef`

### Runtime models

- `PlayerVitalsState`
- `ManaState`
- `SpellLoadoutState`
- `EquipmentState`
- `SanctumState`
- `RaidRunState`
- `DungeonRunState`
- `BossEncounterState`
- `FactionReputationState`
- `QuestLogState`
- `SaveState`

### Services

- `SpellCastService`
- `ManaResolver`
- `CatalystResolver`
- `DamageResolver`
- `LootService`
- `QuestService`
- `FactionService`
- `DungeonService`
- `BossEncounterService`
- `SanctumModuleService`
- `EconomyService`

## Phase 0 — Doc Reset + Parity Vocabulary

- [x] Reset source-of-truth docs to `public-safe magical parity by function` | status=parity_complete | parity_target=Project baseline no longer described as inspired-only sci-fi extraction | magic_counterpart=Magical parity baseline | acceptance_gate=Product docs, logs and feature matrix all point to the same baseline | verification_mode=doc_review | notes=Completed in this docs pass
- [x] Freeze temporary canonical names and naming rules | status=parity_complete | parity_target=Implementer does not invent lore names ad hoc | magic_counterpart=Ash Sanctum glossary | acceptance_gate=Roadmap, mapping and product docs use the same temporary names and content IDs | verification_mode=doc_review | notes=Final lore naming intentionally deferred
- [x] Freeze `Bunker*` code names as temporary technical aliases | status=parity_complete | parity_target=No runtime rename implied by roadmap adoption | magic_counterpart=Technical alias rule | acceptance_gate=Docs explicitly say no code/API rename in this pass | verification_mode=doc_review | notes=Dedicated cleanup phase later
- [x] Add parity mapping table | status=parity_complete | parity_target=Every major reference system has a magical translation | magic_counterpart=Magic parity mapping | acceptance_gate=`magic_parity_mapping.md` covers all major systems | verification_mode=doc_review | notes=Canonical mapping doc created
- [x] Add phased master roadmap | status=parity_complete | parity_target=Next implementer can work phase-by-phase without inventing systems | magic_counterpart=Master roadmap | acceptance_gate=Phases `0-15` exist and each checklist line uses the fixed schema | verification_mode=doc_review | notes=Canonical phased checklist created
- [ ] Audit older historical docs for leftover inspired-only wording | status=audit_required | parity_target=No active source-of-truth conflicts remain | magic_counterpart=Terminology cleanup | acceptance_gate=Active docs no longer conflict with magical parity baseline | verification_mode=doc_review | notes=Historical log entries may remain as history

## Phase 1 — Core Flow Foundation

- [ ] Main menu shell | status=planned | parity_target=Player can enter game, access settings and saves | magic_counterpart=Main menu for magical extraction | acceptance_gate=Menu routes to sanctum startup, settings and save slots | verification_mode=behavior_walkthrough | notes=Controller-ready from day one
- [ ] Save slot framework | status=planned | parity_target=Persistent player meta and hub state | magic_counterpart=Sanctum save slots | acceptance_gate=New game, continue, overwrite and slot metadata work | verification_mode=behavior_walkthrough | notes=No hardcore rules yet
- [ ] Settings shell | status=planned | parity_target=Core graphics/audio/input options | magic_counterpart=Same function, magical theme-neutral | acceptance_gate=Settings persist and apply without breaking startup flow | verification_mode=behavior_walkthrough | notes=Input rebinding hooks required
- [ ] Sanctum startup flow | status=benchmark | parity_target=Hub-first game entry | magic_counterpart=`Ash Sanctum` startup | acceptance_gate=Project launches into sanctum flow with stable routing and prompts | verification_mode=visual_screenshot + behavior_walkthrough | notes=Current 3D sanctum slice is only a benchmark
- [ ] Surface raid entry | status=planned | parity_target=Transition from sanctum to selected map | magic_counterpart=Expedition launch | acceptance_gate=Player can pick a surface map and spawn into raid state | verification_mode=behavior_walkthrough | notes=Temporary map IDs acceptable
- [ ] Extraction loop | status=planned | parity_target=Risky return path with denial states | magic_counterpart=Extraction sigils / gates | acceptance_gate=Extraction can succeed, fail, or be denied based on valid conditions | verification_mode=behavior_walkthrough | notes=Overloaded extraction remains in parity scope
- [ ] Death and loss loop | status=planned | parity_target=Failure has material consequence and clean return path | magic_counterpart=Corrupted expedition loss | acceptance_gate=Death transitions to summary and loss rules apply consistently | verification_mode=behavior_walkthrough | notes=Scope excludes final difficulty presets here
- [ ] Return summary | status=planned | parity_target=Post-raid summary of loot, losses and progression | magic_counterpart=Sanctum return report | acceptance_gate=Summary reflects raid result and routes back to sanctum | verification_mode=behavior_walkthrough | notes=Dense utility UI, not celebratory spectacle
- [ ] Input baseline | status=planned | parity_target=Keyboard/mouse and controller parity | magic_counterpart=Spell-casting control layer | acceptance_gate=Movement, interact, inventory, map, hotbar and menu navigation work on both schemes | verification_mode=controller_walkthrough | notes=Prompt switching and UI focus behavior included here

## Phase 2 — Player State And Survival

- [ ] HP and damageable state | status=planned | parity_target=Player has persistent combat health state | magic_counterpart=Vitality | acceptance_gate=Damage changes HP correctly across raid loop | verification_mode=behavior_walkthrough | notes=Foundation for all survival systems
- [ ] Wounds and bleed analogue | status=planned | parity_target=Non-trivial recovery pressure beyond raw HP | magic_counterpart=Wounds / bleed / cursed injury | acceptance_gate=Persistent debuff states require correct treatment items or services | verification_mode=behavior_walkthrough | notes=Should not collapse into one generic debuff
- [ ] Mana pool | status=planned | parity_target=Primary spell resource | magic_counterpart=ManaState | acceptance_gate=Mana spend, depletion and recharge rules apply consistently | verification_mode=behavior_walkthrough | notes=Separate from catalyst economy
- [ ] Catalyst inventory and spend | status=planned | parity_target=Ammo-equivalent resource pressure | magic_counterpart=Catalysts / reagents / infused charges | acceptance_gate=Spells that require catalysts fail cleanly when wrong or empty | verification_mode=behavior_walkthrough | notes=Wrong-catalyst feedback mandatory
- [ ] Hunger loop | status=planned | parity_target=Longer-run survival pressure | magic_counterpart=Ration analogue retained | acceptance_gate=Food consumption and penalties work across raids and sanctum return | verification_mode=behavior_walkthrough | notes=In parity scope, not postponed
- [ ] Thirst loop | status=planned | parity_target=Resource attrition across expeditions | magic_counterpart=Hydration analogue retained | acceptance_gate=Drinks and penalties work consistently | verification_mode=behavior_walkthrough | notes=Pairs with hunger but is distinct
- [ ] Fatigue / energy loop | status=planned | parity_target=Sleep/rest cadence matters | magic_counterpart=Fatigue and recovery | acceptance_gate=Rest and day advance interact correctly with expedition prep | verification_mode=behavior_walkthrough | notes=Hooks into sanctum services
- [ ] Carry weight and encumbrance | status=planned | parity_target=Loot choices create movement and extraction pressure | magic_counterpart=Satchel load / encumbrance | acceptance_gate=Weight penalties affect move/combat/extraction as specified | verification_mode=behavior_walkthrough | notes=Golden-path scenario depends on this
- [ ] Corruption analogue | status=planned | parity_target=Radiation-like long-run hazard pressure | magic_counterpart=Corruption / taint | acceptance_gate=Hazard accumulation, cleanse items and services work | verification_mode=behavior_walkthrough | notes=Links surface and dungeon hazards
- [ ] Restoration items and services | status=planned | parity_target=Consumable and hub-based recovery | magic_counterpart=Vital draughts / cleanse / sanctum healing | acceptance_gate=Field and hub recovery options have distinct roles and limits | verification_mode=behavior_walkthrough | notes=No generic full-heal shortcut
- [ ] Low-resource feedback | status=planned | parity_target=Player gets clear alerts when near failure | magic_counterpart=Low HP / low mana / low catalysts / high corruption alerts | acceptance_gate=HUD warnings trigger correctly without visual spam | verification_mode=visual_screenshot + behavior_walkthrough | notes=Readability-first

## Phase 3 — Spell Combat

- [ ] Basic cast | status=planned | parity_target=Primary offensive action exists | magic_counterpart=Spell cast trigger | acceptance_gate=Basic offensive spell fires, spends correct resources and resolves hit logic | verification_mode=behavior_walkthrough | notes=No placeholder melee-only combat
- [ ] Aimed cast | status=planned | parity_target=Directional precision attacks | magic_counterpart=Aimable spell casting | acceptance_gate=Mouse aim and right-stick aim both work | verification_mode=controller_walkthrough | notes=Must match overall input baseline
- [ ] Projectile archetype | status=planned | parity_target=Bullet-like family analogue | magic_counterpart=Arcane projectile spells | acceptance_gate=Travel, impact and collision are readable and deterministic | verification_mode=behavior_walkthrough | notes=Core family
- [ ] Beam archetype | status=planned | parity_target=Continuous damage family | magic_counterpart=Beam / ray spells | acceptance_gate=Channel start, sustain and interruption function correctly | verification_mode=behavior_walkthrough | notes=Resource cadence differs from projectile
- [ ] Burst / volley archetype | status=planned | parity_target=Multi-shot analogue | magic_counterpart=Burst spells | acceptance_gate=Cadence, spread and hit logic are stable | verification_mode=behavior_walkthrough | notes=Can represent shotgun / burst parity patterns
- [ ] Cone / close-range archetype | status=planned | parity_target=Short-range pressure family | magic_counterpart=Cone blasts / breath / wave casts | acceptance_gate=Range and telegraph are readable from top-down camera | verification_mode=visual_screenshot + behavior_walkthrough | notes=Useful for crowd control
- [ ] Area / ground-target archetype | status=planned | parity_target=Zone-control family | magic_counterpart=Area sigils / zones | acceptance_gate=Placement, hazard duration and friendly readability work | verification_mode=visual_screenshot + behavior_walkthrough | notes=UI telegraph must stay clear
- [ ] Charge-up casts | status=planned | parity_target=Held attacks with payoff | magic_counterpart=Charged ritual casts | acceptance_gate=Hold/release behavior, interruption and payoff are consistent | verification_mode=behavior_walkthrough | notes=Must not feel like generic cooldown skill
- [ ] Cast interruption | status=planned | parity_target=Damage and movement can meaningfully disrupt actions where intended | magic_counterpart=Interrupted channel / ritual | acceptance_gate=Interruption rules are explicit and stable | verification_mode=behavior_walkthrough | notes=High-signal combat feel mechanic
- [ ] Cooldowns | status=planned | parity_target=Tempo control beyond raw resource spend | magic_counterpart=Cooldown-controlled spells | acceptance_gate=Cooldown display and lockout work on HUD and hotbar | verification_mode=visual_screenshot + behavior_walkthrough | notes=Per-spell, not global by default
- [ ] Resource failure feedback | status=planned | parity_target=Clear out-of-mana and wrong-catalyst responses | magic_counterpart=Resource denial feedback | acceptance_gate=Player receives readable denial signal with no silent fail | verification_mode=behavior_walkthrough | notes=Mandatory micro-mechanic
- [ ] Crit / status / stagger / knockback | status=planned | parity_target=Combat effects beyond flat DPS | magic_counterpart=Procs, stagger and elemental/curse responses | acceptance_gate=Effect triggers, feedback and resist handling are deterministic | verification_mode=behavior_walkthrough | notes=Links to enemy resist tables
- [ ] Resist checks | status=planned | parity_target=Targets respond differently to spell families and statuses | magic_counterpart=Elemental / corruption / curse resistances | acceptance_gate=Damage and status results reflect resist model | verification_mode=behavior_walkthrough | notes=Bosses rely on this
- [ ] Melee fallback | status=planned | parity_target=Close-range option when main resource plan fails | magic_counterpart=Arcane strike / ritual blade / emergency focus hit | acceptance_gate=Fallback action exists and is readable, but does not replace spell loop | verification_mode=behavior_walkthrough | notes=Parity helper, not main fantasy

## Phase 4 — Spell Inventory And Progression

- [ ] Spell tome acquisition | status=planned | parity_target=Offensive tools are collectible and tradable | magic_counterpart=Tome acquisition | acceptance_gate=Spell items can be found, bought and stored | verification_mode=behavior_walkthrough | notes=Links inventory and economy
- [ ] Spell loadout | status=planned | parity_target=Equipped offensive set separate from stash | magic_counterpart=Prepared spell loadout | acceptance_gate=Player equips legal spell set and persists it | verification_mode=behavior_walkthrough | notes=Must not live as UI-only state
- [ ] Hotbar assignment | status=planned | parity_target=Fast access to equipped spells/items | magic_counterpart=Spell hotbar | acceptance_gate=Assign/use/swap works on KBM and controller | verification_mode=controller_walkthrough | notes=Parity-critical micro-mechanic
- [ ] Compare tooltips | status=planned | parity_target=Item/spell comparison supports informed loadout choices | magic_counterpart=Compare tomes/runes/foci | acceptance_gate=Comparison shows relevant deltas clearly | verification_mode=visual_screenshot + behavior_walkthrough | notes=Dense utility UI
- [ ] Rune socketing | status=planned | parity_target=Primary customization path | magic_counterpart=Rune insertion / removal | acceptance_gate=Socket, unsocket and legality checks work | verification_mode=behavior_walkthrough | notes=Parity gate with weapon mods
- [ ] Rune compatibility | status=planned | parity_target=Not every rune fits every spell/focus | magic_counterpart=Compatibility matrix | acceptance_gate=Illegal combinations are blocked with readable reason | verification_mode=behavior_walkthrough | notes=Mandatory system depth
- [ ] Spell mastery XP | status=planned | parity_target=Usage-driven progression per family | magic_counterpart=Mastery paths | acceptance_gate=XP accrues to correct family and persists | verification_mode=behavior_walkthrough | notes=No generic account XP substitute
- [ ] Mastery perks | status=planned | parity_target=Family-specific rewards from use | magic_counterpart=Spell-family perks | acceptance_gate=Unlock, selection and effect application work | verification_mode=behavior_walkthrough | notes=Needs UI support later
- [ ] Spell rarity tiers | status=planned | parity_target=Loot and trade quality ladder | magic_counterpart=Rarity for tomes/foci | acceptance_gate=Rarity affects economy and desirability without replacing mastery | verification_mode=behavior_walkthrough | notes=Readable, not color-spam
- [ ] Catalyst compatibility | status=planned | parity_target=Some spells require specific reagents or focus types | magic_counterpart=Catalyst family matching | acceptance_gate=Compatibility rules affect preparation and combat usage | verification_mode=behavior_walkthrough | notes=Bridges combat and economy

## Phase 5 — Equipment And Loot

- [ ] Robes | status=planned | parity_target=Armor-equivalent defense layer | magic_counterpart=Robe families | acceptance_gate=Equip, compare, defense and resist effects work | verification_mode=behavior_walkthrough | notes=Armor classes map here
- [ ] Relics / foci | status=planned | parity_target=Utility and stat modifiers | magic_counterpart=Relics and combat foci | acceptance_gate=Equipment slots and stat changes work correctly | verification_mode=behavior_walkthrough | notes=May overlap with spell focus depending on item family
- [ ] Satchels | status=planned | parity_target=Carry-capacity equipment | magic_counterpart=Satchel families | acceptance_gate=Capacity and weight interaction are explicit and stable | verification_mode=behavior_walkthrough | notes=Backpack parity role
- [ ] Consumables | status=planned | parity_target=Healing, cleansing and survival items | magic_counterpart=Draughts, tonics, food, drinks | acceptance_gate=Use cases and stack behaviors are correct | verification_mode=behavior_walkthrough | notes=Includes cleanse items
- [ ] Crafting materials | status=planned | parity_target=Economy sinks and upgrade dependencies | magic_counterpart=Resin, chalk, thread, shards, reagents | acceptance_gate=Materials appear in loot tables and service recipes | verification_mode=behavior_walkthrough | notes=Needs naming discipline
- [ ] Monster parts and cursed artifacts | status=planned | parity_target=Theme-specific high-value loot | magic_counterpart=Beast parts / relic fragments / cursed curios | acceptance_gate=Drop sources and vendor demand are coherent | verification_mode=behavior_walkthrough | notes=Helps magical economy feel distinct
- [ ] Quest items | status=planned | parity_target=Objective-specific cargo and handoff items | magic_counterpart=Ritual objects / archives / samples | acceptance_gate=Quest items track correctly through raid and turn-in | verification_mode=behavior_walkthrough | notes=No accidental sell/delete flows
- [ ] Container loot tables | status=planned | parity_target=POI and chest-based item distribution | magic_counterpart=Crates, archives, reliquaries, caches | acceptance_gate=Containers draw correct themed loot pools | verification_mode=behavior_walkthrough | notes=Surface and dungeon can diverge
- [ ] Corpse loot tables | status=planned | parity_target=Enemy-sourced loot loop | magic_counterpart=Corpse and remains drops | acceptance_gate=Enemy archetypes drop appropriate loot families | verification_mode=behavior_walkthrough | notes=Supports hunting routes
- [ ] Item metadata parity | status=planned | parity_target=Value, stack, weight, size, rarity and vendor affinity all matter | magic_counterpart=Dense magical item metadata | acceptance_gate=Metadata drives inventory, economy and comparison flows consistently | verification_mode=behavior_walkthrough | notes=Core to extraction pressure

## Phase 6 — Sanctum Meta

- [ ] Vault storage | status=benchmark | parity_target=Shared stash layer for meta progression | magic_counterpart=Sanctum vault | acceptance_gate=Vault persists and integrates with broader sanctum loop | verification_mode=behavior_walkthrough | notes=Current shell is only a benchmark
- [ ] Multiple storage categories | status=planned | parity_target=Meta storage grows beyond one generic grid | magic_counterpart=Archive / materials / relic vault segments | acceptance_gate=Category structure improves usability without fragmenting state | verification_mode=behavior_walkthrough | notes=Can start tabbed
- [ ] Vendor flows | status=planned | parity_target=Buy, sell and service loops in hub | magic_counterpart=Spell Broker and allied roles | acceptance_gate=At least one full buy/sell/service cycle works | verification_mode=behavior_walkthrough | notes=Current hotspot is placeholder only
- [ ] Task board | status=planned | parity_target=Quest accept/track/turn-in loop starts from hub | magic_counterpart=Scrying board | acceptance_gate=Tasks can be accepted, tracked and turned in | verification_mode=behavior_walkthrough | notes=UI density matters
- [ ] Healing and rest services | status=planned | parity_target=Hub-based recovery choices | magic_counterpart=Relic Ward / sanctum rest | acceptance_gate=Service use changes survival states and day flow correctly | verification_mode=behavior_walkthrough | notes=Distinct from consumables
- [ ] Sanctum module upgrades | status=planned | parity_target=Base progression and passive economy | magic_counterpart=Sanctum modules | acceptance_gate=Build and upgrade loops affect available services or outputs | verification_mode=behavior_walkthrough | notes=Bridges to Phase 12
- [ ] Daily refresh | status=planned | parity_target=Time-based economy and service resets | magic_counterpart=Day advance in sanctum | acceptance_gate=Vendor stock, tasks and services refresh coherently | verification_mode=behavior_walkthrough | notes=Links fatigue/rest
- [ ] Spell purchase / sell flows | status=planned | parity_target=Weapon-buy/equip/use complexity equivalent | magic_counterpart=Spell commerce | acceptance_gate=Player can buy, compare, equip and later sell spells cleanly | verification_mode=behavior_walkthrough | notes=Parity gate
- [ ] Rune workshop | status=planned | parity_target=Modification workbench analogue | magic_counterpart=Rune Forge | acceptance_gate=Socketing and crafting routes exist from sanctum UI | verification_mode=behavior_walkthrough | notes=Connects Phases 4 and 12
- [ ] Alchemy lab | status=planned | parity_target=Consumable and reagent crafting station | magic_counterpart=Alchemy Bench | acceptance_gate=Alchemy recipes consume correct materials and output usable items | verification_mode=behavior_walkthrough | notes=Survival support station
- [ ] Relic station | status=planned | parity_target=Repair / restoration / utility service role | magic_counterpart=Relic Ward | acceptance_gate=Relic/robe restoration loop works distinctly from alchemy | verification_mode=behavior_walkthrough | notes=Service identity must be clear

## Phase 7 — Procedural Surface Maps

- [ ] Surface biome generation | status=planned | parity_target=Distinct overworld slices | magic_counterpart=Corrupted wilderness biomes | acceptance_gate=At least one biome generates stable playable layouts | verification_mode=visual_screenshot + behavior_walkthrough | notes=Extraction-first, not arena-first
- [ ] POI generation | status=planned | parity_target=Repeatable, lootable interest points | magic_counterpart=Camps, shrines, ruins, caches | acceptance_gate=POIs spawn with clear gameplay purpose and readable silhouettes | verification_mode=visual_screenshot + behavior_walkthrough | notes=Supports route planning
- [ ] Extraction point placement | status=planned | parity_target=Exit routing pressure | magic_counterpart=Extraction sigils / gates | acceptance_gate=Points spawn fairly and remain discoverable | verification_mode=behavior_walkthrough | notes=Map screen later exposes them appropriately
- [ ] Enemy spawn rules | status=planned | parity_target=Ecology and threat distribution | magic_counterpart=Beast/humanoid/aberrant spawn tables | acceptance_gate=Spawns vary by biome/POI and do not break difficulty envelope | verification_mode=behavior_walkthrough | notes=Needs faction hook
- [ ] Loot spawn rules | status=planned | parity_target=Meaningful risk-reward in routes | magic_counterpart=Relic/material/consumable spawn tables | acceptance_gate=Loot density and value align with map risk | verification_mode=behavior_walkthrough | notes=No random clutter-only POIs
- [ ] Weather states | status=planned | parity_target=Atmosphere plus tactical impact | magic_counterpart=Cursed weather / fog / storm variants | acceptance_gate=Weather changes visibility or pressure without destroying readability | verification_mode=visual_screenshot + behavior_walkthrough | notes=Readability-first
- [ ] Visibility blockers and cover | status=planned | parity_target=Top-down tactical movement and ambush space | magic_counterpart=Ruins, trees, debris, occult obstructions | acceptance_gate=Cover and blockers remain readable from camera angle | verification_mode=visual_screenshot + behavior_walkthrough | notes=Important for AI
- [ ] Anomaly / corruption fields | status=planned | parity_target=Hazard navigation on surface maps | magic_counterpart=Corruption zones and arcane anomalies | acceptance_gate=Hazards are telegraphed and mechanically meaningful | verification_mode=visual_screenshot + behavior_walkthrough | notes=Links to corruption analogue
- [ ] Dungeon entrance placement | status=planned | parity_target=Special-content gating on selected maps | magic_counterpart=Ritual dungeon entrances | acceptance_gate=Entrances are rare, legible and connected to boss/content progression | verification_mode=behavior_walkthrough | notes=Dungeon-before-boss parity hook

## Phase 8 — Dungeon Layer

- [ ] Dungeon scene graph | status=planned | parity_target=Separate, controllable dungeon runtime layer | magic_counterpart=Ritual dungeon state | acceptance_gate=Dungeon flow has its own entry, progression and exit control | verification_mode=behavior_walkthrough | notes=Separate from generic surface POI
- [ ] Authored room template library | status=planned | parity_target=Reusable handcrafted room units | magic_counterpart=Dungeon room chunks | acceptance_gate=Template set covers corridors, combat rooms, gate rooms, reward rooms and pre-boss rooms | verification_mode=visual_screenshot + behavior_walkthrough | notes=Chosen dungeon approach
- [ ] Procedural assembly rules | status=planned | parity_target=Variety without random chaos | magic_counterpart=Template assembly system | acceptance_gate=Generated path respects pacing and gate logic | verification_mode=behavior_walkthrough | notes=Not full handcrafted, not full random
- [ ] Room progression logic | status=planned | parity_target=Dungeon run has escalation and structure | magic_counterpart=Ritual path progression | acceptance_gate=Runs move through coherent sequence, not noise | verification_mode=behavior_walkthrough | notes=Supports boss pacing
- [ ] Key / ritual lock gates | status=planned | parity_target=Meaningful gating before deeper content | magic_counterpart=Ritual seals and keys | acceptance_gate=Gate items/actions unlock intended route only | verification_mode=behavior_walkthrough | notes=Mandatory micro-mechanic
- [ ] Trap types | status=planned | parity_target=Underground hazard identity | magic_counterpart=Sigils, eruptions, cursed glyph traps | acceptance_gate=Trap telegraph, trigger and damage logic are readable | verification_mode=visual_screenshot + behavior_walkthrough | notes=Should not be cheap deaths
- [ ] Elite encounters | status=planned | parity_target=Pressure spikes within dungeon | magic_counterpart=Elite guardians / aberrants | acceptance_gate=Elite rooms feel distinct and reward-worthy | verification_mode=behavior_walkthrough | notes=Boss support ecology starts here
- [ ] Reward rooms | status=planned | parity_target=Dungeon detours can pay off | magic_counterpart=Reliquaries / sealed archives | acceptance_gate=Optional reward spaces exist with clear risk/reward | verification_mode=behavior_walkthrough | notes=Helps route choice
- [ ] Exit policy | status=planned | parity_target=Dungeon retreat and completion are legible | magic_counterpart=Ritual exit rules | acceptance_gate=Entry/exit states are explicit and do not strand the player unfairly | verification_mode=behavior_walkthrough | notes=Checkpoint policy can remain conservative
- [ ] Boss gate | status=planned | parity_target=Boss is earned through dungeon completion | magic_counterpart=Boss threshold after dungeon clear | acceptance_gate=Boss access is locked behind dungeon progression, not immediate arena access | verification_mode=behavior_walkthrough | notes=Core parity rule

## Phase 9 — Boss Layer

- [ ] Boss spawn conditions | status=planned | parity_target=Special encounter is properly gated | magic_counterpart=Boss invocation / release rules | acceptance_gate=Boss becomes available only after intended dungeon conditions | verification_mode=behavior_walkthrough | notes=No accidental early trigger
- [ ] Arena transition | status=planned | parity_target=Boss space has clear state change | magic_counterpart=Boss threshold transition | acceptance_gate=Transition into boss arena is readable and reversible only where intended | verification_mode=behavior_walkthrough | notes=Needs audiovisual clarity
- [ ] Boss phases | status=planned | parity_target=Multi-stage apex encounter | magic_counterpart=Ritual phase shifts | acceptance_gate=Phase triggers, cues and escalations are readable | verification_mode=behavior_walkthrough | notes=Not just HP sponge
- [ ] Boss weaknesses and resistances | status=planned | parity_target=Spell family choice matters | magic_counterpart=Boss resist / weakness profile | acceptance_gate=Different spell families produce meaningfully different outcomes | verification_mode=behavior_walkthrough | notes=Connects to mastery and runes
- [ ] Dungeon clear rewards | status=planned | parity_target=Boss path feels worth the risk | magic_counterpart=Relics / unique tomes / rare catalysts | acceptance_gate=Reward structure justifies dungeon-before-boss loop | verification_mode=behavior_walkthrough | notes=Must support economy and progression
- [ ] Boss loot tables | status=planned | parity_target=Repeatability and chase value | magic_counterpart=Boss drop pools | acceptance_gate=Boss loot is distinct and not available in generic surface tables | verification_mode=behavior_walkthrough | notes=Can include unique crafting hooks
- [ ] Repeatability rules | status=planned | parity_target=Special content cadence is controllable | magic_counterpart=Boss revisit rules | acceptance_gate=Respawn/reset logic is explicit and balanced | verification_mode=behavior_walkthrough | notes=Do not decide purely by convenience
- [ ] Quest integration | status=planned | parity_target=Boss content ties into progression | magic_counterpart=Boss-linked contracts / rituals | acceptance_gate=At least one questline references dungeon/boss content correctly | verification_mode=behavior_walkthrough | notes=No disconnected boss novelty

## Phase 10 — Enemies And AI

- [ ] Patrol behavior | status=planned | parity_target=World feels inhabited and hostile | magic_counterpart=Patrol ecology | acceptance_gate=Relevant enemies patrol or roam coherently | verification_mode=behavior_walkthrough | notes=Surface and dungeon can differ
- [ ] Pursuit behavior | status=planned | parity_target=Detection leads to chase and pressure | magic_counterpart=Aggro and pursuit | acceptance_gate=Enemies pursue within sensible leash and threat logic | verification_mode=behavior_walkthrough | notes=Readability matters
- [ ] Lose-target behavior | status=planned | parity_target=Combat can disengage cleanly | magic_counterpart=Threat loss and search | acceptance_gate=Enemies return/search in predictable ways | verification_mode=behavior_walkthrough | notes=No permanent omniscience
- [ ] Ranged caster enemies | status=planned | parity_target=Human gunfighter analogue | magic_counterpart=Hostile casters | acceptance_gate=Ranged casting enemies telegraph and fight coherently | verification_mode=behavior_walkthrough | notes=Key parity role
- [ ] Melee beasts | status=planned | parity_target=Animal / melee mutant analogue | magic_counterpart=Cursed beasts | acceptance_gate=Rush, flank or pack pressure works as intended | verification_mode=behavior_walkthrough | notes=Silhouette must read well
- [ ] Ambushers | status=planned | parity_target=Surprise threat archetype | magic_counterpart=Blighted ambushers / lurking aberrants | acceptance_gate=Ambush logic is threatening but telegraphed enough to learn | verification_mode=behavior_walkthrough | notes=Camera readability critical
- [ ] Pack logic | status=planned | parity_target=Multi-enemy coordination | magic_counterpart=Pack aggression and cohesion | acceptance_gate=Pack units feel coordinated without swarming nonsense | verification_mode=behavior_walkthrough | notes=Needed for ecology feel
- [ ] Elite logic | status=planned | parity_target=Enhanced threat version of normal archetypes | magic_counterpart=Elite wardens / aberrants | acceptance_gate=Elites differ in behavior or mechanics, not only stats | verification_mode=behavior_walkthrough | notes=Supports dungeon escalation
- [ ] Dungeon guardians | status=planned | parity_target=Special underground defenders | magic_counterpart=Gate-bound guardians | acceptance_gate=Guardians feel distinct from surface enemies | verification_mode=behavior_walkthrough | notes=Bridge to boss layer
- [ ] Boss support adds | status=planned | parity_target=Boss fights have controlled pressure variation | magic_counterpart=Summoned or awakened support threats | acceptance_gate=Adds serve phase logic without cluttering readability | verification_mode=behavior_walkthrough | notes=Parity helper, not noise
- [ ] Hostility and faction ownership | status=planned | parity_target=World politics affect combat space | magic_counterpart=Order / compact / choir ownership and hostility | acceptance_gate=Encounter hostility respects faction state where relevant | verification_mode=behavior_walkthrough | notes=Links to quests/reputation
- [ ] Reputation interaction | status=planned | parity_target=Combat behavior and economy tie into faction standing | magic_counterpart=Guild standing effects | acceptance_gate=Standing changes influence access, hostility or rewards correctly | verification_mode=behavior_walkthrough | notes=Cross-feature system

## Phase 11 — Quests And Factions

- [ ] Main quest spine | status=planned | parity_target=Long-form progression path | magic_counterpart=Primary sanctum expedition arc | acceptance_gate=Main quest chain persists and advances across raids | verification_mode=behavior_walkthrough | notes=Public-safe names only
- [ ] Side quests | status=planned | parity_target=Repeatable and narrative support work | magic_counterpart=Contracts and faction tasks | acceptance_gate=At least multiple side quest types function end-to-end | verification_mode=behavior_walkthrough | notes=Feeds economy and reputation
- [ ] Objective types | status=planned | parity_target=Reference objective diversity | magic_counterpart=Kill / fetch / explore / delivery / ritual objectives | acceptance_gate=Each objective type can be accepted, tracked and completed | verification_mode=behavior_walkthrough | notes=Mandatory micro-mechanic coverage
- [ ] Reputation system | status=planned | parity_target=Faction-based progression and gating | magic_counterpart=Guild standing | acceptance_gate=Actions and turn-ins modify standing correctly | verification_mode=behavior_walkthrough | notes=UI visibility later
- [ ] Guild unlocks | status=planned | parity_target=Faction progression changes access | magic_counterpart=Order / compact unlocks | acceptance_gate=Standing gates at least one service, item family or questline | verification_mode=behavior_walkthrough | notes=Meaningful, not cosmetic
- [ ] Sanctum unlock chains | status=planned | parity_target=Hub expands through progression | magic_counterpart=Sanctum access chain | acceptance_gate=Stations or modules unlock via quest/reputation logic | verification_mode=behavior_walkthrough | notes=Connects hub and narrative
- [ ] Dungeon unlock chains | status=planned | parity_target=Special content progression is gated | magic_counterpart=Dungeon access conditions | acceptance_gate=Selected dungeons require prior progression or keys | verification_mode=behavior_walkthrough | notes=Supports boss pacing

## Phase 12 — Economy + Crafting + Upgrades

- [ ] Spell vendor economy | status=planned | parity_target=Weapon shop analogue | magic_counterpart=Spell Broker economy | acceptance_gate=Spell pricing, stock and refresh behave consistently | verification_mode=behavior_walkthrough | notes=Parity gate with buy/equip/use loop
- [ ] Catalyst vendor economy | status=planned | parity_target=Ammo vendor analogue | magic_counterpart=Catalyst provisioning | acceptance_gate=Catalyst availability and pricing create ongoing pressure | verification_mode=behavior_walkthrough | notes=Resource scarcity must matter
- [ ] Robe / relic vendor economy | status=planned | parity_target=Armor/util gear shop analogue | magic_counterpart=Relic Ward / Archivist sales | acceptance_gate=Defense and utility gear can be bought/sold/repaired correctly | verification_mode=behavior_walkthrough | notes=Can split roles later
- [ ] Pricing groups | status=planned | parity_target=Item category pricing behaves predictably | magic_counterpart=Magical category pricing | acceptance_gate=Buy/sell values reflect category and rarity rules | verification_mode=behavior_walkthrough | notes=Economy readability matters
- [ ] Restoration / repair services | status=planned | parity_target=Repair and recovery service analogue | magic_counterpart=Restoration / relic tending / robe repair | acceptance_gate=Services consume money/materials and restore intended state | verification_mode=behavior_walkthrough | notes=Distinct from consumables
- [ ] Alchemy recipes | status=planned | parity_target=Crafting loop for consumables and reagents | magic_counterpart=Alchemy bench recipes | acceptance_gate=Recipe inputs/outputs and unlocks work correctly | verification_mode=behavior_walkthrough | notes=Survival support layer
- [ ] Rune crafting | status=planned | parity_target=Modding-equivalent crafting path | magic_counterpart=Rune forge recipes | acceptance_gate=Rune creation and upgrade consume correct resources and respect compatibility | verification_mode=behavior_walkthrough | notes=Links to mastery and loot
- [ ] Sanctum module economy | status=planned | parity_target=Base build loop with material sinks | magic_counterpart=Sanctum modules | acceptance_gate=Modules require meaningful materials and unlock useful outputs | verification_mode=behavior_walkthrough | notes=Meta-progression layer
- [ ] Material sinks | status=planned | parity_target=Extraction economy keeps value over time | magic_counterpart=Reagents, relic parts and cursed materials sink loop | acceptance_gate=High-value materials are consumed by enough systems to prevent stagnation | verification_mode=parity_audit | notes=Balance-heavy
- [ ] Refresh logic | status=planned | parity_target=Time-based economy reset rules | magic_counterpart=Daily / weekly sanctum refresh | acceptance_gate=Vendor stock, tasks and outputs refresh on explicit schedule | verification_mode=behavior_walkthrough | notes=Needs save-state support later

## Phase 13 — HUD / UI Parity

- [ ] Raid HUD | status=planned | parity_target=Combat and survival info is readable under pressure | magic_counterpart=Magical raid HUD | acceptance_gate=Core vitals, resources and alerts are visible without clutter | verification_mode=visual_screenshot + behavior_walkthrough | notes=Density parity required
- [ ] Mana / catalyst readouts | status=planned | parity_target=Combat resource state is always legible | magic_counterpart=Mana and catalyst UI | acceptance_gate=Spend, low-resource states and refill changes are visible instantly | verification_mode=visual_screenshot + behavior_walkthrough | notes=Mandatory micro-mechanic
- [ ] Status effect cluster | status=planned | parity_target=Ongoing debuffs and buffs are trackable | magic_counterpart=Wounds, corruption, hunger, thirst, fatigue, procs | acceptance_gate=Statuses are readable without icon soup | verification_mode=visual_screenshot + behavior_walkthrough | notes=High signal only
- [ ] Task / PDA analogue | status=planned | parity_target=Quest tracking and world notes screen | magic_counterpart=Scrying slate / field ledger | acceptance_gate=Tasks, progress and map notes are accessible in-raid and in sanctum as designed | verification_mode=behavior_walkthrough | notes=Keep utility density
- [ ] Map screen | status=planned | parity_target=Route planning and extraction awareness | magic_counterpart=Field chart | acceptance_gate=Map shows relevant information without over-revealing | verification_mode=behavior_walkthrough | notes=Extraction UX dependency
- [ ] Inventory / vault parity | status=benchmark | parity_target=Dense two-pane storage and transfer UX | magic_counterpart=Field satchel + sanctum vault | acceptance_gate=Drag/drop, compare, stack logic and transfer shortcuts all function | verification_mode=behavior_walkthrough | notes=Current shell is only partial benchmark
- [ ] Vendor UI | status=planned | parity_target=Dense trade and compare interface | magic_counterpart=Spell Broker / Archivist UI | acceptance_gate=Buy/sell/compare/use flows support both KBM and controller | verification_mode=controller_walkthrough | notes=Parity-critical
- [ ] Sanctum modules UI | status=planned | parity_target=Build and upgrade management UI | magic_counterpart=Sanctum management screen | acceptance_gate=Modules can be viewed, built and upgraded without ambiguity | verification_mode=behavior_walkthrough | notes=Utility-first
- [ ] Compare overlays | status=planned | parity_target=Item choice informed by clear deltas | magic_counterpart=Spell / rune / robe / relic compare overlays | acceptance_gate=Relevant deltas render in every major equipment flow | verification_mode=visual_screenshot + behavior_walkthrough | notes=Consistent language across screens
- [ ] Context prompts and focus order | status=planned | parity_target=Context-sensitive interaction stays readable | magic_counterpart=Prompt layer + controller focus graph | acceptance_gate=Prompt switching and controller focus order are deterministic | verification_mode=controller_walkthrough | notes=Mandatory implementation-step rule ties here

## Phase 14 — Content Parity Blocks

- [ ] Spell family block | status=planned | parity_target=Enough offensive breadth to express parity | magic_counterpart=Projectile, beam, burst, cone, area, support families | acceptance_gate=Representative families exist with progression and economy hooks | verification_mode=parity_audit | notes=Do not chase full content count too early
- [ ] Catalyst family block | status=planned | parity_target=Ammo-equivalent variety exists | magic_counterpart=Powders, salts, reagents, infused charges | acceptance_gate=Multiple catalyst families meaningfully affect preparation and combat | verification_mode=parity_audit | notes=Supports vendor and loot loops
- [ ] Robe / relic / satchel block | status=planned | parity_target=Defense and carry gear breadth exists | magic_counterpart=Gear families by class and utility | acceptance_gate=Representative gear ladders exist across rarity and function | verification_mode=parity_audit | notes=Not every SKU required initially
- [ ] Enemy archetype block | status=planned | parity_target=Enough ecology variety to mirror reference tension | magic_counterpart=Beasts, humanoids, aberrants, elites, guardians, bosses | acceptance_gate=Representative archetypes cover melee, ranged, ambush, pack and elite roles | verification_mode=parity_audit | notes=Function coverage over raw count
- [ ] Surface map block | status=planned | parity_target=Representative map variety exists | magic_counterpart=`Map_Surface_01+` | acceptance_gate=Selected maps feel distinct in route logic, hazards and POIs | verification_mode=visual_screenshot + parity_audit | notes=Use content IDs until lore lock
- [ ] Dungeon archetype block | status=planned | parity_target=More than one underground pacing style exists | magic_counterpart=`Dungeon_01+` | acceptance_gate=Selected dungeons differ in traps, rooms or encounter identity | verification_mode=parity_audit | notes=Supports repeatability
- [ ] Boss archetype block | status=planned | parity_target=Special encounters cover different fight logics | magic_counterpart=`Boss_01+` | acceptance_gate=Selected bosses differ in phases, weaknesses and arena pressure | verification_mode=parity_audit | notes=No palette swaps sold as bosses
- [ ] Sanctum service block | status=planned | parity_target=Hub depth mirrors reference functionality | magic_counterpart=Spell Broker, Archivist, Rune Forge, Alchemy Bench, Relic Ward | acceptance_gate=Each selected service has distinct system purpose and UI flow | verification_mode=parity_audit | notes=Hub identity depends on this

## Phase 15 — Polish + Balance + Parity Audit

- [ ] Screenshot-based visual audits | status=planned | parity_target=Every major screen and environment stays readable | magic_counterpart=Structured visual review pass | acceptance_gate=Sanctum, surface, dungeon, boss and UI screenshots all pass readability review | verification_mode=visual_screenshot + parity_audit | notes=Step-by-step screenshots required throughout dev
- [ ] Behavior audits | status=planned | parity_target=Golden paths work end-to-end | magic_counterpart=Full-system behavior pass | acceptance_gate=All golden-path scenarios complete without manual workaround | verification_mode=parity_audit | notes=No “mostly works” gate
- [ ] Controller parity pass | status=planned | parity_target=Non-KBM users can complete the full loop | magic_counterpart=Controller-complete magical extraction loop | acceptance_gate=Prep, raid, loot, trade, dungeon, boss and return all work on controller | verification_mode=controller_walkthrough | notes=Mandatory parity gate
- [ ] Difficulty tuning | status=planned | parity_target=Risk and learning curve feel fair | magic_counterpart=Magical extraction difficulty pass | acceptance_gate=Difficulty envelope supports survival, dungeon and boss progression | verification_mode=parity_audit | notes=Includes resource scarcity pressure
- [ ] Extraction risk / reward tuning | status=planned | parity_target=Leaving, pushing deeper or overloading all feel meaningful | magic_counterpart=Extraction pressure tuning | acceptance_gate=Greed vs safety decisions remain live throughout progression | verification_mode=parity_audit | notes=Core emotional loop
- [ ] Dungeon pacing tuning | status=planned | parity_target=Dungeon-before-boss flow feels earned and tense | magic_counterpart=Underground pacing pass | acceptance_gate=Runs have clear setup, escalation, gate, pre-boss and payoff rhythm | verification_mode=parity_audit | notes=Chosen structure must justify itself
- [ ] Economy tuning | status=planned | parity_target=Loot, vendors, crafting and upgrades remain mutually supporting | magic_counterpart=Sanctum economy pass | acceptance_gate=Players are rarely trapped by dead economy and cannot trivialize progression too early | verification_mode=parity_audit | notes=Material sinks are key

## Golden-Path Scenarios

- `sanctum prep -> surface raid -> loot -> extract -> vendor -> spell upgrade`
- `surface raid -> dungeon entrance -> dungeon clear -> boss kill -> extract`
- `low mana + low catalysts + overloaded inventory -> risky extraction return`
- `quest accept -> dungeon objective -> turn-in -> faction change`

## Mandatory Parity Gates

- Spell purchase / equip / use must match weapon purchase / equip / use complexity by function.
- Rune socketing must match weapon-mod complexity by function.
- Dungeon-before-boss pacing must match underground-before-special-content pacing by function.
- Sanctum meta must match bunker meta depth by function.

## Mandatory Implementation-Step Verification

- Every noticeable implementation step gets a local run plus visual or behavioral check before the next step.
- Visual changes require screenshots.
- Interaction changes require direct input verification.
- A technically working but visually weak or behaviorally confusing step is not done.

## Appendix

- [ ] Workshop / modding support | status=out_of_scope | parity_target=Post-parity extension only | magic_counterpart=Modding appendix | acceptance_gate=Not required for parity-complete baseline | verification_mode=doc_review | notes=Do not pull this forward into core roadmap
