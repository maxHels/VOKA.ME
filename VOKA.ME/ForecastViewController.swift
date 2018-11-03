//
//  SecondViewController.swift
//  VOKA.ME
//
//  Created by Максим Руды on 10/26/18.
//  Copyright © 2018 Максим Руды. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    
    @IBOutlet weak var forecastBtn: UIButton!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var labelContainer: CardView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelContainer.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    func setForecastText(){
//        UIView.transition(with: view, duration: 2.0, options: .showHideTransitionViews, animations: {
//            self.labelContainer.isHidden = false
//        })
        UIView.animate(withDuration: 1.5, delay: 1.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .showHideTransitionViews, animations: {
            self.labelContainer.isHidden = false
        }, completion: nil)
        var forecasts = ["Если Вы проявите инициативу, успех не заставит себя ждать.","Ваши надежды и планы сбудутся сверх всяких ожиданий.","Вам пора отдохнуть.","Вам предлагается мечта всей жизни. Скажите да!","Вас ждет приятный сюрприз.","Время – ваш союзник, лучше отложить принятие важного решения хотя бы на день.","Время и терпение,  вас ждут много сюрпризов!","Время осушит все слезы и исцелит все раны."]
        let randomInt = Int.random(in: 0..<forecasts.count)
        forecastLabel.text = forecasts[randomInt]
    }
    
    @IBAction func setForecast(_ sender: UIButton) {
        animateForecast()
        setForecastText()
    }
    
    var centerConstraint:NSLayoutConstraint?
    var bottomConstraints:NSLayoutConstraint?
    
    private func setupConstraints(){
        labelContainer.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.widthAnchor.constraint(equalToConstant: 250).isActive = true
        labelContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        labelContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        forecastLabel.translatesAutoresizingMaskIntoConstraints = false
        forecastLabel.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
        forecastLabel.leftAnchor.constraint(equalTo: labelContainer.leftAnchor).isActive = true
        forecastLabel.rightAnchor.constraint(equalTo: labelContainer.rightAnchor).isActive = true
        forecastLabel.lineBreakMode = .byWordWrapping
        forecastLabel.numberOfLines = 0
        forecastLabel.textAlignment = NSTextAlignment.center
        forecastLabel.sizeToFit()
        forecastLabel.frame.size.width = labelContainer.frame.size.width
        
        forecastBtn.translatesAutoresizingMaskIntoConstraints = false
        centerConstraint = forecastBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        forecastBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        forecastBtn.layer.cornerRadius = 20
        centerConstraint?.isActive = true
        forecastBtn.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    }
    
    private func animateForecast(){
        centerConstraint?.isActive = false
        bottomConstraints = forecastBtn.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -forecastBtn.frame.height-32)
        bottomConstraints?.isActive = true
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}


