//
//  ViewController.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//

import UIKit
import Switchary

extension UIView: SwitchInit { }

enum LifeStatus: Int { case Alive, Dead, Zombie }
enum AgeGroup: Int { case Baby, Toddler, Kid, Preteen, Teen, Adult }

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let life: LifeStatus = .Dead
        
        // embedded ternary operators ... old way of writing it
//        let _ = life == .Alive ? UIColor.greenColor()
//            : life == .Dead ? UIColor.redColor()
//            : life == .Zombie ? UIColor.grayColor()
//            : UIColor.whiteColor()
        
        // Switchary assignment inline
        
        let _ = life ??? .Alive --> UIColor.greenColor()
                     ||| .Dead --> UIColor.redColor()
                     ||| .Zombie --> UIColor.grayColor()
                     *** UIColor.magentaColor()
        
        
        // Switchary assignment closure
        
        let _ = life ??? {
            
            switch $0 {
                
            case .Alive: return UIColor.greenColor()
            case .Dead: return UIColor.redColor()
            case .Zombie: return UIColor.grayColor()
                
            }
            
        }
        
        // Switchary Range
        
        let _ = 21 ??? (0...3) --> AgeGroup.Baby
                   ||| (4...12) --> AgeGroup.Kid
                   ||| (13...19) --> AgeGroup.Teen
                   *** AgeGroup.Adult
        
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
        
        // Switchary initializer
        
        let button = UIButton (life) {
            
            switch $0 {
                
            case .Alive : $1.setTitle("Eat Lunch", forState: .Normal)
            case .Dead : $1.setTitle("Eat Dirt", forState: .Normal)
            case .Zombie : $1.setTitle("Eat Brains", forState: .Normal)
                
            }
            
        }
        
        view.addSubview(button)
        
    }

}

