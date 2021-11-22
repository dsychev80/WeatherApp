//
//  ViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit

class ViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupLayoutConstraints()
    }

}

