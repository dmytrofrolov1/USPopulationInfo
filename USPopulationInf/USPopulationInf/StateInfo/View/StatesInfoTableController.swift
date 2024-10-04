//
//  StatesInfoTableController.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import UIKit

class StatesInfoTableController: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    
    private weak var tableView: UITableView?
    private var data: [StateInfoViewModel]?
    
    required
    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .leastNormalMagnitude
        }
        
        registerCells()
    }
    
    private func registerCells() {
        tableView?.register(StateInfoTableViewCell.self,
                            forCellReuseIdentifier: StateInfoTableViewCell.reuseIdentifier)
    }
    
    func reload(data: [StateInfoViewModel]) {
        self.data = data
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StateInfoTableViewCell.reuseIdentifier, for: indexPath) as? StateInfoTableViewCell, let model = data?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.update(model: model)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
}
