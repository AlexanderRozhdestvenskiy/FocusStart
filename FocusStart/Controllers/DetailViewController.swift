//
//  DetailViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 29.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        title = "Добавить"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tap))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tap))
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "   Задача"
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .secondarySystemBackground
    }
    
    private func layout() {
        view.addSubview(textField)
        
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}

extension DetailViewController {
    @objc private func tap(_ sender: UIButton) {
        
    }
}
