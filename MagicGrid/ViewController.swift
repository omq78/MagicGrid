//
//  ViewController.swift
//  MagicGrid
//
//  Created by Omar Alqabbani on 7/5/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let numberOfCellsPerRow = 15
        let cellWidth = self.view.frame.width / CGFloat(numberOfCellsPerRow)
        let cellHeight = cellWidth
        let numberOfCellsPerColumn = Int(self.view.frame.height / cellHeight)

        for j in 0...numberOfCellsPerColumn {
            for i in 0...numberOfCellsPerRow - 1{
                let cell = UIView()
                cell.layer.borderWidth = 0.5
                cell.layer.borderColor = UIColor.black.cgColor
                cell.frame = CGRect(x: CGFloat(i) * cellWidth, y: CGFloat(j) * cellHeight, width: cellWidth, height: cellHeight)
                cell.backgroundColor = randomColor()
                view.addSubview(cell)
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }

    @objc func handlePan(gesture: UIPanGestureRecognizer){
        print(gesture.location(in: self.view))
    }
    
    func randomColor()-> UIColor {
        let r = CGFloat(drand48()),
        g = CGFloat(drand48()),
        b = CGFloat(drand48())
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }

}

