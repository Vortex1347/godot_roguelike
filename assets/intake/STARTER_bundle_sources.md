# Free Starter Bundle Sources

Ниже фиксируется стартовый бесплатный набор для `mage sanctum + dungeon before boss`, который можно скачать и положить в `assets/intake/raw/`.

## Sanctum / Dungeon Environment

- Preferred structural kit:
  - [Quaternius Modular Dungeon Pack](https://quaternius.com/packs/medievaldungeon.html)
  - drop target: `assets/intake/raw/environment_sanctum/`
- Ritual props and archive clutter:
  - [Quaternius RPG Pack](https://quaternius.com/packs/rpg.html)
  - drop target: `assets/intake/raw/environment_sanctum/`
- Reserve surface / fantasy exterior source:
  - [Kenney Assets Catalog](https://www.kenney.nl/assets)
  - drop target: `assets/intake/raw/environment_sanctum/`
- Reserve index for additional free packs:
  - [Quaternius Free Assets Index](https://quaternius.com/index.html)
  - drop target: `assets/intake/raw/environment_sanctum/`

## Mage / Humanoid Character

- Preferred base:
  - [Kay Lousberg Adventurers](https://kaylousberg.com/game-assets/characters-adventurers)
  - drop target: `assets/intake/raw/character_mage/`
- Alternate base:
  - [Quaternius Universal Base Characters](https://quaternius.com/packs/universalbasecharacters.html)
  - drop target: `assets/intake/raw/character_mage/`

## Humanoid Animations

- Animation library:
  - [Quaternius Universal Animation Library](https://quaternius.itch.io/universal-animation-library)
  - drop target: `assets/intake/raw/animations_humanoid/`
- Alternate animation source:
  - [Kay Lousberg Character Animations](https://kaylousberg.com/game-assets/character-animations)
  - drop target: `assets/intake/raw/animations_humanoid/`

## Focus Props + Magical VFX

- Focus props:
  - [Quaternius RPG Pack](https://quaternius.com/packs/rpg.html)
  - drop target: `assets/intake/raw/focus_props/`
- Projectile VFX starter:
  - [Magic Projectiles VFX - Godot 3D by Binbun](https://binbun3d.itch.io/magic-projectiles-vfx)
  - drop target: `assets/intake/raw/magic_vfx/`
- Reserve elemental / tornado VFX:
  - [Tornado VFX 3D - Godot by soygus](https://soygus.itch.io/tornado-vfx-godot)
  - drop target: `assets/intake/raw/magic_vfx/`

## Notes

- На момент фикса этого документа страницы паков открывались нормально, но прямые архивные ссылки не торчали в простом HTML; если сайт не дает прямой download URL для автоматического скачивания, архивы лучше скачать вручную и просто положить в `assets/intake/raw/`.
- Базовый формат проекта для дальнейшей работы: `GLB`.
- Все эти паки считаются `replace-later proxy`-источниками; активные сцены должны ссылаться только на wrapper layer из `assets/proxy/`.
