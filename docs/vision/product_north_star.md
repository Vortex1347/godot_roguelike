# Product North Star

## Миссия

Собрать на `Godot 4 + GDScript` одиночную `3D top-down extraction` игру, вдохновленную `ZERO Sievert`, но с собственным визуальным языком, заново созданными ассетами и production-safe proxy pipeline.

## Baseline

- Публичный mood/reference baseline: live-версия `ZERO Sievert` на `17 марта 2026 года`.
- Активный продуктовый baseline проекта: `3D`, `tilted orthographic camera`, `gritty low-poly`, desktop-first, single-player extraction loop.
- `ZERO Sievert` теперь используется как ориентир по extraction mood, UI density и tactical readability, а не как обязательный `1:1` visual contract.

## Product Pillars

1. Extraction tension: каждая вылазка должна ощущаться рискованной, ценной и коротко-читаемой.
2. Tactical readability: игрок всегда быстро понимает, где опасность, лут, выход, состояние персонажа и что происходит в бою даже в `3D top-down` кадре.
3. Systems depth without code chaos: глубина строится через data-driven модели и сервисы, а не через монолитные сцены.
4. Early visual contract: визуальный язык и asset replacement pipeline закладываются в каждом milestone сразу, а не переносятся на финальный polish.

## Первый исполнимый milestone

Текущий исполнимый milestone:

- bunker hub
- tilted-ortho camera
- movement + bunker hotspots
- stash/inventory shell поверх `3D`-сцены
- gritty low-poly blockout
- proxy-asset registry и replace-later workflow
- station lighting / fog / silhouette readability benchmark

## Non-goals bootstrap-этапа

- Не делать полный gameplay baseline до фикса `3D visual foundation`.
- Не подключать addon'ы без отдельного выбора.
- Не проектировать сразу outdoor slice, бой, AI и поздний контент.
