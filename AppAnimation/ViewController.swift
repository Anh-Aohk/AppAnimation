//
//  ViewController.swift
//  AppAnimation
//
//  Created by Phạm Anh Khoa on 07/09/2024.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    var imgIndex: Int = 1
    var isAnimating: Bool = false
    
    func updateImage() {
        print("goodnight-image/goodnight\(imgIndex)")
        imgGoodnight.image = UIImage(named: "goodnight-image/goodnight\(imgIndex)")
        
    }
    func starttimer () {
        timer = Timer.scheduledTimer(withTimeInterval: 0.0999, repeats: true) { timer in
            self.changeToNextImage(self.btnNextImage )
        }
    }
    func stoptimer() {
        timer?.invalidate()
        timer = nil
    }
    func startAnimation() {
        starttimer()
    }
    func pauseAnimation() {
        stoptimer()
    }
    func resetAnimation() {
        imgIndex = 1
        print("goodnight-image/goodnight1")
        imgGoodnight.image = UIImage(named: "goodnight-image/goodnight1")
        stoptimer()
        btnToggleAnimation.setTitle("Animation", for: .normal)
               //Màu nút: Xanh lá
        btnToggleAnimation.tintColor = .systemGreen
        isAnimating = true
    }
    @IBOutlet weak var btnNextImage: UIButton!
    @IBOutlet weak var imgGoodnight: UIImageView!
    
    @IBAction func changeToNextImage(_ sender: UIButton) {
        if (imgIndex >= 37){
            imgIndex = 1
        } else {
            imgIndex += 1
        }
        
        updateImage()
    }

    @IBOutlet weak var btnToggleAnimation: UIButton!
    @IBAction func toggleAnimation(_ sender: Any) {
        if (isAnimating) {
            startAnimation()
            isAnimating = false
            btnToggleAnimation.setTitle("Pause", for: .normal)
            btnToggleAnimation.tintColor = .systemOrange
        } else {
            pauseAnimation()
            isAnimating = true
            btnToggleAnimation.setTitle("Animation", for: .normal)
            btnToggleAnimation.tintColor = .systemGreen
        }
    }
    
    @IBAction func resetAnimation(_ sender: Any) {
        resetAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgIndex = 1
        updateImage()
        isAnimating = true
        btnToggleAnimation.tintColor = .systemGreen
        btnToggleAnimation.setTitle("Animation", for: .normal)
    }


}


