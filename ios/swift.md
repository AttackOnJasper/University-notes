# Swift

## 2014-08-07 Swift Tour - Simple values
https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html
Swift uses dynamic typing. If there is not enough info. in the data to specify the type, make the type explicit by ‘: type_name’ e.g.
```
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
```

Empty array: 
```
let empty_array = string[]() or [ ];
```

Empty dictionary: 
```
let empty_dictionary =  Dictionary<String, Float>() or [:]
```

## 2014-08-08
An optional value either contains a value or contains nil as NULL. The ? mark after the type indicates that the variable is optional. e.g. 
```
var optional_string: String? = "I am optional"
        optional_string = nil
if let a = optional_value{…} : // the if statement will not be executed if the optional value is nil 
```

You can keep an index in a loop—either by using ..< to make a range of indexes or by writing an explicit initialization, condition, and increment. e.g. 
```
for i 0..<4{…} == for (i = 0; i <4; i++){…}
```
Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.



## 2014-08-11 Swift Tour - functions
- A function can be defined inside another one i.e. nested functions
	- We can use function as parameters e.g. func:(Int - > Int) 
	- we can return a function, e.g. -> (Int -> Int)
- Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed.
- You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.
- We can write functions without names by using ‘in'
```
numbers.map({
(number: Int) -> Int in
let result = 3 * number
return result
})

numbers.map({
(number:Int) -> Int in
if number%2 == 0
  return number
else return 0
})
```
- Create an instance of a class by putting parentheses after the class name. 
- Use dot syntax to access the properties and methods of the instance.
- Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.     e.g. class rectangle: polygon{…}
Methods on a subclass that override the superclass’s implementation are marked with override—overriding a method by accident, without override, is detected by the compiler as an error. The compiler also detects methods with override that don’t actually override any method in the superclass.
 
## 2014-08-12
Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.

## 2014-08-13
- Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
- Use ItemType enables defining functions to generic types of arguments, and thus improve abstraction 

## 2014-08-22
- Using nested comments enables codes to be commented more conveniently
- **UINT8_MAX** is a built-in constant whose value is 255, INT8_MAX is 127. In a 32-bit system Int is automatically 32 bit
- **String** in SWIFT has a method called `toInt`, which translates  “123” into 123. Since toInt is likely to fail, it actually returns an optional value

## 2014-08-27
元组(tuples)把多个值组合成一个复合值。元组内的值可以使任意类型,并不要求是相 同类型。
(404, "Not Found")元组把一个 Int 值和一个 String 值组合起来表示 HTTP 状态码的两个 部分:一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为(Int, String)的 元组”。

你可以将一个元组的内容分解(decompose)成单独的常量和变量,然后你就可以正常使用它们了 

## 2015-02-25
cause of error: multiple pointers point to the same view, or the pointer to an @IBOutlet no longer exist

## 2015-03-09 SpriteBuilder 
4 parts:
1. Resource/Component Browser: Here you can see the different resources and scenes you have created or added to your project. You can also select different types of Nodes and drag them into your scene.
2. Stage: The stage will preview your current scene. Here you can arrange all of the Nodes that belong to a scene.
3. Timeline: The timeline is used to create animations within SpriteBuilder. We will look at that in a lot of detail later on.
4. Detail View: Once you select a node in your scene, this detail view will display a lot of editable information about that node. You can modify positions, content (the text of a label, for example) and physics properties.

CCNodeGradient: vector: x for the ratio of colors horizontally; y for the ratio of colors vertically


# Stanford University Swift Course
##2015-03-10
memory management: reference counting

Press “option” key + identifiers — shows a small documentation; press “command” key + identifiers — shows declaration

In swift all the properties have to be initialized during construction of object if they have no default values 

e.g. class …:UIViewController{
	var someVar:int  // this is not acceptable
}
Why don’t we initialize IBOutlet?
Answer: they are initialized by ‘awakeFromNib’

Optional type: ‘?’ is an optional type, whereas ‘!’ force the property to have a non-nil value and no longer optional (to wrap the optional)

definition: display: UILabel!
usage: display.text

