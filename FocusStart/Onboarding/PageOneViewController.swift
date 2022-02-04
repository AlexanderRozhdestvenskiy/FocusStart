//
//  PageOneViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 28.01.2022.
//

import UIKit

class PageOneViewController: UIViewController {

    let back = UIView()
    let labelWelcome = UILabel()
    let labelBody = UILabel()

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
        
        labelWelcome.translatesAutoresizingMaskIntoConstraints = false
        labelWelcome.font = UIFont.preferredFont(forTextStyle: .title1)
        labelWelcome.numberOfLines = 0
        labelWelcome.textColor = .white
        labelWelcome.adjustsFontForContentSizeCategory = true
        labelWelcome.textAlignment = .center
        labelWelcome.text = "Добро пожаловать!"
        
        labelBody.translatesAutoresizingMaskIntoConstraints = false
        labelBody.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        labelBody.numberOfLines = 0
        labelBody.adjustsFontForContentSizeCategory = true
        labelBody.textColor = .white
        labelBody.textAlignment = .center
        labelBody.text = "Заметки"
    }
    
    private func layout() {
        view.addSubview(back)
        view.addSubview(labelWelcome)
        view.addSubview(labelBody)
        
        back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        back.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        
        labelWelcome.topAnchor.constraint(equalTo: back.topAnchor, constant: 48).isActive = true
        labelWelcome.leadingAnchor.constraint(equalTo: back.leadingAnchor, constant: 16).isActive = true
        labelWelcome.trailingAnchor.constraint(equalTo: back.trailingAnchor, constant: -16).isActive = true
        labelWelcome.bottomAnchor.constraint(equalTo: back.centerYAnchor).isActive = true
        
        labelBody.leadingAnchor.constraint(equalTo: back.leadingAnchor, constant: 16).isActive = true
        labelBody.trailingAnchor.constraint(equalTo: back.trailingAnchor, constant: -16).isActive = true
        labelBody.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 16).isActive = true
    }
}
