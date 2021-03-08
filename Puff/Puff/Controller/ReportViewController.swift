//
//  ReportViewController.swift
//  Puff
//
//  Created by Max Kai on 2021/3/7.
//

import UIKit

class ReportViewController: UIViewController {
    
    
    @IBOutlet weak var reportTableView: UITableView! {
        
        didSet {
            
            reportTableView.registerNib(cell: ReportTableViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.reuse(cell: ReportTableViewCell.self, for: indexPath)
        
        return cell
    }
    
    
    
}
