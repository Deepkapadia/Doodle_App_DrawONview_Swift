//
//  ViewController.swift
//  Doodle_App_(DrawONview)_Swift4
//
//  Created by DeEp KapaDia on 28/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var ViewCanvas: UIView!
    
    var path = UIBezierPath()
    var  startPoint = CGPoint()
    var touchPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewCanvas.clipsToBounds = true
        ViewCanvas.isMultipleTouchEnabled = false
      
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let point = touch?.location(in: ViewCanvas) {
            
            startPoint = point
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if let point = touch?.location(in: ViewCanvas) {
            
            touchPoint = point
            
        }
        
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        //call draw
        
        draw()
        
    }
    
    func draw(){
        
        let strokelayer = CAShapeLayer()
        
        strokelayer.fillColor = nil
        strokelayer.lineWidth = 3
        strokelayer.strokeColor = UIColor.black.cgColor
        strokelayer.path = path.cgPath
        ViewCanvas.layer.addSublayer(strokelayer)
        ViewCanvas.setNeedsDisplay()
        
        
    }
    
    @IBAction func ClearBTN(_ sender: UIButton) {
        
        path.removeAllPoints()
        ViewCanvas.layer.sublayers = nil
        ViewCanvas.setNeedsDisplay()
        
        
        
    }
    
}

