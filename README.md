# Nine-Patch-Button-for-Godot-3.x
A new type of node that combines the features of the NinePatchRect, the Button and the TextureButton. We also took the liberty to add a built-in sound system to the NinePatchButton, which allows you to assign sounds for pressing it, hovering over it, attempting to press it while it is disabled, and focusing it.

*Note: As we've been having issues with getting text to display correctly on the NinePatchButton we've had to disable that feature for now. We will revisit this at a later time.*

A normal Button node often stretches your custom textures, especially if they are pixel art. This plugin adds a new aptly named NinePatchButton node that allows you to use a NinePatchRect's method of adding implementing a texture alongside the usual functions of the Button.

The reason I made it, is because the normal Button, if you add pixel textures, it will stretch the texture. NinePatchRect nodes, doesn't have this issue. So I devised a plan, and made the NinePatchButton! It works as expected. It took me a while to get it to work, so I'm happy with it's condition.

## Usage:
Place your desired texture into the `Texture` property of the NinePatchRect's 

Place your corresponding textures and sound files in the exported variable's box, in the inspector tab. Adjust your texture region like you would with the normal NinePatchRect. After that, it should work like a normal button, but with better textures and sound effects.

If you experience any bugs or want to give a suggestion please feel free to open an Issue here on the plugin's Github page.

## Changelog:
### v1.4.0
- Initial public release of the plugin on the [Asset Library](https://godotengine.org/asset-library) for Godot version 3.x

### v1.3.0
- Added all exported script variables to custom property groups befitting of their functions and/or origins
- Added a new custom `Focused Sound` property
- Added the `Focused Texture` property from the Texture Button
- Added the `Action Mode` property from the Button
- Fixed a typo in one of the properties
- Removed the deprecated `Enabled Focus Mode` property from the Button (according to its own tooltip it is deprecated and scheduled for removal in Godot 4 anyways)
- Cleaned up the plugin's code

### v1.2.1
- Fixed a bug.

### v1.2.0
- Made the plugin use `tool`
- Removed the now-redundant `NinePatchButton.tscn`

### v1.1.0
- Fixed a bug
- Renamed the plugin's scripts
- Cleaned up the plugin's code

### v1.0.1
- Added a custom icon for the plugin

### v1.0.0
- Initial private release of the plugin for in-house testing and development for Godot 3.x
