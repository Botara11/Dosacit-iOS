//
//  Indice.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 26/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit

class Indice: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scroller: UIScrollView!
    
//    @IBOutlet var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroller.userInteractionEnabled = true
       scroller.contentSize = CGSizeMake(320, 800)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