definition: display: UILabel?
usage: display!.text
if display is nil, then the program is still going to crash
Since IBOutlet is automatically wired, we can safely use ! to wrap


##2015-03-12 Lecture 4 Swift & Foundation
Array<String> is the same as [String]
Range:
struct Range<T>{
	var startIndex: T
	var endIndex: T
}

NSObject: base class for objective-c class
NSNumber: generic number-holding types: including int, double, float

3 basic building blocks in swift: class, enum, and struct
	they can all have functions
	struct cannot have inheritance
	they can all have properties, but these of enum cannot store values (could have computed properties)
	enum cannot have init() 	
	Differences:
	value type (struct & enum) vs reference type (class)


##2015-03-13
A method that has ‘final’ tag prevents the subclass from overriding it

All methods and functions’ parameters can have internal names and external names
e.g. func myfunc(external internal: Type)
	myfunc(external: value)
You can make the external equals the internal by putting # in front of internal

willSet and didSet are observers of that property.
willSet will be executed before a new value is set
didSet will be executed after a new value is set

Lazy property: does not initialize an object unless someone tries to access it
You can set constant values when you call init
Must call the superclass’s init before setting any inherited values
If you do not implement any designated init, you will get all designated super class init
Add ‘required’ tag to init: all subclasses must implement it

How can we use ‘AnyObject’
---convert AnyObject to some types that we know 
by using casting:  e.g. let … = bar as Bar        
	as? returns an optional; shows whether it’s the correct type —  if let … as? … {}
	you can cast with as check the type of that object

Assert is powerful for debugging —> assert(()->bool, “error message”)


##2015-03-14
A few data types are handled via bridging with objective-c 
Bridging — you can access interchangeably
e.g. 	NSString -> String
	NSDictionary -> Dictionary<NSObject, AnyObject>
	Int, float, Double, Bool -> NSNumber
You can cast to/from bridging types e.g. let len = (myString as NSString).length    // length is an NSString’s method
String, Arrays, and Dictionaries are structs rather than objects, but they can still be AnyObject 


##2015-03-18
A property-list is an AnyObject which is one of NSString, NSArray, NSDictionary, NSNumber, NSData, NSDate
NSUserDefaults can be used to manipulate property list; store entire property list by keys; persists even when the app is gone
	let defaults = NSUserDefaults.standardUserDefault()
	defaults.setObject(AnyObject, forKey:String)
type-alias can rename a type

A view (subclass of UIView; a rectangle)
UIView has 2 init: init(frame: CGRect), init(coder:NSCoder). If you want to implements init, you need to implement both 2 inits
Data structures: CGFloat — all coordinates; CGPoint — 2 doubles; CGSize(height, width); CGRect 
Points are used rather than pixels in the coordinate system; typically 2 pixels to 1 point; contentScaleFactor checks ratio of point to pixel


##2015-03-30
bounds: a CGRect that limits the area of drawing in your coordinate system
center: a CGPoint which is the center of the view rectangle in the super view system
frame: a CGRect in the super view system that encapsulate your bounds (always horizontal & vertical)

Using code to create views:
e.g. 	let labelRect = CGRect(x:20, y:20, width:100, height:50)
	let label = UILabel(frame: labelRect)
	label.text = “hello world”
	view.addSubview(label)

To draw, just create a subclass of UIView and override the drawRect
override func drawRect(regionNeedsToBeDrawn: CGRect)
Never call drawRect yourself
To implement drawRect, we can use the c-like API Core Graphics; now we focus on UIBeizerPath class
let path = UIBeizerPath()
path.moveToPoint(CGPoint(20,30))   // imagine the curser moved to this point
path.addLineToPoint(CGPoint(40,50))   // draw and move curser
path.addLineToPoint(CGPoint(10,50))   // add a horizontal line
path.closePath()  // forms a triangle
// make the above appear on the screen you have to stroke or fill
UIColor.greenColor().setFill()
UIColor.redColor().setStroke()
path.linewidth = 3.0
path.fill()
path.stroke()


##2015-03-31
Colors can be set by using RGB HSB or even patterns
can have alpha (transparent) by setting var opaque = false

