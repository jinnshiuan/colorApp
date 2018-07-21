//
//  ColorViewController.swift
//  color
//
//  Created by Jinnshiuan on 2018/7/19.
//  Copyright © 2018年 Molly. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorImageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var borderSlider: UISlider!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!

    @IBAction func sliderChangeColor(_ sender: UISlider) {
        colorImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        if sender == redSlider || sender == blueSlider || sender == greenSlider {
            redNumber.text = String(format:"%.2f",(redSlider.value))
            blueNumber.text = String(format:"%.2f",(blueSlider.value))
            greenNumber.text = String(format:"%.2f",(greenSlider.value))
        }
    }
    
    @IBAction func sliderRadius(_ sender: UISlider) {
        self.colorImageView.clipsToBounds = true
        self.colorImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
        self.shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    
    @IBAction func sliderShadow(_ sender: UISlider) {
        self.shadowView.layer.masksToBounds = false
        self.shadowView.layer.shadowOffset = CGSize(width:-1,height:1)
        self.shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadowView.layer.shadowOpacity = 0.8
        self.shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)
    }
    
    @IBAction func sliderBorder(_ sender: UISlider) {
        self.colorImageView.layer.borderColor = UIColor.white.cgColor
        self.colorImageView.layer.borderWidth = CGFloat(borderSlider.value)
        
    }
    
    @IBAction func sliderGradient(_ sender: UISlider) {
        let gradientLayer = CAGradientLayer()
        let locationTop = round(10*gradientSlider.value)/10
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.red.cgColor]
        gradientLayer.frame = self.gradientView.bounds
        gradientLayer.locations = [0.0,NSNumber(value: locationTop)]
        self.gradientView.layer.addSublayer(gradientLayer)

    }
    
    @IBAction func switchColor(_ sender: UISwitch) {
        if !redSwitch.isOn {
            redSlider.isEnabled = false;
        } else {
            redSlider.isEnabled = true;
        }
        if !greenSwitch.isOn {
            greenSlider.isEnabled = false;
        } else {
            greenSlider.isEnabled = true;
        }
        if !blueSwitch.isOn {
            blueSlider.isEnabled = false;
        } else {
            blueSlider.isEnabled = true;
        }
    }
    
    func initView(){
        self.colorImageView.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
