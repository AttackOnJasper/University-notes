# Unity

## Basics
- Windows
	- Scene tab
	- Game tab
	- Hierarchy window: list of objects in Scene view
	- Project window: shows all the files (assets) that are used in the game
	- Inspector window: managing attributes for an object in Scene view
		- e.g. adding a component to the gameobject
- **Play mode** place where the game is tested by playing the game
- **Edit mode** place to change the game
- **GameObject** building blocks of Unity in a scene
	- add components to GameObjects & change how they look and behave
- **Components** tell Unity what the GameObject does (e.g. transform, rigidbody)
	- can be seen as the properties + controller to the view
- **Prefab** saved GameObject (to be re-used in another project)
	- can drag prefab from project window to hierarchy window to create an instance of the prefab under the current project

## Meshes

## Script
- GetComponent
- GetComponentsInChildren

### Assembly Reference
- Make sure dll is compatible with the target framework version
- Need to create a 'Plugins' folder and put dll into the folder
- In visual studio, go to Solution Explorer  -> Reference -> Analyzer, then click 'Project' on menu bar then 'Add reference'