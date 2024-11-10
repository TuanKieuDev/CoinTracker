//
//  ProfileViewController+.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 21/10/2024.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 2 {
            return 1
        }
        return Constants.Profile.Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: GeneralInformationTableViewCell.self)
            
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CategoryInformationTableViewCell.self)
            cell.configData(category: Constants.Profile.Section.allCases[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: LogoutButtonTableViewCell.self)

            return cell
        }
    }
}
