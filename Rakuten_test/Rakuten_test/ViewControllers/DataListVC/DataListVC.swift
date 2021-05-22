//
//  DataListVC.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import UIKit

class DataListVC: BaseViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerCell(cellType: UserCell.self)
            tableView.registerCell(cellType: ButtonCell.self)
            tableView.setdefaults()
        }
    }
    
    let viewModel = DataListViewModel()
    private var isNextVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navbarTitleText = "Repositories"
        viewModel.delegate = self
        viewModel.callFetchUsers()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension DataListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.nextUrl == nil {
            return viewModel.users.count
        }
        return viewModel.users.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < viewModel.users.count {
            return UserCell().cellHeight
        }
        return ButtonCell().cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < viewModel.users.count {
            let user = viewModel.users[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.cellIdentifier()) as? UserCell else {
                fatalError("failed to create cell userCell")
            }
            viewModel.formatCell(cell: cell, user: user)
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.cellIdentifier()) as? ButtonCell else {
            fatalError("failed to create cell userCell")
        }
        cell.btn.setTitle("Next", for: .normal)
        cell.delegate = self
        return cell
    }
}

extension DataListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row < viewModel.users.count {
            showDetailsVC(user: viewModel.users[indexPath.row])
        }
    }
}


extension DataListVC: DataListViewModelDelegate {
    func loadUsers(lastIndex: Int) {
        var newRows = [IndexPath]()
        for row in lastIndex..<viewModel.users.count {
            newRows.append(IndexPath(row: row, section: 0))
        }
        if viewModel.nextUrl != nil && !isNextVisible {
            newRows.append(IndexPath(row: lastIndex+newRows.count, section: 0))
            isNextVisible = true
        }
        DispatchQueue.main.async { [unowned self] in
            tableView.beginUpdates()
            tableView.insertRows(at: newRows, with: .automatic)
            if viewModel.nextUrl == nil && isNextVisible {
                tableView.deleteRows(at: [IndexPath(row: viewModel.users.count, section: 0)], with: .automatic)
                isNextVisible = false
            }
            tableView.endUpdates()
        }
    }
    
    func showDetailsVC(user: User) {
        if let detailsVC = UIHelper.vcFromSB(from: .main, withIdentifier: UserDetailsVC.vcIdentifier) as? UserDetailsVC {
            detailsVC.updateUser(user: user)
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }

}

extension DataListVC: ButtonCellDelegates {
    func buttonClick() {
        viewModel.callFetchUsers()
    }
}
