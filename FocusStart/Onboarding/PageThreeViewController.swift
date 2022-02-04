//
//  PageThreeViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 28.01.2022.
//

import UIKit

class PageThreeViewController: UIViewController {
    
    let back = UIView()
    let imageGitHub = UIImageView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        back.translatesAutoresizingMaskIntoConstraints = false
        back.backgroundColor = .systemTeal
        back.layer.cornerRadius = 16
        
        imageGitHub.translatesAutoresizingMaskIntoConstraints = false
        imageGitHub.image = UIImage(named: "github")
        imageGitHub.contentMode = .scaleAspectFit
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "https://github.com/AlexanderRozhdestvenskiy/FocusStart"
    }
    
    private func layout() {
        view.addSubview(back)
        view.addSubview(imageGitHub)
        view.addSubview(label)
        
        back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        back.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        
        imageGitHub.topAnchor.constraint(equalTo: back.topAnchor, constant: 56).isActive = true
        imageGitHub.centerXAnchor.constraint(equalTo: back.centerXAnchor).isActive = true
        imageGitHub.widthAnchor.constraint(equalToConstant: 256).isActive = true
        imageGitHub.heightAnchor.constraint(equalToConstant: 256).isActive = true
        
        label.bottomAnchor.constraint(equalTo: back.bottomAnchor, constant: -32).isActive = true
        label.leadingAnchor.constraint(equalTo: back.leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: back.trailingAnchor, constant: -8).isActive = true
    }
}
