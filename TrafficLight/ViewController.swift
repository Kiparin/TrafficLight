//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexey Kiparin on 22.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redViewLight: UIView!
    @IBOutlet weak var yellowViewLight: UIView!
    @IBOutlet weak var greenViewLight: UIView!
    @IBOutlet weak var trafficLightCarcas: UIView!
    @IBOutlet weak var trafficStart: UIButton!
    
    private var trafficLightIndicator = [false ,false ,false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trafficLightCarcas.layer.cornerRadius = trafficLightCarcas.frame.height / 6
        trafficLightCarcas.layer.masksToBounds = true
        
        redViewLight.layer.cornerRadius = redViewLight.frame.height / 2
        redViewLight.layer.masksToBounds = true
        redViewLight.alpha = 0.3
        
        yellowViewLight.layer.cornerRadius = yellowViewLight.frame.height / 2
        yellowViewLight.layer.masksToBounds = true
        yellowViewLight.alpha = 0.3
        
        greenViewLight.layer.cornerRadius = greenViewLight.frame.height / 2
        greenViewLight.layer.masksToBounds = true
        greenViewLight.alpha = 0.3
        
        trafficStart.layer.cornerRadius = trafficStart.frame.height / 6
        trafficStart.layer.masksToBounds = true
        trafficStart.setTitle("Start", for: .normal)
        trafficStart.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        trafficStart.addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside])
        
    }

    @objc func buttonPressed() {
            UIView.animate(withDuration: 0.1) {
                self.trafficStart.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
            }
        }

    @objc func buttonReleased() {
            UIView.animate(withDuration: 0.1) {
                self.trafficStart.transform = CGAffineTransform.identity
            }
        }
    
    @IBAction func nextLightColorDidOn(_ sender: UIButton) {
        trafficStart.setTitle("Next", for: .normal)
        
        switch trafficLightIndicator {
        case [true, false, false]:
            setNewColor(false, true, false, 0.3, 0.9, 0.3)
        case [false, true, false]:
            setNewColor(false, false, true, 0.3, 0.3, 0.9)
        case [false, false, true]:
            setNewColor(true, false, false, 0.9, 0.3, 0.3)
        default:
            setNewColor(true, false, false, 0.9, 0.3, 0.3)
        }
    }
    
    private func setNewColor(_ red: Bool, _ yellow: Bool, _ green: Bool, _ redAlpha: CGFloat, _ yellowAlpha: CGFloat, _ greenAlpha: CGFloat) {
        trafficLightIndicator[0] = red
        trafficLightIndicator[1] = yellow
        trafficLightIndicator[2] = green
        UIView.animate(withDuration: 0.5, animations: {
                    self.redViewLight.alpha = redAlpha
                    self.yellowViewLight.alpha = yellowAlpha
                    self.greenViewLight.alpha = greenAlpha
                })
    }
}

