//
//  ViewController.swift
//  Timer
//
//  Created by 김영욱 on 2022/05/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer : Timer?
    var number: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUI()
        
    }
    
    func settingUI( ){
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        timer = nil
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 밸류값을 가지고 메인레이블의 텍스트를 셋팅
        
        number = Int(sender.value * 60)
        mainLabel.text = "남은 시간 : \(number)초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
        timer?.invalidate()
        //        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // 반복을 하고 싶은 코드
            
            if number > 0{
                number -= 1
                // 슬라이더 표시
                slider.setValue(Float(number) / 60.0, animated: true)
                // 레이블표시도 다시 표시
                mainLabel.text = "남은 시간 : \(number)초"
                
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                // 소리추가
                AudioServicesPlaySystemSound(SystemSoundID(1322))
                
            }
            
        }
        
    }
    
    @objc func doSomethingAfter1Second(){
        if number > 0{
            number -= 1
            // 슬라이더 표시
            slider.setValue(Float(number) / 60.0, animated: true)
            // 레이블표시도 다시 표시
            mainLabel.text = "남은 시간 : \(number)초"
            
            
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            // 소리추가
            AudioServicesPlaySystemSound(SystemSoundID(1322))
            
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화셋팅
        settingUI()
        
    }
    
    
}

