# Product North Star

## Миссия

Собрать на `Godot 4 + GDScript` одиночную top-down extraction shooter игру, максимально близкую по ощущениям к `ZERO Sievert`, но с полностью заново созданными ассетами, картами и интерфейсными элементами.

## Baseline

- Референсный baseline: публично доступная live-версия `ZERO Sievert` на `17 марта 2026 года`.
- Базовые системы по публичному описанию: procedural raids, bunker loop, weapon modification, hunter/weapon progression, factions, quests, loot economy, base upgrades, поздний слой modding/workshop.

## Product Pillars

1. Extraction tension: каждая вылазка должна ощущаться рискованной, ценной и коротко-читаемой.
2. Tactical readability: игрок всегда быстро понимает, где опасность, лут, выход, состояние персонажа и что происходит в бою.
3. Systems depth without code chaos: глубина строится через data-driven модели и сервисы, а не через монолитные сцены.
4. Early visual contract: визуальный язык закладывается в каждом milestone сразу, а не переносится на финальный polish.

## Первый исполнимый milestone

Вертикальный срез:

- bunker hub
- один raid-map slice
- movement / aim / fire / reload / damage / death / extract
- контейнерный лут
- stash/inventory shell
- один trader flow
- один quest stub
- save/load
- final-scale placeholders и UI shell, близкие по плотности к референсу

## Non-goals bootstrap-этапа

- Не делать полный gameplay baseline до фикса visual foundation.
- Не подключать addon'ы без отдельного выбора.
- Не проектировать сразу все шесть карт и весь поздний контент.

