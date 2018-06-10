//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class ProfessorListController: UIViewController {
    private lazy var _view: ProfessorListView = view as! ProfessorListView
    private let viewModel: ProfessorListViewModel = ProfessorListViewModel()

    //MARK: - Overridden functions
    override func loadView() {
        super.loadView()
        view = ProfessorListView(frame: UIScreen.main.bounds)
        _view.tableView.delegate = self.viewModel
        _view.tableView.dataSource = self.viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Professors"
        loadDataSource()
    }
}

extension ProfessorListController {
    private func loadDataSource() {
        viewModel.getDataSource(completion: {[weak self] (result) in
            switch result {
            case .success(let s):
                DispatchQueue.main.async {
                    self?.viewModel.professors = s
                    self?._view.tableView.reloadData()
                }
            case .failure(let r):
                debugPrint(r.localizedDescription)
            }
        })
    }
}
