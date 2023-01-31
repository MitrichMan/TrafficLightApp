//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by Dmitrii Melnikov on 30.01.2023.
//

import UIKit

final class  ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.none
    
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    private enum CurrentLight {
        case none, red, yellow, green
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    @IBAction func startButtonTapped() {
        if startButton.currentTitle == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redLightView.alpha = lightOff
            yellowLightView.alpha = lightOn
            currentLight = .yellow
        case .yellow:
            yellowLightView.alpha = lightOff
            greenLightView.alpha = lightOn
            currentLight = .green
        case .green:
            greenLightView.alpha = lightOff
            redLightView.alpha = lightOn
            currentLight = .red
        default:
            redLightView.alpha = lightOn
            currentLight = .red
        }
    }
}

