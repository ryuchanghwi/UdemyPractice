//
//  NewsListTableVIewController.swift
//  GoodNewsMVVM
//
//  Created by 류창휘 on 2022/06/24.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "")
        
        WebService().getArticles(url: <#T##URL#>, completion: <#T##([Any]?) -> ()#>)
    }
}
