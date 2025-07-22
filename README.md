# Elanthia Online Map Database

[![Release](https://img.shields.io/github/v/release/elanthia-online/mapdb)](https://github.com/elanthia-online/mapdb/releases)
[![CI](https://img.shields.io/github/actions/workflow/status/elanthia-online/mapdb/pr-validation.yml?branch=main&label=validation)](https://github.com/elanthia-online/mapdb/actions)
[![NPM](https://img.shields.io/npm/v/@elanthia/mapdb)](https://www.npmjs.com/package/@elanthia/mapdb)

Comprehensive database of game world locations for Elanthia Online, containing detailed room data for the MUD (Multi-User Dungeon) environment.

## Overview

This repository contains **35,224+ individual room files** organized by room ID, each providing detailed information about locations in the game world including descriptions, exits, travel times, and metadata.

## Repository Structure

```
gs/rooms/{id}/room.json    # Individual room files organized by room ID
mapdb.json                 # Consolidated database (generated, see releases)
package.json              # Build configuration
config/                   # Release automation config
.github/workflows/        # CI/CD automation
```

## Room Data Format

Each room is stored as a JSON file with the following structure:

```json
{
  "checksum": "hash_for_integrity",
  "room": {
    "id": 123,
    "title": ["Room Title"],
    "description": ["Detailed room description"],
    "paths": ["Obvious exits: north, south"],
    "location": "Area or Zone Name",
    "climate": "temperate",
    "terrain": "path",
    "wayto": { "124": "north", "122": "south" },
    "timeto": { "124": 0.2, "122": 0.2 },
    "uid": [13107402],
    "tags": ["indoor", "shop"],
    "image": "room123.png",
    "image_coords": [10, 20, 30, 40]
  }
}
```

## Getting Started

### Using the Published Data

Download the latest `mapdb.json` from [GitHub Releases](https://github.com/elanthia-online/mapdb/releases) or install via npm:

```bash
npm install @elanthia/mapdb
```

### Development Setup

```bash
# Clone the repository
git clone https://github.com/elanthia-online/mapdb.git
cd mapdb

# Install dependencies
bun install

# Build consolidated database
bun run build

# Validate the database
bun run validate
```

## Contributing

### Making Changes

1. **Fork and clone** the repository
2. **Create a feature branch** for your changes
3. **Modify room files** in `gs/rooms/{id}/room.json`
4. **Submit a pull request** with descriptive commit messages

### Automated Validation

All pull requests are automatically validated:
- **Individual file validation** - Each changed room file is validated for structure and data integrity
- **Full build validation** - Complete database is built and validated to ensure no regressions
- **Detailed feedback** - Validation results are posted as PR comments with specific error details

### Commit Message Format

Use [Conventional Commits](https://conventionalcommits.org/):

```
feat: add new room data for Crystal Caverns
fix: correct wayto directions for room 12345
docs: update contributing guidelines
```

## Build System

The repository uses [`@elanthia/cartographer`](https://github.com/elanthia-online/cartographer) for data processing:

- **`bun run build`** - Reconstructs `mapdb.json` from individual room files
- **`bun run validate`** - Validates the generated database for consistency and correctness

## Automation

### CI/CD Pipeline

- **PR Validation** - Validates room file changes automatically
- **Semantic PR** - Enforces conventional commit messages
- **Release Please** - Automated versioning and releases
- **Asset Generation** - Built `mapdb.json` attached to GitHub releases

### Release Process

Releases are automated using [release-please](https://github.com/googleapis/release-please):

1. **Conventional commits** to main branch trigger release preparation
2. **Release PR** is created automatically with version bumps and changelog
3. **When merged** - GitHub release is created with built `mapdb.json` asset

## Data Quality

- **35,224+ rooms** validated and maintained
- **Checksum verification** ensures data integrity
- **Automated testing** prevents regressions
- **Structured validation** using Zod schemas
- **Consistent formatting** enforced through tooling

## API Reference

### Room Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | `number` | Unique room identifier |
| `title` | `string[]` | Room title(s), may have variants |
| `description` | `string[]` | Room description(s), may have day/night variants |
| `paths` | `string[]` | Available movement options |
| `location` | `string` | Area or zone name |
| `climate` | `string` | Environmental climate type |
| `terrain` | `string` | Ground/terrain type |
| `wayto` | `object` | Exit mappings (room_id: direction) |
| `timeto` | `object` | Travel times (room_id: seconds) |
| `uid` | `number[]` | Backend unique identifiers |
| `tags` | `string[]` | Categorical tags |
| `image` | `string` | Associated image filename |
| `image_coords` | `number[]` | Image coordinate bounds |

## License

MIT License - see [LICENSE](LICENSE) for details.

## Links

- **GitHub Repository**: https://github.com/elanthia-online/mapdb
- **NPM Package**: https://www.npmjs.com/package/@elanthia/mapdb
- **Cartographer Tool**: https://github.com/elanthia-online/cartographer
- **Latest Release**: https://github.com/elanthia-online/mapdb/releases/latest
