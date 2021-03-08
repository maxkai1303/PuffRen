//
//  AddCarViewController.swift
//  Puff
//
//  Created by Max Kai on 2021/3/7.
//

import UIKit

struct CarItem {
    
    let name: String
    
    let image: UIImage
    
    let price: String
    
   // 有需要 init 嗎？
}

class AddCarViewController: UIViewController {
    
    
    @IBOutlet weak var addCarTableView: UITableView! {
        
        didSet {
            
            addCarTableView.registerNib(cell: AddCarTableViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

extension AddCarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.reuse(cell: AddCarTableViewCell.self, for: indexPath)
        
        return cell
    }
    
    
}
