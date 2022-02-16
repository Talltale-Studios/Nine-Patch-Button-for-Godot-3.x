# Nine-Patch-Button-for-Godot-3.x

## What is the NinePatchButton?
A new type of node that combines the features of the NinePatchRect, the Button and the TextureButton, with the NinePatchRect being used as the base. We also took the liberty to add a custom sound system to the NinePatchButton, which allows you to assign sounds for pressing it, hovering over it, attempting to press it while it is disabled, and focusing it.

*Note: We've been having issues with getting text to display correctly on the NinePatchButton, so we've had to disable that feature for now. We'll revisit this at a later time. For now you could use a Label (or something similar) and add text to the button manually. If you can manage to integrate the text you want to display into the button's texture then that could work as well.*

## Why did we make it?
The Texture Button stretches the custom textures you add to it, which is especially annoying when using pixel art. The NinePatchRect doesn't have this issue, so the sensible thing to do would be to use the NinePatchRect's method to add custom textures to our buttons instead, so we combined the features of the NinePatchRect with those of the Button. The TextureButton still had some good features though, so we added some of them into the mix as well, along with a our custom sound system.

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
- Add [Conditional Export Properties](http://kehomsforge.com/tutorials/single/gdConditionalProperty)? It could be used for giving the option between using Texture Button-esque button texturing and NinePatchRect-esque button texturing without clogging up the Inspector.
- Add exported properties to custom property groups.

## Changelog:
### v2.0.0
- Initial public release of the plugin on the [Asset Library](https://godotengine.org/asset-library) as well as the setup of the GitHub repository and everything else that goes with those two things.

### v1.3.0
- Added a new custom `Focused Sound` property, based on the Texture Button's `Focused Texture` property.
- Added the `Focused Texture` property from the Texture Button.
- Added the `Action Mode` property from the Button.
- Fixed a typo in one of the properties.
- Removed the deprecated `Enabled Focus Mode` property from the Button (according to its own tooltip it is deprecated and scheduled for removal in Godot 4 anyways).
- Cleaned up the plugin's code.

### v1.2.1
- Fixed a bug.

### v1.2.0
- Added `tool` to the plugin's scripts to allow it to run in the editor.
- Removed the now-redundant `NinePatchButton.tscn`.

### v1.1.0
- Fixed a bug.
- Changed the names of the plugin's scripts.
- Cleaned up the plugin's code.

### v1.0.1
- Added a custom icon for the plugin.

### v1.0.0
- Initial private release of the plugin for in-house testing and development.
