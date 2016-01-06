//
//  ViewController.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//

import UIKit
import Switchary

enum LifeStatus { case Alive, Dead, Zombie }

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let life: LifeStatus? = .Dead
        
        // embedded ternary operators ... old way of writing it
        let _ = life == .Alive ? UIColor.greenColor()
              : life == .Dead ? UIColor.redColor()
              : life == .Zombie ? UIColor.grayColor()
              : UIColor.whiteColor()
        
        // switchary inline
        let _ = life ??? .Alive --> UIColor.greenColor()
                     ||| .Dead --> UIColor.redColor()
                     ||| .Zombie --> UIColor.grayColor()
    
        
        // switchary closure
        let _ = 12 ??? {
            
            switch $0 {
                
            case 0..<10: return UIColor.clearColor()
            case let x where x < 20: return UIColor.yellowColor()
            case let x where x < 30: return UIColor.orangeColor()
            case let x where x < 40: return UIColor.redColor()
            default: return UIColor.whiteColor()
                
            }
            
        }
        
        
        
    }

}

