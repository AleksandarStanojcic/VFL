//
//  ViewController.swift
//  VFL
//
//  Created by Aleksandar Stanojcic on 2/28/17.
//  Copyright © 2017 Aleksandar Stanojcic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var upperLeft: UIView!
    var middle: UIView!
    var bottomRight: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        constrainViews()
    }

    func createViews() {
        
        upperLeft = UIView()
        upperLeft.translatesAutoresizingMaskIntoConstraints = false
        upperLeft.backgroundColor = UIColor.red
        view.addSubview(upperLeft)
        
        middle = UIView()
        middle.translatesAutoresizingMaskIntoConstraints = false
        middle.backgroundColor = UIColor.green
        view.addSubview(middle)
        
        bottomRight = UIView()
        bottomRight.translatesAutoresizingMaskIntoConstraints = false
        bottomRight.backgroundColor = UIColor.yellow
        view.addSubview(bottomRight)
        
    }
    
    func constrainViews() {
        
        let horizontalGap = 7
        let verticalGap = 22
        let cubeSize = 51
        
        var constraints: [NSLayoutConstraint] = []
        
        let metrics = ["horizontalGap": horizontalGap, "verticalGap": verticalGap, "tall": cubeSize, "wide": cubeSize]
        let views: [String : UIView] = ["upperLeft": upperLeft, "middle": middle, "bottomRight": bottomRight]
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[upperLeft(wide)]-(horizontalGap)-[middle(wide)]-(horizontalGap)-[bottomRight(wide)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[upperLeft(tall)]-(verticalGap)-[middle(tall)]-(verticalGap)-[bottomRight(tall)]", options: [], metrics: metrics, views:views))
        constraints.append(middle.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(middle.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}
