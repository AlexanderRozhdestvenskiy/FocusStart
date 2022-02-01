//
//  ViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 29.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let tasks = ["Один", "Два", "Три", "Четыре", "Пять", "Шесть", "Семь", "Восемь", "Девять", "Десять", "Одиннадцать", "Двеннадцать"]
    
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        table.delegate = self
        table.dataSource = self
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        title = "Заметки"
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(tappedAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(tappedInfo))
    }
    
    private func layout() {
        view.addSubview(table)
        
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MainViewController {
    @objc private func tappedAdd(_ sender: UIBarButtonItem) {
        let nav = UINavigationController(rootViewController: DetailViewController())
        navigationController?.present(nav, animated: true, completion: nil)
    }
    
    @objc private func tappedInfo(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(InfoViewController(), animated: true)
    }
}
