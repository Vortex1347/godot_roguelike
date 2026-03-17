# Decision Log

## 2026-03-17

### Baseline

- Референсный продукт: live-версия `ZERO Sievert` по публичным материалам Steam на `17 марта 2026 года`.
- Цель: почти `1:1` по ощущениям, pacing, visual density и логике систем, без прямого копирования ассетов.

### Tech stack

- Движок: `Godot 4`
- Язык: `GDScript`
- Базовый target: desktop `1920x1080`, `16:9`, keyboard/mouse first

### Process

- Первый execution-pass ограничен bootstrap-слоем без gameplay.
- После каждого meaningful task обновлять документы и Serena memory.
- Новые addon'ы и внешние зависимости не добавлять молча, несмотря на общую открытость к готовым решениям.
- Guardrail-skills вынесены в локальные Codex skills и продублированы в `AGENTS.md`.

### Architecture

- Feature-first layout обязателен.
- `Resource`-модели, `Service`-классы и минимальный autoload footprint выбраны как базовый архитектурный шаблон.
