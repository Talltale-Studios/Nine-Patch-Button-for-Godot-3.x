# Nine Patch Button for Godot 3.x


## What Is This?
This plugin adds a new type of node that combines the features of the NinePatchRect, the Button, and the TextureButton, with the NinePatchRect being used as the base. We also took the liberty to add a custom sound system to the NinePatchButton, which allows you to assign sounds for pressing it, hovering over it, attempting to press it while it is disabled, and focusing it.

*Note: We've been having issues with getting text to display correctly on the NinePatchButton, so we've had to disable that feature for now. We'll revisit this at a later time. For now you could use a Label (or something similar) and add text to the button manually. If you can manage to integrate the text you want to display into the button's texture then that could work as well.*


## Why Did We Make This?
The Texture Button stretches the custom textures you add to it, which is especially noticable when trying to use pixel art. The NinePatchRect doesn't have this issue, so the sensible thing to do would be to use the NinePatchRect's method to add custom textures to our buttons instead, so we combined the features of the NinePatchRect with those of the Button. The TextureButton still had some good features though, so we added some of them into the mix as well, along with a our custom sound system.


## Usage Guide
Once the plugin is downloaded, installed and enabled, you can add a new NinePatchButton node to your scene and it can be used in the place of a normal Button or TextureButton.

To get started you must first set up the `TextureRegion` at the `NinePatchRect/Texture` property just like you would do with a NinePatchRect. Once that is done you can start adding the textures at `Normal Texture`, `Pressed Texture`, `Hovered Texture`, `Disabled Texture` and `Focused Texture`, just like you would do with a Texture Button. The rest of the settings work more or less just like you'd expect with any BaseButton, except for the new sound system which we added.

Just like how the Texture Button-esque properties would change the texture of the button depending on whether it is being pressed, hovered, focused and so on, the new `Pressed Sound`, `Hovered Sound`, `Disabled Sound`, and `Focused Sound` properties cause the sounds you assigned to those properties to be played.


## Got Any Feedback?
If you have any feedback, be it a bug report, a complaint, a suggestion or a request, feel free to open an issue on GitHub. All we ask is that you try to label your issue suitably with the provided labels and that you try to prevent posting an issue about a topic that an issue already exists for. If an issue on that topic already exists, instead add on to that issue with a comment of your own.

We appreciate any kind of constructive feedback you can give us as it is important for us to know if something isn't working as expected or if you have any suggestions for us on how to improve the plugin.


## Future Plans
- Fix the NinePatchButton not changing to its `Normal Texture` if the user presses and holds the button down and then moves the mouse cursor off the button (like the base Button does).
- Fix the text display issue and add any related properties.
- Add the `Click Mask` property from the Texture Button to enable the user to set up their own click masks to fit their custom textures for the button.
- Add the `Flip H` property from the Texture Button, renamed to `Texture Flip H` for clarity.
- Add the `Flip V` property from the Texture Button, renamed to `Texture Flip V` for clarity.
- Clamp the minimum size of the NinePatchButton's textures to that of its button? The button can only be made smaller up to a certain point (this is normal), but currently the textures can be made even smaller.
- Add the button texturing method from the Texture Button? It could be useful to have as an alternative to the already-implemented NinePatchRect button texturing method. Since you'd then have both button texturing methods, and not just the NinePatchRect's, this might also call for a name change for the plugin?
- Add [Conditional Export Properties](http://kehomsforge.com/tutorials/single/gdConditionalProperty)? It could be used for giving the option between using Texture Button-esque button texturing and NinePatchRect-esque button texturing without clogging up the Inspector. It would help make it more user-friendly, but would hugely increase the length of the plugin's script.
- Add exported properties to custom property groups? It would help make it more user-friendly and somewhat declog the Inspector, but would also increase the length of the plugin's script.
- Port the plugin to Godot 4, complete with a separate Asset Library page and GitHub repository. Links to the ported Godot 4 version of the plugin will be provided here on GitHub and on the Asset Library.


## Changelog:
### v2.0.0
- Initial public release of the plugin on the [Godot Asset Library](https://godotengine.org/asset-library) as well as the setup of the GitHub repository and everything else that goes with it.

### v1.3.0
- Added the `Action Mode` property that originated from the Button.
- Added the `Focused Texture` property that originated from the Texture Button.
- Added a new custom `Focused Sound` property, based on the Texture Button's `Focused Texture` property.
- Fixed several bugs.
- Fixed the default values of some properties that were mistakenly left undefined.
- Fixed a typo in the name of one of the properties.
- Changed the name of the NinePatchButton's icon image from `Icon.png` to `NinePatchButton.png` and its Import Preset from `Default` to `2D Pixel`.
- Removed the deprecated `Enabled Focus Mode` property that originated from the Button. It has been superceded by the Control node's own `Focus Mode` property, and is scheduled for removal in Godot 4.
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
