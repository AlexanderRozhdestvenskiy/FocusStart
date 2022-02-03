//
//  Main+DataSource.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 03.02.2022.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard !tasks.isEmpty else { return UITableViewCell() }
        
        let cell = table.dequeueReusableCell(withIdentifier: MainViewCell.reuseID, for: indexPath) as! MainViewCell
        let task = tasks[indexPath.row]
        cell.configure(task: task)
        return cell
    }
}
