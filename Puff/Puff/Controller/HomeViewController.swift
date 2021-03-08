//
//  HomeViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.registerNib(cell: HomeTableViewCell.self)
        }
    }
    
    private struct Segue {
        
        static let map = "SegueToMap"
        
        static let item = "SegueToItem"
        
        static let member = "SegueToMember"
    }
    
    let dataProvider = HomeDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Navbar"))
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return HomeDataProvider.DataType.allCases.count
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.reuse(cell: HomeTableViewCell.self, for: indexPath)
        
        let data = dataProvider.postData(index: indexPath.section)
        
        cell.setup(data.0, data.1)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch HomeDataProvider.DataType.allCases[indexPath.section] {
        
        case .map: performSegue(withIdentifier: Segue.map, sender: nil)
            
        case .item: performSegue(withIdentifier: Segue.item, sender: nil)
        
        case .member: performSegue(withIdentifier: Segue.member, sender: nil)
            
        }
    }
}
