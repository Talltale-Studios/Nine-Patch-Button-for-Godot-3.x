# Nine Patch Button for Godot 3.x


## What Is This?
This plugin adds a new type of node that combines the features of the NinePatchRect, the Button, and the TextureButton, with the NinePatchRect being used as the base. We also took the liberty to add a custom sound system to the NinePatchButton, which allows you to assign sounds for some of its functions such as pressing it or hovering over it with your mouse cursor.

*Note: We've been having issues with getting text to display correctly on the NinePatchButton, so we've had to disable that feature for now while we're working on a fix for it. For now, you could use a Label (or something similar) and add text to the button manually. If you can manage to integrate the text you want to display into the button's texture then that could work as well.*


## Why Did We Make This?
The Texture Button stretches the custom textures you add to it, which is especially noticeable when trying to use pixel art. Luckily the NinePatchRect doesn't have this issue, so to use the NinePatchRect's method to add custom textures to our buttons instead, we combined the features of the NinePatchRect with those of the Button into a new custom node. The TextureButton still had some good features though, so we added some of them into the mix as well. And while we were at it we also added a custom sound system, which allows you to add various sounds to the button. Have a look at this comparison image:

![NinePatchButton versus TextureButton](https://github.com/Jurubu-Entertainment/Nine-Patch-Button-for-Godot-3.x/blob/master/Media/NPB_vs_TB.PNG "NinePatchButton versus TextureButton")


## Setup Guide

### Download and Installation
For a detailed guide on using the Godot Asset Library, both the web version and the Godot Editor's version, please see [this](https://docs.godotengine.org/en/latest/community/asset_library/using_assetlib.html).

### NinePatchButton Setup
Once the plugin is downloaded, installed, and enabled, you can add a new NinePatchButton node to one of your project's scenes.

To get started you must first set load your chosen `Normal Texture` (the texture to display by default, when the button is not in the disabled, focused, hovered, or pressed state) into `Script Variables/Normal Texture` in the `Inspector` and then head to `TextureRegion` in the `Bottom Panel` and set it up like you would with a NinePatchRect. Once that is done you can start adding the rest of the textures of your choice for the NinePatchButton. The rest of the settings work more or less just like you'd expect by looking at their names or by looking at how they worked with the Button, the Texture Button and the NinePatchRect. Nevertheless, all the properties of the NinePatchButton are explained in detail below.


## Properties Guide

### Script Variables
- **Normal Texture** - Texture to display by default, when the button is not in the disabled, focused, hovered, or pressed state.
- **Hovered Texture** - Texture to display when the mouse hovers over the button.
- **Focused Texture** - Texture to display when the button has mouse or keyboard focus.
- **Pressed Texture** - Texture to display when the button has been, or is being, pressed down.
- **Pressed Hovered Texture** - Texture to display when the button has been, or is being, pressed down in conjunction with the mouse hovering over it.
- **Pressed Hovered Texture** - Texture to display when the button has been, or is being, pressed down in conjunction with it having mouse or keyboard focus.
- **Disabled Texture** - Texture to display when the button is disabled.
- **Disabled Hovered Texture** - Texture to display when the button is disabled in conjunction with the mouse hovering over it.
- **Disabled Focused Texture** - Texture to display when the button is disabled in conjunction with it having mouse or keyboard focus.
- **Hover Sound** - Sound to play when the mouse hovers over the button.
- **Focus Sound** - Sound to play when the button gains mouse or keyboard focus.
- **Pressed Sound** - Sound to play when the button has been pressed down.
- **Pressed Released Sound** - Sound to play when the button has been released after having been pressed down.
- **Pressed Hovered Sound** - Sound to play when the button has been, or is being, pressed down in conjunction with the mouse hovering over it.
- **Pressed Focused Sound** - Sound to play when the button has been, or is being, pressed down in conjunction with it having mouse or keyboard focus.
- **Disabled Pressed Sound** - Sound to play when the button is disabled and the user attempts to press it.
- **Disabled Hovered Sound** - Sound to play when the button is disabled in conjunction with the mouse hovering over it.
- **Disabled Focused Sound** - Sound to play when the button is disabled in conjunction with it having mouse or keyboard focus.
- **Disabled** - If *true*, the button is in the disabled state and can't be pressed or toggled.
- **Toggle Mode** - If *true*, the button is in the toggle mode. Makes the button flip state between pressed and unpressed each time it is clicked. If *false* then the button will only remain pressed as long as the button is being pressed down by holding the input down, and will revert to the non-pressed state as soon as the input is released.
- **Shortcut In Tooltip** - If *true*, the button will add information about its shortcut in the tooltip.
- **Pressed** - If *true*, the button is in the pressed state. Means the button is pressed down or toggled. *Note: The original button's tooltip explicitly states that the pressed state only works if the `Toggle Mode` property is true, so this should be investigated.*
- **Action Mode** - Determines when the button is considered clicked.
- **Button Mask** - Binary mark to choose which mouse buttons this button will respond to.
- **Enabled Focus Mode** - We removed this property because its tooltip states that it is deprecated and that `Control/Focus/Mode` should be used instead.
- **Keep Pressed Outside** - If *true*, the button stays pressed when moving the cursor outside the button while pressing it. *Note: Currently this does nothing as the button currently stays pressed when moving the cursor outside the button while pressing regardless of whether or not this property is actually true. A fix is in the works.*
- **Shortcut** - [ShortCut](https://docs.godotengine.org/en/stable/classes/class_shortcut.html) associated with the button.
- **Button Group** - [ButtonGroup](https://docs.godotengine.org/en/stable/classes/class_buttongroup.html) associated with the button.

### NinePatchRect
- **Texture** - This property is controlled by the `Normal Texture` property, which will automatically load its texture into here.
- **Draw Center** - If *true*, draw the button's center texture (which is set up with `TextureRegion`). Else, only draw the 9-slice's borders.
- **Region Rect** - Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, the NinePatchButton will use the whole texture. *Note: This property is untested.*

#### Patch Margin
- **Left** - The width of the 9-slide's left column. A margin of 16 means the 9-slice's left corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
- **Top** - The height of the 9-slide's left column. A margin of 16 means the 9-slice's top corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
- **Right** - The width of the 9-slide's left column. A margin of 16 means the 9-slice's right corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.The width of the 9-slide's left column. A margin of 16 means the 9-slice's left corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
- **Bottom** - The height of the 9-slide's left column. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.

#### Axis Stretch
`Horizontal` stretches or tiles the center texture horizontally, and `Vertical` stretches or tiles the center texture vertically. As for their settings:
- **Stretch** - Stretches the center texture across the NinePatchButton. This may cause the texture to be distorted.
- **Tile** - Repeats the center texture across the NinePatchButton. This won't cause any visible distortion. The texture must be seamless for this to work without displaying artifacts between edges. *Note: Only supported when using the GLES3 renderer. When using the GLES2 renderer, this will behave like Stretch.*
- **Tile Fit** - Repeats the center texture across the NinePatchButton, but will also stretch the texture to make sure each tile is visible in full. This may cause the texture to be distorted, but less than Stretch. The texture must be seamless for this to work without displaying artifacts between edges. *Note: Only supported when using the GLES3 renderer. When using the GLES2 renderer, this will behave like Stretch.*


## Got Any Feedback?
If you have any feedback, be it a bug report, a suggestion or a feature request, feel free to [open an Issue](https://github.com/Jurubu-Entertainment/Nine-Patch-Button-for-Godot-3.x/issues) on GitHub. All we ask is that you try to label your issue suitably with the provided labels and that you try to prevent posting an issue about a topic that an issue already exists for. If an issue on that topic already exists, instead add on to that issue with a comment of your own. We appreciate any kind of constructive feedback you can give us.


## Links
- The plugin's Asset Library web page: https://godotengine.org/asset-library/asset/1243


## Future Plans
- Create a larger icon (with a minimum size of 64x64, 128x128, or 256x256) for use as the icon for the plugin on the Asset Library and for the plugin's demo project.
- Fix the button not cancelling the button press by default when moving the mouse cursor outside the button while it is still being pressed down. Currently the button acts as though the `Keep Pressed Outside` property is set to true at all times. That property is currently useless until this is fixed.
- Fix the text display issue and add any related properties.
- Add an (optional) Demo Project to the plugin's root folder which the user can install to take a closer look at the plugin's inner functions, as well as examples of how to use the NinePatchButton.
- Add the ability to change the volumes of the sounds assigned to the NinePatchButton using its custom sound system.
- Add the `Click Mask` property from the Texture Button to enable the user to set up their own click masks to fit their custom textures for the button.
- Add the `Flip H` property from the Texture Button, renamed to `Texture Flip H` for clarity.
- Add the `Flip V` property from the Texture Button, renamed to `Texture Flip V` for clarity.
- Clamp the minimum size of the NinePatchButton's textures to that of its button? The button can only be made smaller up to a certain point (this is normal), but currently the textures can be made even smaller.
- Add the button texturing method from the Texture Button? It could be useful to have as an alternative to the already-implemented NinePatchRect button texturing method. Since you'd then have both button texturing methods, and not just the NinePatchRect's, this might also call for a name change for the plugin?
- Add [Conditional Export Properties](http://kehomsforge.com/tutorials/single/gdConditionalProperty)? It could be used for giving the option between using the Texture Button-Esque button texturing method and the NinePatchRect-Esque button texturing method without clogging up the Inspector and would help make it more user-friendly. The downside is that it would increase the length and complexity of the plugin's script.
- Add exported properties to custom property groups? It would help make it more user-friendly and would help organize the Inspector better, but the downside is that it would increase the length and complexity of the plugin's script.
- Port the plugin to Godot 4, complete with a separate Asset Library page and GitHub repository. Links to the ported Godot 4 version of the plugin will be provided here on GitHub and on the Asset Library.


## Changelog:

### v2.1.0
- Added a new custom `Pressed Hovered Texture` property.
- Added a new custom `Pressed Focused Texture` property.
- Added a new custom `Disabled Hovered Texture` property.
- Added a new custom `Disabled Focused Texture` property.
- Changed the name of the `Disabled Sound` property to `Disabled Pressed Sound`.
- Fixed many bugs relating to the textures and the sounds.
- Cleaned up the plugin's code.

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
