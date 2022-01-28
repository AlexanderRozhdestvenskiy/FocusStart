//
//  PageTwoViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 28.01.2022.
//

import UIKit

class PageTwoViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 32
        
        view.addSubview(label)
        label.text = "2"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
