# Crafting Console - Drakkenheim

A FoundryVTT Module to add Monsters of Drakkenheim recipes to the Crafting Console module. Requires Monsters of Drakkenheim module.

Bring the danger and wonder of Drakkenheim straight into your crafting workflow.

This module includes all recipes and ingredients found in the Monsters of Drakkenheim book.
A macro can be used to generate ingredients on the fly:
- The macro attempts to parse the biography for known ingredients.
- Once parsed (or manually configured), the macro creates the ingredients on the creature's token.

The ingredients created are all polished, contain summarized information to describe what it is and how it was generated.
Each ingredient has a family custom icon from https://game-icons.net/

## Suggested Workflow

1. Select a creature's token that includes harvestable component information. 
2. Run the **Generate Ingredients For Token** macro.
3. If no information is found in the token's biography, you can still configure which items get created.
4. Confirm your component selections and rarity.
5. Review the result window for errors, if any, and report them to me on github.
6. The items will be created in the token's inventory. Drag them to your players depending on what they actually gathered.
7. The players can now craft Crafting Console recipes that were taught to them, or any Basic recipes, like a Healing Potion from the SRD.
8. To teach your player's recipes, drag-n-drop the recipes on their character sheet.
9. You can see a player's taught recipes in the top-right kebab menu.

## Screenshots

### 1) Macro Prompt UI
![Crafting Macro](<screenshots/Crafting Macro.png>)

### 2) Macro Result
![Crafting Macro Result](<screenshots/Crafting Macro Result.png>)

### 3) Token Inventory
![Token Inventory](<screenshots/token inventory.png>)

### 4) List of Recipes in Compendium
![List of Recipes in Compendium](<screenshots/List of Recipes in Compendium.png>)

### 5) List of Recipes in Compendium
![List of Recipes in Recipe Registry](<screenshots/List of Recipes in the Recipe Registry.png>)

### 6) How the recipes look in Crafting Console
![Recipe Example](<screenshots/Recipe example.png>)

### 7) How the recipes look in Crafting Console
![Recipe Example](<screenshots/Recipe example.png>)

### 8) Having the compendium automatically expands the Crafting Console recipe list
![Crafting Console Recipe List](<screenshots/Recipe Registry With SRD Recipes.png>)