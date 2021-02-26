//
//  ItemViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

struct ItemData {
    
    let name: String
    
    let image: UIImage
    
    init(name: String, imageName: String) {
        
        self.name = name
        
        if let image = UIImage(named: imageName) {
            
            self.image = image
            
        } else {
            
            self.image = UIImage()
        }
    }
}

class ItemViewController: BaseViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl! {
        
        didSet {
            
            segmentedControl.addTarget(self, action: #selector(collectionViewAnimation), for: .valueChanged)
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.registerNib(cell: ItemCollectionViewCell.self)
        }
    }
    
    private struct Segue {

        static let detail = "SegueToItemDetail"
    }
    
    enum SegmentedControlState: Int {
        
        case general = 0
        
        case delivery
    }
    
    var items: [ItemData] = [
        ItemData(name: "巧克力泡芙", imageName: "Dark Chocolate Cream Puff"),
        ItemData(name: "Oreo泡芙", imageName: "Oreo Cookie Puff With Tiramisu"),
        ItemData(name: "草莓泡芙", imageName: "Strawberry Of The World"),
        ItemData(name: "香草奶油焦糖泡芙", imageName: "Caramel Puff With Vanilla Cream"),
        ItemData(name: "香草奶油泡芙", imageName: "Eclair With Vanilla Cream"),
        ItemData(name: "檸檬餡泡芙", imageName: "Lemon Tart Cream Puff"),
        ItemData(name: "香草奶油泡芙", imageName: "Original Puff With Vanilla Cream"),
    ]
    
    var state: SegmentedControlState {
        
        return SegmentedControlState.init(rawValue: segmentedControl.selectedSegmentIndex) ?? .general
    }
    
    override var navigationBarTitle: String {
        
        return "商品列表"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.detail {
            
            guard let itemDetailViewController = segue.destination as? ItemDetailViewController,
                  let selectedRow = collectionView.indexPathsForSelectedItems?[0].row
            else {
                return
            }
            
            itemDetailViewController.itemData = items[selectedRow]
        }
    }
    
    // SegmentControl 切換頁面的動畫
    
    @objc func collectionViewAnimation() {
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.15, delay: 0, options: .curveEaseInOut) {
            
            self.collectionView.x = .moveTo(.rightOutside(self.collectionView))
            
        } completion: { _ in
            
            self.collectionView.x = .moveTo(.leftOutside)
            
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
                
                self.collectionView.center.x = .moveTo(.center)
                
            } completion: { (_) in }
        }
    }
}

extension ItemViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.reuse(cell: ItemCollectionViewCell.self, for: indexPath)
        
        let data = items[indexPath.row]
        
        cell.setup(name: data.name, image: data.image)
        
        return cell
    }
}

extension ItemViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch state {

        case .general:

            performSegue(withIdentifier: Segue.detail, sender: nil)

        case .delivery:

            performSegue(withIdentifier: Segue.detail, sender: nil)
        }
    }
}

extension ItemViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let row: CGFloat = 2
        
        let column: CGFloat = 3
        
        let space: CGFloat = 24.0
        
        return CGSize(width: (collectionView.width - space) / row,
                      height: collectionView.height / column)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 24
    }
}
