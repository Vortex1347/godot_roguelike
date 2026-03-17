# Bootstrap Acceptance Checklist

## Sanity

- Проект открывается через `godot --path .`
- Headless проверка `godot --headless --path . --quit` завершается без критических ошибок
- Стартовая сцена показывает bootstrap panel, а не пустое окно

## Docs

- `AGENTS.md` совпадает с текущими правилами работы агента
- `docs/vision/product_north_star.md` отражает текущий milestone
- `docs/vision/visual_bible.md` отражает текущий visual contract
- `docs/reference/zero_sievert_feature_matrix.md` не противоречит baseline
- `docs/architecture/project_architecture.md` совпадает с реальной структурой проекта

## Process

- После завершения задачи обновлены `task_log.md` и `decision_log.md`
- Serena memory синхронизирована с текущим bootstrap-state

