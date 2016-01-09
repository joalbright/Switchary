# Switchary

Simple library to create an assignment that works like a ternary operator mutated with a switch statement

<!--[![CI Status](http://img.shields.io/travis/Jo Albright/Switchary.svg?style=flat)](https://travis-ci.org/Jo Albright/Switchary)-->

[![Version](https://img.shields.io/cocoapods/v/Switchary.svg?style=flat)](http://cocoapods.org/pods/Switchary)
[![License](https://img.shields.io/cocoapods/l/Switchary.svg?style=flat)](http://cocoapods.org/pods/Switchary)
[![Platform](https://img.shields.io/cocoapods/p/Switchary.svg?style=flat)](http://cocoapods.org/pods/Switchary)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
enum AgeGroup: Int { case Baby, Toddler, Kid, Preteen, Teen, Adult }

enum LifeStatus: Int { case Alive, Dead, Zombie }

let life: LifeStatus? = .Zombie
```

Now that our variables are ready, we can play with the features.

First I want to show you how I wrote a switch assignment before. It was ok, but I don't like to settle for ok.

```swift
// embedded ternary operators ... old way of writing it

let _ = life == .Alive ? UIColor.yellowColor()
      : life == .Dead ? UIColor.redColor()
      : life == .Zombie ? UIColor.grayColor()
      : UIColor.greenColor()
```

The inline Switchary assignment makes this much more readable.

```swift
// Switchary assignment inline

// ??? starts the switch
// ||| seperates the cases
// *** is our default value

let _ = life ??? .Alive --> UIColor.yellowColor()
             ||| .Dead --> UIColor.redColor()
             ||| .Zombie --> UIColor.grayColor()
             *** UIColor.greenColor()
```

```swift
// Switchary Range

let _ = 21 ??? (0...3) --> AgeGroup.Baby
           ||| (4...12) --> AgeGroup.Kid
           ||| (13...19) --> AgeGroup.Teen
           *** AgeGroup.Adult
```

Currently I only support ranges, enums and basic types for the inline assignment. But I wanted to support all types of pattern matching. This closure assignment allows you to pass a value to match against and returns a value to be assigned.

```swift
// Switchary closure

let _ = life ??? {
    
    switch $0 {
    
    case .Alive: return UIColor.greenColor()
    case .Dead: return UIColor.redColor()
    case .Zombie: return UIColor.grayColor()
    
    }
    
}

let _ = 12 ??? {
    
    switch $0 {
        
    case 0..<10: return UIColor.clearColor()
    case let x where x < 20: return UIColor.yellowColor()
    case let x where x < 30: return UIColor.orangeColor()
    case let x where x < 40: return UIColor.redColor()
    default: return UIColor.whiteColor()
        
    }
    
}
```

Lastly there is an initializer protocol SwitchInit that takes a value and closure within the init. This allows for simple custom initialization based on the value pased in.

```swift
// Switchary Initalizer

extension UIView: SwitchInit { }

let button = UIButton (life) {
    
    switch $0 {
        
    case .Alive : $1.setTitle("Eat Lunch", forState: .Normal)
    case .Dead : $1.setTitle("Eat Dirt", forState: .Normal)
    case .Zombie : $1.setTitle("Eat Brains", forState: .Normal)
        
    }
 
}   
```
*TBH : I have not found a good use for this feature yet.*


<!--## Requirements-->

## Installation

Switchary is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Switchary"
```

Switchary is also available through [Swift Package Manager](https://swift.org/package-manager/). Please take a look at the link to learn more about how to use SPM.

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PACKAGE_NAME",
    dependencies: [
        .Package(url: "https://github.com/joalbright/Switchary.git", majorVersion: 0)
    ]
)
```

## Author

[Jo Albright](https://github.com/joalbright)

## License

Switchary is available under the MIT license. See the LICENSE file for more info.
