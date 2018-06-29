[![Header](https://cdn.rawgit.com/Ramotion/adaptive-tab-bar/docs_update/header.svg)](https://ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=adaptive-tab-bar-logo)
<img src="https://github.com/Ramotion/adaptive-tab-bar/blob/master/adaptive_tab_bar.gif" width="600" height="450" />

# Adaptive Tab Bar
[![CocoaPods](https://img.shields.io/cocoapods/p/AdaptiveController.svg)](https://cocoapods.org/pods/AdaptiveController)
[![CocoaPods](https://img.shields.io/cocoapods/v/RAMPaperSwitch.svg)](http://cocoapods.org/pods/AdaptiveController)
[![Twitter](https://img.shields.io/badge/Twitter-@Ramotion-blue.svg?style=flat)](http://twitter.com/Ramotion)
[![Travis](https://img.shields.io/travis/Ramotion/adaptive-tab-bar.svg)](https://travis-ci.org/Ramotion/adaptive-tab-bar)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/Ramotion)

## About
This project is maintained by Ramotion, Inc.<br>
We specialize in the designing and coding of custom UI for Mobile Apps and Websites.<br>

**Looking for developers for your project?**<br>
This project is maintained by Ramotion, Inc. We specialize in the designing and coding of custom UI for Mobile Apps and Websites.

<a href="mailto:alex.a@ramotion.com?subject=Project%20inquiry%20from%20Github"> 
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a> <br>

The [iPhone mockup](https://store.ramotion.com/product/iphone-x-clay-mockups?utm_source=gthb&utm_medium=special&utm_campaign=adaptive-tab-bar) available [here](https://store.ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=adaptive-tab-bar).

## Try this UI control in action

<a href="https://itunes.apple.com/app/apple-store/id1182360240?pt=550053&ct=gthb-adaptive-tab-bar&mt=8" > <img src="https://github.com/Ramotion/navigation-stack/raw/master/Download_on_the_App_Store_Badge_US-UK_135x40.png" width="170" height="58"></a>


## Tab Bar After Install
![Animation](http://i.imgur.com/7V6M7z6.png?1)

## Tab Bar After Two Weeks
![Animation](http://i.imgur.com/KTZIC4Z.png?1)

## Tab Bar After a Month
![Animation](http://i.imgur.com/TNQMGTf.png?1)

## Overview

AdaptiveController is module for adding custom states to Native or Custom UI elements. The UI elements evolve over time as the user becomes accustomed to them. An example AdaptiveTabBar is provided.

## How to import the control to your project

1. First, drag and drop the AdaptiveController project file into your project or select "add existing file" and choose the AdaptiveController project
2. Add AdaptiveController to your Target Dependences in the Build Phase of your project.
3. Add the AdaptiveController framework in Link Binary With Libraries in Build Phases
4. Import AdaptiveController where needed.

## Using AdaptiveController 

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

First, you should setup a dictionary for the extension of the image for each UI state:
		
```swift
    var imageExtensionsForStates:Dictionary = [ kSmallTitleAdaptiveState:"_smalltitle", kImageAdaptiveState:"_bigimage", kSmallTitleAdaptiveState+selected :"_smalltitle", kImageAdaptiveState+selected:"_bigimage" ]
```
 Then you should set the Appearance for each UITabBarItem title for each state, fonts for each state, a default image if you describe an extension for each state, or if you do not describe an extension, you should setup each image for each state.
 
 First, init the appearance object and setup the text for each state. If the text is the same for each state, you can set text for the default state:
 
```swift
    var watchAppearance = AdaptiveButtonAppearance(); 
    watchAppearance.setButonTitle("watch", state: kDefaultAdaptiveState)
    watchAppearance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
    watchAppearance.setButonTitle("", state: kImageAdaptiveState)
```

Then you should setup your fonts for each state:

```swift
    watchAppearance.setButonTitleFontForState(yourDefaultFont, state: kDefaultAdaptiveState)
    watchAppearance.setButonTitleFontForState(yourDefaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
```

Then you should set the default image and extensions for each state a function which automaticaly sets images for each state: 

```swift
    watchAppearance.setImageNamesForStatesImageExtesions("watch", imageExtensionsForState:imageExtensionsForStates)
```

Then you should setup the appearance insets for each state: 

```swift
    watchAppearance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
    watchAppearance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
    watchAppearance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
    watchAppearance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
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


This library is a part of a <a href="https://github.com/Ramotion/swift-ui-animation-components-and-libraries"><b>selection of our best UI open-source projects.</b></a>

## Licence

Adaptive tab bar is released under the MIT license.
See [LICENSE](./LICENSE.md) for details.

<br>

# Get the Showroom App for iOS to give it a try
Try this UI component and more like this in our iOS app. Contact us if interested.

<a href="https://itunes.apple.com/app/apple-store/id1182360240?pt=550053&ct=adaptive-tab-bar&mt=8" > 
<img src="https://github.com/ramotion/gliding-collection/raw/master/app_store@2x.png" width="117" height="34"></a>
<a href="mailto:alex.a@ramotion.com?subject=Project%20inquiry%20from%20Github"> 
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a>
<br>
<br>

Follow us for the latest updates<br>
<a href="https://goo.gl/rPFpid" >
<img src="https://i.imgur.com/ziSqeSo.png/" width="156" height="28"></a>