Fonts are very important; use preferredFontForTextStyle(UIFontTextStyle) type method
styles: UIFontTextStyle.Headline
System fonts: e.g. buttons

Create a UIImage: let image: UIImage? = UIImage(named: “foo”)

Once bounds change, there is no redraw method; the bits of long screen is stretched 
UIViewContentMode 
	1.set the mode of image movement rather than stretching bits
	2.rescale
	3.redraw
 

##2015-04-02
Cocoa Touch class can be used to make view controller; make sure to go to the identity inspector to get the view & controller matched 

Control + Shift + Left click on the main storyboard helps us find the component we want

Failed to instantiate the default view controller for UIMainStoryboardFile ‘Main'
this is because there is no starting scene (that has an arrow near storyboard)


##2015-04-03 Delegation & Protocol
Protocol: A way to express API minimally; a Type just like class, enum, and structs; no implementation & storage (like interface in java)
The classes that implements the protocol must implement the super protocols as well
must specify whether a property is get only or both get and set   var lol: Int { get set}
Syntax of implementing protocols    class SomeClass: InheritedClass, oneProtocol, anotherProtocol
We can create an instance of protocol, but we can only call the protocol’s methods (just like an abstract superclass)

One of the main use of protocol is enabling the blind communication between view and controller by delegation
Delegation: enables the connectivity between view and model
1. create a delegation protocol (describes what the view is looking for the controller to do)
2. create a delegate/dataSource property in your view whose type is the delegate protocol
3. use the delegate property to get/do things
4. the controller sets self as the delegate of that view (set a property in the protocol) and implements the protocol


##2015-04-04
Always use a weak pointer to set delegate property 


##2015-04-05
Gestures help us know how the users touch the screen; they are recognized by UIGestureRecognizer
Two ways to use a recognizer: 
	1. add a UIGestureRecognizer to UIView  (done by controller or view)
	2. add a handler
sample:     @IBOutlet weak var myView: UIView{
			didSet{
				let recognizer = UIPanGestureRecognizer(target: self, action: “pan:”)
				pannableView.addGestureRecognizer(recognizer)
			}
		}
action is the handler
state: .Begin .Ended .Changed .Possible .Failed 
Other types of Recognizer: Pinch, Rotation, Swipe(direction & no. of fingers), Tap(no. of taps and fingers)
 
Multiple MVCs:
IOS provides the controllers whose views are other MVCs e.g. UITabBarController, UISplitViewController UINavigationController


##2015-04-21
Navigation Controller: push and pops MVCs off of a stack
	Top content is generated by the communication between controllers’ navigation property
	Move among other views when other views need to be rendered
	Access the other controllers by viewControllers property
	
Segue: how view controllers transit from each other (to let one MVC cause the appearance of another )
(	Show segue, 		[different in Navigation Controller than others]
	show detail segue, 	[difference is in the split view]
	modal segue, 		[take over the full screen]
	popover segue	[popover screen]
)
segue always creates a new instance of MVC
 	    

##2015-04-22
Achieve segue: 
1. Ctrl+drag from the button from master to detail storyboard / invoke segue from code:    fun performSegueWithIdentifier(…) 
2. Click 'show detail’
3. Click the segue to open Attributes inspector (initialize an identifier to prepare for a segue)

Preparing for a segue in the controller:
func prepareForSegue(segue:…, sender:…){}    // sender could be an UIButton in storyboard or that in your performSegueWithIdentifier
* The segue is prepared before the set of outlets
shouldPerformSegueWithIdentifier(..) -> Bool


##2015-04-23
iPhone doesn't support the split controller (except iPhone 6plus when we rotate the screen)
To avoid fetal error: found nil (for outlets) while we set the values during PreparingForSegue, we need to put a question mark right after the outlet to let the code accept nil values

Popovers pop an entire MVC over the rest of the screen (contains an arrow, the rest of the area is grey)
It uses presentationController(not a UIViewController)
thus PrepareForSegue is different at  if let ppc = vc.popoverPresentationController{...}
adaptivePresentationStyleForPresentationController helps popover adapt to different sizes of the screen
Usually we use bar button item to make the popover, then drag it to VC and click ‘popover’

Change a property to NSUserDefault to enable its persistence when segue creates a new View controller


