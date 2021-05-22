//
//  UserDetailsVC.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import UIKit
import SafariServices

class UserDetailsVC: BaseViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: UIConstants.textCellIdentifier)
            tableView.setdefaults()
        }
    }
    let viewModel = UserDetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navbarTitleText = "User Details"
        viewModel.delegate = self
    }
    
    func updateUser(user: User) {
        viewModel.user = user
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

extension UserDetailsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount(forSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIConstants.textCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UIConstants.textCellIdentifier) else {
            fatalError("failed to create cell \(UIConstants.textCellIdentifier)")
        }
        viewModel.formatCell(cell: cell, forIndexpath: indexPath)
        return cell
    }
}

extension UserDetailsVC: UITableViewDelegate {
    
}

extension UserDetailsVC: UserDetailsViewModelDelegate {
    func showWebSite(url: String) {
        if let url = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}
