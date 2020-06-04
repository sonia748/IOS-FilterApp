//
//  ViewController.swift
//  FilterApp
//
//  Created by Sonia on 2020-06-04.
//  Copyright © 2020 Sonia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var BlurRadius: UISlider!
    
    
    // rounded corner buttons
    @IBOutlet weak var roundedCornerSepiaButton: UIButton!
    
    @IBOutlet weak var roundedCornerBlurBtn: UIButton!
    
    @IBOutlet weak var roundedCornerMonoBtn: UIButton!
    
    @IBOutlet weak var roundedcornerComicBtn: UIButton!
    
    @IBOutlet weak var roundedCornerMotionBtn: UIButton!
    
    @IBOutlet weak var roundedCornerPhotoBtn: UIButton!
    
    @IBOutlet weak var roundedCornerResetBtn: UIButton!
    
    
    
    
    var defaulting: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaulting = ImgView.image
    }
    
  // BoxBlur Button
    @IBAction func BtnBlurFilter(_ sender: UIButton) {
        
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputRadiusKey:BlurRadius.value]
        ApplyFilters(filterName: "CIBoxBlur", filterParams: filterParams)
    }
    
    
    
    @IBAction func sliderValue(_ sender: UISlider) {
    }
    
    
    // Sepia Button
    @IBAction func BtnSepiaFilter(_ sender: UIButton) {
        var rawImg = CIImage(image: ImgView.image!)
              var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputIntensityKey:BlurRadius.value]
              ApplyFilters(filterName: "CISepiaTone", filterParams: filterParams)
    }
    
    // Monochrome Button
    @IBAction func BtnMonoChromeFilter(_ sender: UIButton) {

        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputColorKey:GL_RED, kCIInputIntensityKey:BlurRadius.value]
        ApplyFilters(filterName: "CIColorMonochrome", filterParams: filterParams)
    }
    
    // Comic Button
    @IBAction func BtnComicFilter(_ sender: UIButton) {
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName: "CIComicEffect", filterParams: filterParams)
    }
    
    // MotionBlur Button
    @IBAction func BtnMotionBlurFilter(_ sender: UIButton) {
        
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
               ApplyFilters(filterName: "CIMotionBlur", filterParams: filterParams)
    }
    
    // PhotoEffect Button
    @IBAction func BtnPhotoEffectFilter(_ sender: UIButton) {
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, ]
               ApplyFilters(filterName: "CIPhotoEffectChrome", filterParams: filterParams)
        
    }
    
    // Reset Button
    @IBAction func ResetImg(_ sender: UIButton) {
        
        ImgView.image = defaulting
    }
    
    func ApplyFilters(filterName:String, filterParams: [String:Any]){
        var filter = CIFilter(name: filterName, parameters: filterParams)
        
        let context = CIContext(options: nil)
        
        if let output = filter?.outputImage{
            
            if var cgiResult = context.createCGImage(output, from: output.extent){
                
                ImgView.image = UIImage(cgImage: cgiResult)
            }
        }
        
        
        
        // Rounded Buttons
        roundedCornerSepiaButton.layer.cornerRadius = 15
        roundedCornerSepiaButton.layer.masksToBounds = true
        
        roundedCornerBlurBtn.layer.cornerRadius = 15
        roundedCornerBlurBtn.layer.masksToBounds = true
        
        roundedCornerMonoBtn.layer.cornerRadius = 15
        roundedCornerMonoBtn.layer.masksToBounds = true
        
        roundedcornerComicBtn.layer.cornerRadius = 15
        roundedcornerComicBtn.layer.masksToBounds = true
        
        roundedCornerMotionBtn.layer.cornerRadius = 15
        roundedCornerMotionBtn.layer.masksToBounds = true
        
        roundedCornerPhotoBtn.layer.cornerRadius = 15
        roundedCornerPhotoBtn.layer.masksToBounds = true
        
        roundedCornerResetBtn.layer.cornerRadius = 15
               roundedCornerResetBtn.layer.masksToBounds = true
    }
    
    
}



