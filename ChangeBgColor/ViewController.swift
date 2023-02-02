//
//  ViewController.swift
//  ChangeBgColor
//
//  Created by Piotr Wesołowski on 02/02/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
        
        changeBackgroundColor()
    }

    private func changeBackgroundColor(_ color: UIColor = .red) {
        view.backgroundColor = color
    }
    
    private func calculateColor(_ point: CGPoint) {
        let redValue = ((point.y / UIScreen.main.bounds.height))
        let greenValue = ((point.x / UIScreen.main.bounds.height))
        
        print("Red: \(redValue) Green: \(greenValue)")
        
        let calculatedColor = UIColor(red: redValue, green: greenValue, blue: 255, alpha: 1)
        changeBackgroundColor(calculatedColor)
    }
    
    @objc
    private func didPan(_ sender: UIPanGestureRecognizer) {
        calculateColor(sender.location(in: view))
    }
}