##2015-04-24
To prevent popover to take over the whole screen of iPhone, we need to change the adaptation 
TextViewController (text area has a better understanding about what the size of popover should be

View Controller Lifecycle
Start: init — prepare a segue; outlet setting; appearing and disappearing; geometry changes, low-memory situations
After instantiation and segue preparation, viewDidLoad is called, which is better than init and lots of setup code can be put here
override func viewDidLoad(){
	super.viewDidLoad();
}
You can update ur UI after execution of viewDidLoad as the outlets have been set
Do not do geometry related operations in viewDidLoad as we do not know the size of devices yet
Your view would be loaded only once, but it might appear and disappear many times (e.g. master in splitViewController), so you might use viewWillAppear(animated: Bool) and viewDidAppear(animated: Bool) viewWillDisappear(animated: Bool)
Autorotation: control of screen when bounds changed (device get rotated)
	we can set whether the screen is gonna rotate in the project setting part

Summary of starting view controller:
1. instantiated (usually from main storyboard)
2. awakeFromNib
3. segue preparation
4. outlets get set
5. viewDidLoad
6. When controller’s view goes on to screen: viewWillAppear, autoLayout(viewWillLayoutSubviews, viewDidLayoutSubviews), viewDidAppear
7. When controller’s view goes off the screen: viewWillDisappear, viewDidDisappear

Sometimes auto layout cannot fix the problem of screen rotation; a special auto-layout Any can be used in such cases (look at the bottom of storyboard: wAny, hAny)
iPhone 6+ has different width & height criteria than those of other iPhones
Key of AutoLayout: remove magic numbers


##2015-04-28
image.xcassets take charge of all the images in your app
sometimes we need to set compression priority lower to let the compiler know which one to compress first
Extension tag

##2015-05-05 Lecture 9
Scroll View: set the content size and add subviews to the UIView
	content size: scrollView.contentSize = CGSize(width: , height:  )
	add subviews: image.frame = CGRect(…)     scrollView.addSubview(image)
The position of the scrollView in the screen: scrollView.contentOffset
Zooming:
	1.Set minimumZoomScale & maximumZoomScale (degree of magnify)
	2.Create delegation 
Scroll View has more than 12 delegate methods


##2015-05-23 Lecture 9
Give a controller the image url to display the image
While creating a view controller in the main storyboard, we have to create a view controller class file and link to the UI

##2020-05-30 Stanford CS193P L1 (Spring 2020)
### Xcode
- Navigator (left side)
	- file strcture, search, breakpoints, old builds,
- Inspector (right side)
- Console / debugger (bottom)

### Packages
- `Foundation`: strings, arrays
- `SwiftUI`: everytime UI is modified this package is imported
	- depends on `Foundation`

### Basics
- `struct` in swift is like a `class`
- `struct ContentView: View`: this is not OOP/inheritance
- Anything behaves like `View` is a rectangle area in the actual UI
- A `View` object is like a lego
- `{}` after `var` definition means that the code inside it would not be stored in memory; instead, the code would be invoked everytime the variable is referred 
- Swift is **strongly typed**: every variable has a type
- **Range**: e.g. 0..<4 == [0,1,2,3]; 0...4 == [0,1,2,3,4]

### Stacks
- HStack: group views horizontally
	- Parameters: content (can be directly replaced with `{}`), spacing (define space among each stacks)

##2020-07-06 Stanford CS193P L2
### Architecture
- MVVM: design paradigm
	- Reactive user interface
	- Separate model and view
	- Model: data + logic (UI independent)
	- View
	    - can only read data from model
	   	- reflects the model / stateless 
	   	- declared - state that the view looks like this way e.g. create a rectangle
	   	- why imperical model, instead of declarative, is bad for UI?
	      	- Time / latency
      	- Reactive - sensitive to model changes
  	- ViewModel - binds view to model
  		- Interpreter of the model data
  		- Functionality: 
  		   	- Model to View: notice changes from model and publishes "something changed"; View subscribes to the ViewModel (and view gets notified)
  		   		- e.g. `ObservableObject`, `@Published`, `ObjectWillChange.send()`
  		   	- View to Model: process intents (user input)
  		   		- View will call `Intent` function upon user inputs are captured
  		   		- ViewModel will then modify the model

### Varieties of Types
- struct (covered above)
	- **copy on write**: passed on value, but only bitwise copied upon writing
	- functional programming
	- should be used as default data structure
	- View is a `protocol`
- class
	- very similar to struct
	- ViewModel in MVVM is always a class
	- difference with struct
		- struct is **value** type, and class is **reference** type (i.e. class lives in heap and is passed by pointers - automatic reference counting)
		- Mutability must be explicitly stated in struct; in class it's always mutable
- protocol
- generics 
	- e.g. array
	- `struct Array<Element> {}`
- enums
- functions
	- e.g. `var foo: (Double) -> Void`

## 2020-07-11 Stanford CS193P Reading - Swift Language Guide
- https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html

### The Basics


## 2020-07-12 CS193P L3 
### Reactive UI
- When changes happen in model, view will be updated instantly
- Implementation
	- `ViewModel` should implements `ObservableObject` protocol and adds property wrapper `@Publish` on the model object
	- `View` should adds `@ObservedObject` on the `ViewModel` object

### Protocol
- Like an interface in java
- Any type can claim to implement the protocol; all functions in protocol needs to be implemented unless the type implementing the protocol is also a protocol
- **Constrains and gains**
- Protocol extensions
	- Functionality
		- add implementations to protocols 
		- can be used to add code to class / struct
- Why protocols?
	- It is a way for types (classes/struct/protocols) to express what they are capable of without revealing who itself is
	- Standardize/formalizing code
	- Encapsulation
	- In Swift, protocols can be combined with generics for more power
		- e.g. ```extension Array where Element: ProtocolA {} ```

### Layout
- Overview
	1. Container View (e.g. ZStack, HStack, VStack) offers space to the sub Views inside them
	2. sub Views then choose sizes
	3. Container Views then position sub Views 
- Container Views
	- usually offers space to least 'inflexible' sub View first and goes to the next one. (e.g. image)
	- common Views to be put in stacks
		- `Spacer`
		- `Divider`
- Modifier
	- modifies the view in the scope; may change layout
	- e.g. padding()


## 2020-07-13 CS193P L4
### Enum
- Enum, like a `struct`, is value typed (pass by value)
- Each value could have an associated value
- Initialization: ```var anEnum: AnEnum = AnEnum.aValue ```
- Logic on different cases:
```
switch anEnum // `switch self` if defined inside the Enum 
	case .case1:
	case .case2:
	default:  
```
- Protocols
	- `CaseIterable`: the enum would have a static var `allCases` that can iterate over

### Optional
- Optional is an Enum
```
enum optional<T> {
	case none
	case some(T)
}
```
- Usage
```
if let safeVar = anOptional {

} else {

}
```
- ```let y = x ?? "foo" ```: `??` equals 'getOrDefault'

## 2020-07-21 CS193P A1 Swift API Guidelines
- https://swift.org/documentation/api-design-guidelines/
- Write a documentation comment for every declaration


### Naming
- Include all the words needed to avoid ambiguity for a person reading code where the name is used.
- Omit needless words
- Name Mutating/nonmutating method pairs consistently.
	- adding 'ing' / 'ed' to nonmutating methods e.g. y = x.sorted()


## 2020-08-03 CS193P L5
### ViewBuilder
- Syntax for adding multiple views to a list
- Limiting to ten views in the list
- The output of functions or read-only vars that are marked as `@ViewBuilder` will be interpreted as a list of views
- e.g.
```
@ViewBuilder
func foo() -> some View {}
```
- Cannot extract specific views from the combined list
- Cannot declare variables within ViewBuilder


### Shape
- A protocal that inherits View
- Required implementation: `func path(in rect: CGRect) -> Path {}`, which can add lines, arcs, bezier curves to make a shape

#### Generic function
- Similar to generic types
- e.g.
```
func fill<S>(_ whatToFillWith: S) -> View where S: ShapeStyle {...}
```
- `ShapeStyle` examples: color, painting, image painting


### Animation
- Views are animated through ViewModifiers









