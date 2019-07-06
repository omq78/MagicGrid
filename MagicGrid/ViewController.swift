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

    var currentCell: UIView?
    
    @objc func handlePan(gesture: UIPanGestureRecognizer){
        let cellSize = self.view.frame.width / CGFloat(numberOfCellsPerRow)
        let location = gesture.location(in: self.view)
        let i = Int(location.x / cellSize)
        let j = Int(location.y / cellSize)
        let locationKey = "\(i)|\(j)"
//        guard let lastCell = self.currentCell else {return}
        guard let selectedCell = viewCells[locationKey] else {return}
        if currentCell != nil {
            if currentCell != selectedCell {
                shrnkCell(v: currentCell!)
            }
        }
        scaleCell(v: selectedCell)
        currentCell = selectedCell
        if gesture.state == UIGestureRecognizer.State.ended {
            shrnkCell(v: selectedCell)
        }
    }
    
    private func scaleCell(v: UIView){
        self.view.bringSubviewToFront(v)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            v.layer.transform = CATransform3DMakeScale(3, 3, 3)
        }, completion: nil)
    }
    
    private func shrnkCell(v: UIView){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            v.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    
    func randomColor()-> UIColor {
        let r = CGFloat(drand48()),
        g = CGFloat(drand48()),
        b = CGFloat(drand48())
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }

}

