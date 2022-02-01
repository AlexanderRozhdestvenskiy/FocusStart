//
//  InfoViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 29.01.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        title = "Инфо"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Задача"
        textField.layer.cornerRadius = 8
    }
    
    private func layout() {
        view.addSubview(textField)
        
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}
