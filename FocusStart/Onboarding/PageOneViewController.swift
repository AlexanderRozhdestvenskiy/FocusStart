//
//  PageOneViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 28.01.2022.
//

import UIKit

class PageOneViewController: UIViewController {

    let back = UIView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        back.translatesAutoresizingMaskIntoConstraints = false
        back.backgroundColor = .secondarySystemBackground
        back.layer.cornerRadius = 16
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "Первый"
    }
    
    private func layout() {
        view.addSubview(back)
        view.addSubview(label)
        
        back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        back.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        
        label.centerXAnchor.constraint(equalTo: back.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: back.centerYAnchor).isActive = true
    }
}
