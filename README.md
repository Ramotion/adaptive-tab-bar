# Adaptive Tab Bar

AdaptiveController is a 'Progressive Reduction' Swift module for adding custom states to Native or Custom UI elements.

![Mou icon](https://d13yacurqjgara.cloudfront.net/users/25514/screenshots/1320024/viber-ios7-concept-navigation-bar-ramotion.gif)

##Tab Bar After Install
![Mou icon](http://i.imgur.com/7V6M7z6.png?1)

##Tab Bar After Two Weeks

![Mou icon](http://i.imgur.com/KTZIC4Z.png?1)

##Tab Bar After a Month

![Mou icon](http://i.imgur.com/TNQMGTf.png?1)

##Overview

AdaptiveController is module for adding custom states to Native or Custom UI elements. The UI elements evolve over time as the user becomes accustomed to them. An example AdaptiveTabBar is provided.

##How to import the control to your project

1. First, drag and drop the AdaptiveController project file into your project or select "add existing file" and choose the AdaptiveController project
2. Add AdaptiveController to your Target Dependences in the Build Phase of your project.
3. Add the AdaptiveController framework in Link Binary With Libraries in Build Phases
4. Import AdaptiveController where needed.

##Using AdaptiveController 

First, you should set the install date, current date, count of days to transition to small text state, and count of days to transition to big image state. The AdaptiveDateState object automatically determines what UI state to show:

```swift
    var installDate = NSDate(dateString:"2014-09-18")
    var adaptiveState = AdaptiveDateState(installDate: installDate, currentDate:NSDate(), countDaysToSmallTextState:countDaysToSmallTextState, countDaysToImageState:countDaysToImageState)
```
Or count of launches for different state:

```swift
    var curentCountLaunches = 6
    var adaptiveState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches, countLaunchesToSmallTextState:5, countLaunchesToImageState:7)
```

And then you should setup an array of appearances. You should setup button images for each state for each apperance object:

```swift
    var buttonsAppearances = buttonsAppearancesGenerate() //func butonsAppearancesGenerate() -> [AdaptiveButtonApperance]
```

And then you should setup an array of items Appearance object. You should set the button's image for each state for each appearance object.

First, you should setup a style for each UI state:
		
```swift 
 var settingsManager = AppearenceSettingManager()      
        settingsManager.defaultStyleSettingsForNormalState(AdaptiveStateEnum.DefaultAdaptiveState,titleOffset:defaultOffset, imageInsets:defaultInsets, titleColor:UIColor.whiteColor(), font:defaultFont!, backgroundColor:UIColor.clearColor())
         settingsManager.defaultStyleSettingsForNormalState(AdaptiveStateEnum.SmallTitleAdaptiveState,titleOffset:defaultOffset, imageInsets:defaultSmallTitleModeImageInsets, titleColor:UIColor.whiteColor(), font:defaultSmallTitleModeFont!, backgroundColor:UIColor.clearColor())
```
 Then you should set the Appearance for each UITabBarItem title for each state and image for each state
 
 First, init the appearance values with title and image with presetes appearances style :
 
```swift 
var messageСontrolDefaultStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"messages", imageName:"messages")
 var messageControlSmallTitleStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.SmallTitleAdaptiveState, title:"messages", imageName:"messages_smalltitle")
 	var messageControlImageStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.ImageAdaptiveState, title:"", imageName:"messages_bigimage")
```
then init appearace opject with aprerance object for each state

```swift
let messageAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:messageСontrolDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:messageControlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:messageControlImageStateValue]        
        var messageAperance = AdaptiveButtonAppearance(states:messageAppearanceStates)
          es)
```


In alternative way you can setup all appearances settings in plist like on image

![Mou icon](http://i.imgur.com/zLP8zHF.png)

sample of plist you can find in example-date-adaptive-tab-bar project file named  appearances.plist
 
for setuping button appearences from plist you can use this code:
        
```swift 
var seriliazator = DictioanarySeriliazator()
var butonsApperances = seriliazator.getButtonApperances(path!)
```

for debugging button appearences  you can save your aperances in plist for this you can use next code:    

```swift 
 var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
 paths = paths.stringByAppendingPathComponent("appearances.plist")
 seriliazator.saveStateDictionary(butonsApperances,filePath:paths)
```   
       
Then you should setup сustom UITabBarItems which conform to the AdaptiveButtonsProtocol:

```swift 
    var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
```

In your custom tab item, you should implement these methods from the protocol:
		
```swift
    @objc protocol AdaptiveApperanceProtocol {
        optional func setFontToAdaptiveButton(font: UIFont)
        optional func setTitleToAdaptiveButton(text: NSString)
        optional func setImageToAdaptiveButton(image: UIImage?)
        optional func setHighlightedToAdaptiveButton(image: UIImage?)
        optional func setBackgroundImageToAdaptiveButton(image: UIImage?)
        optional func setSelectedImageToAdaptiveButton(image: UIImage?)
        optional func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets)
        optional func setTitleOffsetToAdaptiveButton(offset: UIOffset)
        optional func setTitleColorToAdaptiveButton(titleColor: UIColor)
    }
```

An example implemetation of a protocol method from our custom tab bar item:
	
```swift	
    func setTitleToAdaptiveButton(text: NSString) {
    	self.title = text
	}
```


Finally, you should init Adaptive State Manager with the objects you've setup:

```swift
	AdaptiveButtonsStateManager(state: adaptiveState, buttonsAray:arrayButtons, buttonsAppearance:butonsAppearances)
```


##Using Custom States For AdaptiveController 

Like UITabBar for different custom applications states 

We have a default AdaptiveState and with the help of inheritance, we can add
new custom states to our state class. The new class in our situation is 
named AdaptiveDateState

In AdaptiveDateState, we can add new custom states like this:

```swift
	let kSmallTitleAdaptiveState = "kImageAdaptiveState"
	let kImageAdaptiveState = "kNormalImageAdaptiveState"
```

And add methods which decide how the state relates to input parameters:

```swift
	var adaptiveState = AdaptiveDateState(installDate: installDate,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
```

In AdaptiveDateState, we add custom init methods which decided what states have the Adaptive state object according to the input parameters:

```swift 
    private func stateRemainDays(remainDays:Int, countDaysToSmallTextState:Int, countDaysToImageState:Int)->String {
        var mode:String = kDefaultAdaptiveState
        print(" DAYS \(remainDays) ")
        if remainDays > countDaysToSmallTextState && remainDays < countDaysToImageState{
            mode = kSmallTitleAdaptiveState
        } else if remainDays > countDaysToImageState {
            mode = kImageAdaptiveState
        }
        print(mode)
        return mode
    }
```

You can customize different UI components if they adopt to the AdaptiveApperanceProtocol.

##About us

[Ramotion](http://Ramotion.com) is an iPhone app design and development company. We are ready for new interesting iOS App Development projects.

Follow us on [twitter](http://twitter.com/ramotion).
