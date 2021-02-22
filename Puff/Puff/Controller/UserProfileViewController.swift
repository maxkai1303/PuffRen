//
//  UserProfileViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class UserProfileViewController: UIViewController {

    typealias dataProvider = UserProfileDataProvider
    
    @IBOutlet weak var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.registerNib(cell: UserProfileCollectionViewCell.self)
            
            collectionView.registerNib(cell: FeatureCollectionViewCell.self)
            
            collectionView.registerHeaderNib(reusableView: FeatureHeaderCollectionReusableView.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UserProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return dataProvider.DataType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch dataProvider.DataType(rawValue: section) {
        
        case .userProfile: return 1
        
        case .memberFeature: return dataProvider.MemberFeature.allCases.count
            
        case .storeFeature: return dataProvider.StoreFeature.allCases.count
            
        case .none: return 0
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cell = collectionView.reuse(cell: <#T##T.Type#>, for: <#T##IndexPath#>)
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
}
