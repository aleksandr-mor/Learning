//
//  ViewController.swift
//  InterviewChallengeMVVM
//
//  Created by Aleksandr Morozov on 21.03.2022.
//

import UIKit

class EmployeesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    lazy var viewModel = {
        EmployeesViewModel()
    }()
    
    // ...
    
    func initViewModel() {
        viewModel.getEmployees()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }

    func initView() {
        // TableView customization
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1))
        tableView.separatorColor = .white
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false

        tableView.register(EmployeeCell.nib, forCellReuseIdentifier: EmployeeCell.identifier)
    }

    func initViewModel() {
        /* Add code later */
    }
}

// MARK: - UITableViewDelegate

extension EmployeesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - UITableViewDataSource

extension EmployeesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifier, for: indexPath) as? EmployeeCell else { fatalError("xib does not exists") }
               let cellVM = viewModel.getCellViewModel(at: indexPath)
               cell.cellViewModel = cellVM
               return cell
    }
}

