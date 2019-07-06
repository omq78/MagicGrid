//
//  ViewController.swift
//  MagicGrid
//
//  Created by Omar Alqabbani on 7/5/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewCells = [String: UIView]()
    let numberOfCellsPerRow = 15

    override func viewDidLoad() {
        super.viewDidLoad()

        let cellSize = self.view.frame.width / CGFloat(numberOfCellsPerRow)
        let numberOfCellsPerColumn = Int(self.view.frame.height / cellSize)

        for j in 0...numberOfCellsPerColumn {
            for i in 0...numberOfCellsPerRow - 1{
                let cell = UIView()
                cell.layer.borderWidth = 0.5
                cell.layer.borderColor = UIColor.black.cgColor
                cell.frame = CGRect(x: CGFloat(i) * cellSize, y: CGFloat(j) * cellSize, width: cellSize, height: cellSize)
                cell.backgroundColor = randomColor()
                view.addSubview(cell)
                let key = "\(i)|\(j)"
                viewCells[key] = cell
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }

    @objc func handlePan(gesture: UIPanGestureRecognizer){
        let cellSize = self.view.frame.width / CGFloat(numberOfCellsPerRow)
        let location = gesture.location(in: self.view)
        let i = Int(location.x / cellSize)
        let j = Int(location.y / cellSize)
        let locationKey = "\(i)|\(j)"
        let view = viewCells[locationKey]
        print(locationKey)
        view?.backgroundColor = UIColor.black
        
    }
    
    func randomColor()-> UIColor {
        let r = CGFloat(drand48()),
        g = CGFloat(drand48()),
        b = CGFloat(drand48())
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }

}

