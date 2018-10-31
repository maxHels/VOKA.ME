//
//  AboutViewController.swift
//  VOKA.ME
//
//  Created by Максим Руды on 10/27/18.
//  Copyright © 2018 Максим Руды. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    private var logoImageView: UIImageView!
    private var versionLabel: UILabel!
    private var titleLabel: UILabel!
    private var descriptionView: CardView!
    private var descriptionLabel: UILabel!
    private var buttonRow: UIStackView!
    private var fbBtn: UIButton!
    private var twitterBtn: UIButton!
    private var vkBtn: UIButton!
    private var mailBtn: UIButton!
    private var scrollView: UIScrollView!
    
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
        
        scrollView = setupScrollView()
        view.addSubview(scrollView)
        logoImageView = setupLogoImageView()
        scrollView.addSubview(logoImageView)
        titleLabel = setupTitleLabel()
        scrollView.addSubview(titleLabel)
        versionLabel = setupVersionLabel()
        scrollView.addSubview(versionLabel)
        descriptionView = setupDescriptionView()
        scrollView.addSubview(descriptionView)
        descriptionLabel = setupDescriptionLabel()
        scrollView.addSubview(descriptionLabel)
    }
    
    private func setupScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    private func setupLogoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "aboutvoka")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 24
        return imageView
    }
    
    private func setupTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VOKA.ME"
        return label
    }
    
    private func setupVersionLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "version 1.0.0"
        return label
    }
    
    private func setupDescriptionView() -> CardView {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func setupDescriptionLabel() -> UILabel {
        let label = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Всем привет, я рад видеть Вас на нашем сайте, посвященному всему вдохновляющему в окружающем нас мире./nЯ буду очень рад если Вы найдете для себя что то интересное на моем сайте, а так же я готов разместить Ваш материал. Для этого достаточно связаться со мной через контактную форму."
        return label
    }
    
    private func setupConstraints() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16).isActive = true
        
        versionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        
        descriptionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16).isActive = true
        descriptionView.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 16).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true

        descriptionLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: descriptionView.rightAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        //buttonRow.translatesAutoresizingMaskIntoConstraints = false
        //buttonRow.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 0).isActive = true
        //buttonRow.rightAnchor.constraint(equalTo: descriptionView.rightAnchor, constant: 0).isActive = true
        //buttonRow.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        //buttonRow.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
    }

}
