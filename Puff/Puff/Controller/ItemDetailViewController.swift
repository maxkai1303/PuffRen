//
//  ItemDetailViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class ItemDetailViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.registerNib(cell: ItemDetailTableViewCell.self)
        }
    }
    
    @IBOutlet weak var addTrollyButton: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var itemData: ItemData?
    
    override var hideNavigationBar: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton()
        
        setupItemImage()
        
        fixHeaderViewHeight()
    }
    
    func setupItemImage() {
        
        guard let itemData = itemData else { return }
        
        imageView.image = itemData.image
    }
    
    func fixHeaderViewHeight() {
        
        headerView.height = tableView.height * 0.75
    }
}

extension ItemDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.reuse(cell: ItemDetailTableViewCell.self, for: indexPath)
        
        cell.setup(item: itemData)
        
        return cell
    }
}

extension ItemDetailViewController: UITableViewDelegate {
    
}
