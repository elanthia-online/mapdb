# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **mapdb** repository for Elanthia Online, containing a comprehensive database of game world locations. The repository stores room data for what appears to be a MUD (Multi-User Dungeon) or similar text-based game environment.

## Repository Structure

The repository follows a simple but extensive data structure:

- **`gs/rooms/{id}/room.json`** - Individual room files organized by room ID (35,224+ rooms)
- **Root files**:
  - `README.md` - Basic project description
  - `.gitignore` - Contains `mapdb.json` (likely a consolidated database file)
  - `.vscode/settings.json` - VS Code configuration with git ignore limit warning disabled

## Data Format

Each room is stored as a JSON file with the following structure:

```json
{
  "checksum": "hash",
  "room": {
    "id": number,
    "title": ["Room Title"],
    "description": ["Room description text"],
    "paths": ["Movement options"],
    "location": "Area name",
    "wayto": { "exit_id": "direction" },
    "timeto": { "exit_id": time_value },
    "uid": [unique_identifier]
  }
}
```

## Working with the Database

### Room Data Access
- Room files are organized numerically by ID in individual directories
- Each room has a unique checksum for data integrity
- Room descriptions may have multiple variants (day/night or conditional text)
- Navigation is handled through `wayto` (directions) and `timeto` (travel time) mappings

### Large Dataset Considerations
- The repository contains 35,224+ room files
- VS Code git ignore limit warning is disabled due to repository size
- Consider using specific room ID ranges when searching or modifying data
- The `.gitignore` excludes `mapdb.json` (likely a compiled/consolidated version)

## Common Operations

### Finding Specific Rooms
Use room ID to locate files: `gs/rooms/{id}/room.json`

### Searching Room Content
Use grep or similar tools to search across room descriptions, titles, or locations:
```bash
grep -r "specific location" gs/rooms/*/room.json
```

### Data Validation
Each room file includes a checksum field for data integrity verification.

## Build System

The repository now includes a Node.js/Bun-based build system for generating releases:

### Commands
- **`bun run build`** - Reconstructs `mapdb.json` from room files using `@elanthia/cartographer`
- **`bun run validate`** - Validates the generated `mapdb.json` file

### Release Process
- Uses **release-please** for semantic versioning and automated releases
- GitHub Actions workflow automatically builds and publishes `mapdb.json` on releases
- Releases are triggered by conventional commits to the main branch

### Dependencies
- **`@elanthia/cartographer`** - CLI tool for mapdb operations (reconstruct, validate)
- **Bun** - Runtime and package manager

## Development Notes

- Repository contains 35,224+ individual room JSON files
- VS Code git ignore limit warning is disabled due to repository size
- The repository uses semantic versioning via release-please
- Large file count may require patience when performing repository-wide operations
- Generated `mapdb.json` is excluded from git but included in releases