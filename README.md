# Switchary

<!--[![CI Status](http://img.shields.io/travis/Jo Albright/Switchary.svg?style=flat)](https://travis-ci.org/Jo Albright/Switchary)-->

[![Version](https://img.shields.io/cocoapods/v/Switchary.svg?style=flat)](http://cocoapods.org/pods/Switchary)
[![License](https://img.shields.io/cocoapods/l/Switchary.svg?style=flat)](http://cocoapods.org/pods/Switchary)
[![Platform](https://img.shields.io/cocoapods/p/Switchary.svg?style=flat)](http://cocoapods.org/pods/Switchary)

## Roadmap

- Perfomance enhancements for Switchary operators (Range, enum, etc)
- More pattern matching inline (currently only Range and enum)
- More closure options for assignment
- Min, Max assignment using Range
- Protocol for switch based initializer (my imagination is just starting on this)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
enum LifeStatus { case Alive, Dead, Zombie }

let life: LifeStatus? = .Dead

// embedded ternary operators ... old way of writing it
let _ = life == .Alive ? UIColor.greenColor()
      : life == .Dead ? UIColor.redColor()
      : life == .Zombie ? UIColor.grayColor()
      : UIColor.whiteColor()

// Switchary assignment inline
let _ = life ??? .Alive --> UIColor.greenColor()
             ||| .Dead --> UIColor.redColor()
             ||| .Zombie --> UIColor.grayColor()


// Switchary assignment closure
let _ = life ??? {
    
    switch $0 {
        
    case .Alive: return UIColor.greenColor()
    case .Dead: return UIColor.redColor()
    case .Zombie: return UIColor.grayColor()
        
    }
    
}

enum AgeGroup { case Baby, Toddler, Kid, Preteen, Teen, Adult }

// Switchary Range
let _ = 21 ??? 0...1 --> .Baby
           ||| 2...4 --> .Toddler
           ||| 5...10 --> .Kid
           ||| 11...12 --> .Preteen
           ||| 13...19 --> .Teen
           ||| 20...100 --> .Adult

// closure pattern matching
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

<!--## Requirements-->

## Installation

Switchary is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Switchary"
```

## Author

[Jo Albright](https://github.com/joalbright)

## License

Switchary is available under the MIT license. See the LICENSE file for more info.
