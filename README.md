# Nine-Patch-Button-for-Godot-3.x

## What is the NinePatchButton?
A new type of node that combines the features of the NinePatchRect, the Button and the TextureButton, with the NinePatchRect being used as the base. We also took the liberty to add a built-in sound system to the NinePatchButton, which allows you to assign sounds for pressing it, hovering over it, attempting to press it while it is disabled, and focusing it.

*Note: We've been having issues with getting text to display correctly on the NinePatchButton, so we've had to disable that feature for now. We will revisit this at a later time. For now you can use a Label (or something similar) and add text to the button manually. If you can manage to integrate the text into the button's texture then that can work as well.*

## Why did we make it?

The reason I made it, is because the normal Button, if you add pixel textures, it will stretch the texture. NinePatchRect nodes, doesn't have this issue. So I devised a plan, and made the NinePatchButton! It works as expected. It took me a while to get it to work, so I'm happy with it's condition.

## How to use it
Place your desired texture into the `Texture` property of the NinePatchRect's 

Place your corresponding textures and sound files in the exported variable's box, in the inspector tab. Adjust your texture region like you would with the normal NinePatchRect. After that, it should work like a normal button, but with better textures and sound effects.

If you experience any bugs or want to give a suggestion please feel free to open an Issue here on the plugin's Github page.

## Future plans
- Fix the text display issue.
- Add the `Click Mask` property from the Texture Button to enable the user to set up more fitting click masks.
- Add the `Flip H` property from the Texture Button, renamed to `Texture Flip H` for clarity.
- Add the `Flip V` property from the Texture Button, renamed to `Texture Flip V` for clarity.
- Add Texture Button-esque button texturing? It might not work... but it could be useful to have that as an alternative to the already-implemented NinePatchRect-esque button texturing.
- Add [Conditional Export Properties](http://kehomsforge.com/tutorials/single/gdConditionalProperty)? It could be used for giving the option between using Texture Button-esque button texturing and NinePatchRect-esque nutton texturing without clogging up the Inspector.

## Changelog:
### v1.4.0
- Initial public release of the plugin on the [Asset Library](https://godotengine.org/asset-library) for Godot version 3.x

### v1.3.0
- Added all exported Script Variables to custom property groups
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
