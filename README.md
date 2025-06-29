> [!CRITICAL]
> DELTAModKit is in **active development.** There are many known visual bugs present and I'm aware of certain things (such as the main characters' attack, defense and magic values not being accurate to the real game's chapters). If you find any issues, you can help out by creating an issue or opening a pull request.

# DELTAModKit
The most robust, feature-complete DELTARUNE GameMaker Studio 2 decompilation / port, enhanced with a multitude of tweaks designed to make the game easier to mod.

> [!CAUTION]
> This project does NOT allow for piracy of DELTARUNE Chapter 3 and 4. It is simply a base from which you can start building your own DELTARUNE chapter/fangame. Most assets which have been included in the project can be found in the free Steam demo for Chapter 1 and 2.

## Usage
To start playing around with DELTAModKit, you have to download [GameMaker](https://gamemaker.io/en/download). The project uses the latest **BETA** version `Beta v2024.1400.0.838`. It will not work on non-Beta versions.

1. Clone the repository onto your PC.
2. Create a `datafiles` folder at the root of the project.
3. Download [8bitoperator JVE](https://fonts2u.com/8bitoperator-jve-regular.font), place it in `datafiles/8bitoperator_jve.ttf`.
4. Copy the `mus` folder from your Steam DELTARUNE installation into `datafiles/mus`.
5. Open the project in GameMaker.

## Adding / Changing Modular Stuff
The hearts of my modular reimplementations of the character, item, spell and equipment systems all live in the folder `Custom > Scripts > Configs`. I tried naming everything in an easy-to-understand way, but feel free to reach out if you encounter any issues. Provided in the `Custom > Objects` folder is an example cutscene for working with the Cutscene System and some helper markers to assist with character placement in cutscenes

> [!WARNING]
> This project is based on DELTARUNE Chapter 3, meaning many Chapter 4 things such as items, armors, weapons and key items are missing. I am already looking into backporting these items in a future update.

## Attribution
All sprites and most code contained in this repository was created by Toby Fox and Royal Sciences LLC.