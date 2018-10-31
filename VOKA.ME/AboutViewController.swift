//
//  AboutViewController.swift
//  VOKA.ME
//
//  Created by Максим Руды on 10/27/18.
//  Copyright © 2018 Максим Руды. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buttonRow: UIStackView!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var vkBtn: UIButton!
    @IBOutlet weak var mailBtn: UIButton!
    

    @IBAction func openMailApp(_ sender: Any) {
        let email = "foo@bar.com"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func openLink(link: String){
        if let url = URL(string: link) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    @IBAction func openFb(_ sender: UIButton) {
        openLink(link: "https://www.facebook.com/groups/584911458372978/")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    @IBAction func openTwitter(_ sender: UIButton) {
        openLink(link: "https://twitter.com/voka_me")
    }
    @IBAction func openVk(_ sender: Any) {
        openLink(link: "https://vk.com/vokame")
    }
    
    @IBAction func openMail(_ sender: Any) {
        let email = "dzmitry.arlou@gmail.com"
        openLink(link: "mailto:\(email)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        logoImageView.layer.masksToBounds = true
        logoImageView.layer.cornerRadius = 8
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16).isActive = true
        
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        descriptionView.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 16).isActive = true

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: descriptionView.rightAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 16).isActive = true
        
        buttonRow.translatesAutoresizingMaskIntoConstraints = false
        buttonRow.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 0).isActive = true
        buttonRow.rightAnchor.constraint(equalTo: descriptionView.rightAnchor, constant: 0).isActive = true
        buttonRow.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        buttonRow.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
    }

}
