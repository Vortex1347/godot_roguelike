# 3D Bunker Benchmark Checklist

## Boot

- Проект стартует сразу в `3D bunker` сцене.
- `godot --headless --path . --quit` проходит без ошибок.
- `godot --path . --quit-after 1` не падает на старте.

## Camera And Readability

- Камера держит tilted-ortho обзор без сильной перспективной деформации.
- Игрок, stash, task board, trader counter и service corner различимы с первого взгляда.
- Центральный проход остается свободным и читаемым.

## Interaction

- `WASD` двигает персонажа по bunker hall.
- `E` на stash открывает inventory shell.
- `I` открывает и закрывает тот же inventory shell.
- Trader и task board дают статус-сообщения, но не ломают flow.

## Inventory Continuity

- Drag-and-drop между `stash` и `player inventory` продолжает работать.
- Invalid placement по-прежнему отклоняется.
- Session-local layout сохраняется при повторном открытии shell.

## Proxy Asset Hygiene

- Все replace-later bunker props идут через `assets/proxy/`.
- Для каждого proxy wrapper есть запись в `assets/proxy/PROXY_asset_registry.csv`.
- В active bunker scene нет прямых ссылок на безымянные внешние ассеты.
