//
//  NewsViewController+.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 22/10/2024.
//

import Foundation
import UIKit

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: NewsTableViewCell.self)
        cell.configData(newsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        // Store the original background color
        let originalColor = cell?.contentView.backgroundColor
        
        // Flash animation: Change the background color briefly
        UIView.animate(withDuration: 0.1, animations: {
            cell?.contentView.backgroundColor = UIColor.lightGray
        }) { _ in
            // Revert back to the original color
            UIView.animate(withDuration: 0.1) {
                cell?.contentView.backgroundColor = originalColor
            }
        }
        
        // Deselect the cell after animation (optional)
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let url = URL(string: newsList[indexPath.row].url) else {
            print("Invalid URL")
            return
        }

        let webVC = CustomWebViewController()
        webVC.url = url  // Pass the URL to the WebViewController
        navigationController?.pushViewController(webVC, animated: true)
    }
}
