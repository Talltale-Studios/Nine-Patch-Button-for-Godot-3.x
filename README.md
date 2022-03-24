# Nine Patch Button for Godot 3.x


## What Is This?
This plugin adds a new type of node that combines the features of the NinePatchRect, the Button, and the TextureButton, with the NinePatchRect being used as the base. We also added a customizable sound system, which allows you to assign sounds for some of its functions such as pressing it or hovering over it.


## Why Did We Make This?
The TextureButton stretches the custom textures you add to it, which is especially noticeable when trying to use pixel art. Luckily the NinePatchRect doesn't have this issue when you use it in a specific way, so we combined the features of the NinePatchRect with those of the TextureButton and the Button and created a new custom node. And while the NinePatchRect can avoid this issue when you use it in a specific way, it can also still be used similarly to how the TextureButton works.

The TextureButton still had some other good features, such as its customizable button animation system, so we added them to the NinePatchButton as well. We also added a few features of our own design, such as a customizable sound system that allows you to assign sounds for some of its functions such as pressing it or hovering over it.

Have a look at this comparison image to see the difference between the NinePatchButton's texturing method and the TextureButton's texturing method:

![Texturing Comparison](https://github.com/Talltale-Studios/Nine-Patch-Button-for-Godot-3.x/blob/master/media/texturing_comparison.png "Texturing Comparison")


## Setup Guide

### Download and Installation
For a detailed guide on using the Godot Asset Library, both the one on the [web](https://godotengine.org/asset-library/asset) and the one in the Godot Editor, please see [here](https://docs.godotengine.org/en/latest/community/asset_library/using_assetlib.html).

### NinePatchButton Setup
Once the plugin has been downloaded, installed, and enabled, you can add a new NinePatchButton node to one of your project's scenes. Note that the NinePatchButton should never be made the root node of a scene as this causes issues with some of its components, instead make it the child of some other node such as a Control node.

To get started using your new NinePatchButton node you must first load your chosen `Normal Texture` (the texture to display by default, when the button is not in the disabled, focused, hovered, or pressed state) into `Script Variables/Normal Texture` in the Inspector panel and then head to `TextureRegion` in the Bottom Panel and set it up like you would with a NinePatchRect. Once that is done you can start adding the rest of the textures of your choice for the NinePatchButton using the properties underneath `Normal Texture`. The rest of the settings work more or less just like you'd expect by looking at their names or by looking at how they worked with the Button, the Texture Button, and the NinePatchRect. Nevertheless, all the properties of the NinePatchButton are explained in detail below.

### Text On Your NinePatchButtons
There are two easy methods you can use to add text to your NinePatchButtons.

The first method is to put the text on the textures of your buttons while editing the textures. It is advisable that you also make the text light up alongside the button on its various "hovered" and "focused" textures.

The second method is to use a Label or a RichTextLabel. In order to do use this method, you must create a Label or RichTextLabel, preferably as a child to your button, and resize it so its size is identical to that of the button. Next, you start adding text and make sure the text is aligned to the center of the Label. Lastly, to customize the text itself, head on over to `Control/Theme Overrides` where you can change various properties such as the font that is to be used for the text, as well as the font's size, its color, whether it should have an outline or a shadow, and much more.


## Properties Guide

### Script Variables

#### Button Texture Properties
- **Normal Texture** - The texture to display by default, when the button is not in the disabled, focused, hovered, or pressed state.
- **Hovered Texture** - The texture to display when the mouse hovers over the button.
- **Focused Texture** - The texture to display when the button has mouse or keyboard focus.
- **Pressed Texture** - The texture to display when the button has been, or is being, pressed down.
- **Pressed Hovered Texture** - The texture to display when the button has been, or is being, pressed down in conjunction with the mouse hovering over it.
- **Pressed Hovered Texture** - The texture to display when the button has been, or is being, pressed down in conjunction with it having mouse or keyboard focus.
- **Disabled Texture** - The texture to display when the button is disabled.
- **Disabled Hovered Texture** - The texture to display when the button is disabled in conjunction with the mouse hovering over it.
- **Disabled Focused Texture** - The texture to display when the button is disabled in conjunction with it having mouse or keyboard focus.

#### Button Audio Properties
- **Hovered Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the mouse hovers over the button.
- **Hovered Volume Db** - The volume of the Hovered Sound, in dB.
- **Hover Pitch Scale** - The pitch and tempo of the Hovered Sound, as a multiplier of the audio sample's sample rate.
- **Focused Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button gains mouse or keyboard focus.
- **Focused Volume Db** - The volume of the Focused Sound, in dB.
- **Focused Pitch Scale** - The pitch and tempo of the Focused Sound, as a multiplier of the audio sample's sample rate.
- **Pressed Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button has been pressed down.
- **Pressed Volume Db** - The volume of the Pressed Sound, in dB.
- **Pressed Pitch Scale** - The pitch and tempo of the Pressed Sound, as a multiplier of the audio sample's sample rate.
- **Pressed Released Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button has been released after having been pressed down.
- **Pressed Released Volume Db** - The volume of the Pressed Released Sound, in dB.
- **Pressed Released Pitch Scale** - The pitch and tempo of the Pressed Released Sound, as a multiplier of the audio sample's sample rate.
- **Pressed Hovered Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button has been or is being, pressed down in conjunction with the mouse hovering over it.
- **Pressed Hovered Volume Db** - The volume of the Pressed Hovered Sound, in dB.
- **Pressed Hovered Pitch Scale** - The pitch and tempo of the Pressed Hovered Sound, as a multiplier of the audio sample's sample rate.
- **Pressed Focused Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button has been or is being, pressed down in conjunction with it having mouse or keyboard focus.
- **Pressed Focused Volume Db** - The volume of the Pressed Focused Sound, in dB.
- **Pressed Focused Pitch Scale** - The pitch and tempo of the Pressed Focused Sound, as a multiplier of the audio sample's sample rate.
- **Disabled Pressed Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button is disabled and the user attempts to press it.
- **Disabled Pressed Volume Db** - The volume of the Disabled Pressed Sound, in dB.
- **Disabled Pressed Pitch Scale** - The pitch and tempo of the Disabled Pressed Sound, as a multiplier of the audio sample's sample rate.
- **Disabled Hovered Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button is disabled in conjunction with the mouse hovering over it.
- **Disabled Hovered Volume Db** - The volume of the Disabled Hovered Sound, in dB.
- **Disabled Hovered Pitch Scale** - The pitch and tempo of the Disabled Hovered Sound, as a multiplier of the audio sample's sample rate.
- **Disabled Focused Sound** - The [AudioStream](https://docs.godotengine.org/en/stable/classes/class_audiostream.html) object to play when the button is disabled in conjunction with it having mouse or keyboard focus.
- **Disabled Focused Volume Db** - The volume of the Disabled Focused Sound, in dB.
- **Disabled Focused Pitch Scale** - The pitch and tempo of the Disabled Focused Sound, as a multiplier of the audio sample's sample rate.
- **Mix Target** - If the audio configuration has more than two speakers, this sets the target channels. With *Stereo*, the audio will be played only on the first channel. With *Surround*, the audio will be played on all surround channels. With *Center*, the audio will be played on the second channel, which is usually the center.
- **Bus Name** - The [audio bus](https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html) on which this button's audio is playing. If the name of the audio bus is invalid or this property is unset it will default to the `Master` audio bus.

#### BaseButton Properties
- **Disabled** - If *true*, the button is in the disabled state and can't be pressed or toggled.
- **Toggle Mode** - If *true*, the button is in the toggle mode. Makes the button flip state between pressed and unpressed each time it is clicked. If *false* then the button will only remain pressed as long as the button is being pressed down by holding the input down, and will revert to the non-pressed state as soon as the input is released.
- **Shortcut In Tooltip** - If *true*, the button will add information about its shortcut in the tooltip.
- **Pressed** - If *true*, the button is in the pressed state. Means the button is pressed down or toggled. This only works if the `Toggle Mode` property is set to *true*, and setting `Pressed` to *true* will result in `toggled` to be emitted. If you want to change the pressed state without emitting the `toggled` signal, use the `set_pressed_no_signal()` built-in function.
- **Action Mode** - Determines when the button is considered clicked.
- **Button Mask** - The binary mark to choose which mouse buttons this button will respond to.
- **Enabled Focus Mode** - We removed this property because its tooltip states that it is deprecated and that `Control/Focus/Mode` should be used instead.
- **Keep Pressed Outside** - If *true*, the button stays pressed when moving the cursor outside the button while pressing it. *This property is currently broken and has been disabled until it can be fixed.*
- **Shortcut** - The [ShortCut](https://docs.godotengine.org/en/stable/classes/class_shortcut.html) associated with the button.
- **Group** - The [ButtonGroup](https://docs.godotengine.org/en/stable/classes/class_buttongroup.html) associated with the button.
- **Theme Path** - The file path of the custom theme that should be used for the button.

### NinePatchRect
- **Texture** - This property is controlled by the `Normal Texture` property, which will automatically load its texture into here.
- **Draw Center** - If *true*, draw the button's center texture (which is set up with `TextureRegion`). Else, only draw the 9-slice's borders.
- **Region Rect** - Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, the NinePatchButton will use the whole texture.

#### Patch Margin
- **Left** - The width of the 9-slide's left column. A margin of 16 means the 9-slice's left corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
- **Top** - The height of the 9-slide's left column. A margin of 16 means the 9-slice's top corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
- **Right** - The width of the 9-slide's left column. A margin of 16 means the 9-slice's right corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders. The width of the 9-slide's left column. A margin of 16 means the 9-slice's left corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
- **Bottom** - The height of the 9-slide's left column. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.

#### Axis Stretch
`Horizontal` stretches or tiles the center texture horizontally, and `Vertical` stretches or tiles the center texture vertically. As for their settings:
- **Stretch** - Stretches the center texture across the NinePatchButton. This may cause the texture to be distorted.
- **Tile** - Repeats the center texture across the NinePatchButton. This won't cause any visible distortion. The texture must be seamless for this to work without displaying artifacts between edges. Note: This functionality is only supported when using the GLES3 renderer. When using the GLES2 renderer, this will behave like Stretch.
- **Tile Fit** - Repeats the center texture across the NinePatchButton, but will also stretch the texture to make sure each tile is visible in full. This may cause the texture to be distorted, but less than Stretch. The texture must be seamless for this to work without displaying artifacts between edges. Note: This functionality is only supported when using the GLES3 renderer. When using the GLES2 renderer, this will behave like Stretch.


## Got Any Feedback?
If you have any feedback, be it a bug report, a suggestion, or a feature request, feel free to [open an issue](https://github.com/Talltale-Studios/Nine-Patch-Button-for-Godot-3.x/issues) on GitHub. All we ask is that you try to label your issues suitably with the provided labels and that you try to prevent posting an issue about a topic that an issue already exists for. If an issue about a specific topic already exists, please do not create a new issue (although you may post a comment to an older issue about that topic if such an issue already exists). We will greatly appreciate any kind of constructive feedback you can give us.


## Links
- The plugin's Asset Library page: https://godotengine.org/asset-library/asset/1243 (*Note that it takes time before any update or change goes through on the Asset Library. Check [here](https://github.com/Talltale-Studios/Nine-Patch-Button-for-Godot-3.x/releases/latest) for the latest version of the plugin before you check on the Asset Library.*)


## Future Plans
- Fix the button press not being cancelled when moving the mouse cursor outside the button while it is still being pressed down and the `Keep Pressed Outside` property is set to *false*.
- Fix the instanced Button becoming visible on the duplicated NinePatchButton while in the editor if you Duplicate (shortcut: Control + D) a NinePatchButton. Note that it is still invisible while running the scene, but according to its code it shouldn't be visible in the editor under any circumstances while the `flat` variable is true, which it is.
- Add a larger icon with a size of 64x64, 128x128, or 256x256 for use as the icon for the plugin on the Asset Library and the icon for the plugin's Demo Project.
- Add the `Click Mask` property from the Texture Button to enable the user to set up their own click masks to fit their custom textures for the button (by default the click mask is rectangular, and with a texture that is, say, circular, the click mask will not line up as it should with the texture of the button).
- Add the `Flip H` property from the Texture Button, renamed to `Texture Flip H` for clarity.
- Add the `Flip V` property from the Texture Button, renamed to `Texture Flip V` for clarity.
- Add the exported properties to custom property groups. This would help make the NinePatchButton's Inspector more user-friendly and organize the properties better.


## Changelog:

### v2.5.1
- Changed all references to "Jurubu Entertainment" in the plugin's files to "Talltale Studios". Talltale Studios is now officially the new name of our organization.
- Cleaned up `.bak` backup files.

### v2.5.0
- Fixed the NinePatchButton not still not properly going out of focus when moving the mouse cursor outside the button.
- Fixed a case mismatch error with the plugin's `plugin.gd` script.
- Fixed the name of the root node of the Demo Project's `usage_examples` scene not being in snake_case.
- Added a custom theme for the plugin which has no focus indicator and a new `Theme Path` property that points to it. This custom theme will be loaded automatically in the `ready()` function, and the user can change it to their liking.
- Improved the Demo Project's `usage_examples` scene with new art and new NinePatchButtons that show what it looks when you add text to the button through the use of its textures (instead of a Label or RichTextLabel), and also increased the sizes of the NinePatchButtons to make them more visible.
- Cleaned up unused assets.

### v2.4.0
- Added new documentation to the plugin's scripts.
- Changed the names of the Demo Project's and the NinePatchButton's folders and files to use snake_case.
- Moved some of the Demo Project's assets that were mistakenly put in the `Optional Assets` folder into the `Required Assets` folder.
- Renamed some of the Demo Project's assets to make more sense within the scope of the project.
- Removed the Demo Project's `Optional Assets` folder and renamed the `Required Assets` folder to `Assets`.
- Disabled the `Keep Pressed Outside` property. It is currently broken and will be re-enabled once it has been fixed.
- Cleaned up the plugin's code.

### v2.3.0
- Fixed the NinePatchButton not going out of focus when moving the mouse cursor outside the button.
- Fixed a typo in the plugin's code.
- Changed the name of the Demo Project's `Example_NinePatchButtons` scene to `Usage_Examples`.
- Removed the Demo Project's `NinePatchButton` scene, as it is actually only set up and used for short periods at a time during testing, after which it has to be set up from scratch again when the next test is to be performed, and as such, there is actually no use in keeping it around after the test has been performed.
- Split all of the Demo Project's assets between two new `Optional_Assets` and `Required_Assets` folders to enable the user to more easily see which assets the Demo Project needs to run and which not.
- Cleaned up the plugin's code.

### v2.2.0
- Added an optional `NinePatchButton Demo Project` alongside the actual plugin's root folder. Download it if you're interested in seeing the internal workings of the plugin, as well as examples of how the plugin can be used.
- Added `Volume Db` properties, that originated from the AudioStreamPlayer, for each of the button's sounds.
- Added `Pitch Scale` properties, that originated from the AudioStreamPlayer, for each of the button's sounds.
- Added the `Mix Target` property that originated from the AudioStreamPlayer.
- Added the `Bus Name` property that originated from the AudioStreamPlayer's `Bus` property.
- Added a copy of the `README.md` file from the plugin's GitHub repository to the plugin's root folder.
- Cleaned up the plugin's code.

### v2.1.0
- Fixed many bugs relating to the plugin's textures and sounds.
- Added a new custom `Pressed Hovered Texture` property.
- Added a new custom `Pressed Focused Texture` property.
- Added a new custom `Disabled Hovered Texture` property.
- Added a new custom `Disabled Focused Texture` property.
- Changed the name of the `Disabled Sound` property to `Disabled Pressed Sound`.
- Cleaned up the plugin's code.

### v2.0.0
- Initial public release of the plugin on the [Godot Asset Library](https://godotengine.org/asset-library) as well as the setup of the GitHub repository and everything else that goes with it.

### v1.3.0
- Fixed several bugs.
- Fixed the default values of some properties that were mistakenly left undefined.
- Fixed a typo in the name of one of the properties.
- Added the `Action Mode` property that originated from the Button.
- Added the `Focused Texture` property that originated from the TextureButton.
- Added a new custom `Focused Sound` property, based on the Texture Button's `Focused Texture` property.
- Changed the name of the NinePatchButton's icon image from `Icon.png` to `NinePatchButton.png` and its Import Preset from `Default` to `2D Pixel`.
- Removed the deprecated `Enabled Focus Mode` property that originated from the Button. It has been superseded by the Control node's own `Focus Mode` property and is scheduled for removal in Godot 4.
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
