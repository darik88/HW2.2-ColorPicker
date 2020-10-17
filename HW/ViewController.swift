//
//  ViewController.swift
//  HW
//
//  Created by Айдар Рахматуллин on 17.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mixedColorView: UIView!
    @IBOutlet var redColorValueLabel: UILabel!
    @IBOutlet var greenColorValueLabel: UILabel!
    @IBOutlet var blueColorValueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mixedColorView.layer.cornerRadius = 10
        
        setupSlider(slider: redColorSlider)
        updateLabelValue(for: redColorSlider)
        
        setupSlider(slider: greenColorSlider)
        updateLabelValue(for: greenColorSlider)
        
        setupSlider(slider: blueColorSlider)
        updateLabelValue(for: blueColorSlider)
        
        setColorForView()
    }
    
    
    @IBAction func redColorSliderAction() {
        updateLabelValue(for: redColorSlider)
        setColorForView()
    }
    
    @IBAction func greenColorSliderAction() {
        updateLabelValue(for: greenColorSlider)
        setColorForView()
    }
    
    @IBAction func blueColorSliderAction() {
        updateLabelValue(for: blueColorSlider)
        setColorForView()
    }
    
    private func setupSlider(slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 1
        setSliderTrackTintColor(for: slider)
    }
    
    private func updateLabelValue(for slider: UISlider) {
        
        let sliderValue = String(format: "%.2f", slider.value)
        slider.value = Float(sliderValue) ?? slider.value
        
        switch slider {
        case redColorSlider:
            redColorValueLabel.text = "\(slider.value)"
        case greenColorSlider:
            greenColorValueLabel.text = "\(slider.value)"
        case blueColorSlider:
            blueColorValueLabel.text = "\(slider.value)"
        default:
            break
        }
    }
    
    private func setColorForView() {
        mixedColorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    private func setSliderTrackTintColor(for slider: UISlider) {
        switch slider {
        case redColorSlider:
            slider.minimumTrackTintColor = .red
        case greenColorSlider:
            slider.minimumTrackTintColor = .green
        case blueColorSlider:
            slider.minimumTrackTintColor = .blue
        default:
            break
        }
    }
}

