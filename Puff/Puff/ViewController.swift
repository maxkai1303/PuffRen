//
//  ViewController.swift
//  Puff
//
//  Created by Max Kai on 2021/1/21.
//

import UIKit

class ViewController: UIViewController {

    enum MainCellType: Int {
        
        case map = 0
        
        case item
        
        case member
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
       
    }
    
    func setNavBar() {
        
        let barAppearance =  UINavigationBarAppearance()

        barAppearance.backgroundImage = UIImage(named: "navbar")

        barAppearance.backgroundColor = UIColor.red
        
        navigationController?.navigationBar.standardAppearance = barAppearance
        
    }

    @IBOutlet weak var homeTableView: UITableView! {
        
        didSet {
        
            homeTableView.registerNib(cell: HomeCellTableViewCell.self)
        }
    }
    
    let pic = [#imageLiteral(resourceName: "Map"), #imageLiteral(resourceName: "Product Item"), #imageLiteral(resourceName: "Member")]
    
    @objc func goToNextPage() {
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.reuse(cell: HomeCellTableViewCell.self, for: indexPath)

        cell.cellImage.image = pic[indexPath.row]

        cell.cellImage.tag = indexPath.row
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 180
    }
}

extension ViewController: UITableViewCellDelegate {
    
    func elementIsAction(value: Any) {
        
        guard let tag = value as? Int else { return }
        
        switch MainCellType(rawValue: tag) {
        
        case .map:
            
            performSegue(withIdentifier: "goMapSegue", sender: nil)
        
        case .item:
            
            performSegue(withIdentifier: "goMapSegue", sender: nil)
        
        case .member:
            
            performSegue(withIdentifier: "goMapSegue", sender: nil)
        
        case .none: break
        }
    }
}
