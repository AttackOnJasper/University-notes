# Unity

## Basics
- Windows
	1. Scene view tab
		- Typically in the middle of the unity UI
		- Sees all elements that makes up the game
	1. Game view tab
		- Typically in the middle of the unity UI
		- Sees how it would look like for players to play the game
	1. Hierarchy window: list of objects in Scene view
		- Typically at left side of the unity UI
		- Examples
			1. Main camera
			1. Directional light
			1. Player
	1. Project window: shows all the files (assets) that are used in the game
		- Typically at down side of the unity UI 
	1. Inspector window: managing attributes for an object in Scene view
		- Typically at right side of the unity UI
		- e.g. adding a component to the gameobject
	1. Tool bar
		- move tool, rotate tool
- **Play mode** place where the game is tested by playing the game
- **Edit mode** place to change the game
- **GameObject** building blocks of Unity in a scene
	- a collection of a transform and components
		- A transform includes position, rotation, and scale of a GameObject
	- add components to GameObjects & change how they look and behave
	- Hierachy
		- A GameObject can become a child of another GameObject
		- Moving parent GameObject would move the child as well
- **Components** tell Unity what the GameObject does (e.g. transform, rigidbody)
	- can be seen as the properties + controller to the view
- **Prefab** Prefabricated / saved GameObject (to be re-used in another project)
	- Can drag prefab from project window to hierarchy window to create an instance of the prefab under the current project
	- Easy for refactoring
- Axis
	- Z: forward direction; camera is typically looking in forward direction
- Frame rates
	- Default: 60 FPS


## Hot keys
- Scene view
	- Alt + mouse: rotate
	- Shift + middle mouse: pan scene view
- GameObject
	- F: frame scene view to a specific GameObject
	- Command + D: duplicate
- Hierarchy
	- Alt + click expand: expand all hierachies


## C Sharp Reference
### Basics
- Defining namespace
	- `using ...` e.g. `using System.Collections;`

	

## Meshes

## Script
- Naming
	- Ensure that the name of the script matches the name of the class
		- Pressing `F2` would refactor both the script class name as well as script name
- Need to add script to a GameObject
	- Can drag and drop the script onto the necessary GameObject
- Examples
	- GetComponent
	- GetComponentsInChildren

### Assembly Reference
- Make sure dll is compatible with the target framework version
- Need to create a 'Plugins' folder and put dll into the folder
- In visual studio, go to Solution Explorer  -> Reference -> Analyzer, then click 'Project' on menu bar then 'Add reference'


## Best Practices
1. GameObject
	1. Avoid changing scales from time to time; instead, update the scale of the asset to match what the game should use
	1. Avoid too many box colliders