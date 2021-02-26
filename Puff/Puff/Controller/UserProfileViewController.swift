//
//  UserProfileViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class UserProfileViewController: BaseViewController {

    typealias DataProvider = UserProfileDataProvider
    
    @IBOutlet weak var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.registerNib(cell: UserProfileCollectionViewCell.self)
            
            collectionView.registerNib(cell: FeatureCollectionViewCell.self)
            
            collectionView.registerHeaderNib(reusableView: FeatureHeaderCollectionReusableView.self, type: .header)
        }
    }
    
    override var navigationBarTitle: String {
        
        return "會員頁面"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigation()
    }
}

extension UserProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return DataProvider.DataType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch DataProvider.DataType.allCases[section] {
        
        case .userProfile: return 1
        
        case .memberFeature: return DataProvider.MemberFeature.allCases.count
            
        case .storeFeature: return DataProvider.StoreFeature.allCases.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch DataProvider.DataType.allCases[indexPath.section] {
        
        case .userProfile:
            
            let cell = collectionView.reuse(cell: UserProfileCollectionViewCell.self, for: indexPath)
            
            cell.setup()
            
            return cell
        
        case .memberFeature(_, let featureNames):
            
            let cell = collectionView.reuse(cell: FeatureCollectionViewCell.self, for: indexPath)
            
            cell.setup(name: featureNames[indexPath.row].rawValue)
            
            return cell
            
        case .storeFeature(_, let featureNames):
            
            let cell = collectionView.reuse(cell: FeatureCollectionViewCell.self, for: indexPath)
            
            cell.setup(name: featureNames[indexPath.row].rawValue)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView = collectionView.reuseView(view: FeatureHeaderCollectionReusableView.self, kind: kind, for: indexPath)

        switch DataProvider.DataType.allCases[indexPath.section] {
        
        case .userProfile: break
            
        case .memberFeature(let title, _):
            
            reusableView.setup(title)
            
        case .storeFeature(let title, _):
            
            reusableView.setup(title)
        }
    
        return reusableView
    }
}

extension UserProfileViewController: UICollectionViewDelegate {
}

extension UserProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        switch DataProvider.DataType.allCases[section] {
        
        case .userProfile:
            
            return CGSize(width: 0, height: 0)
            
        case .storeFeature, .memberFeature:
            
            return CGSize(width: collectionView.width, height: 45)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch DataProvider.DataType.allCases[indexPath.section] {
        
        case .userProfile:
            
            let headerHeight: CGFloat = 150
            
            return CGSize(width: collectionView.width, height: headerHeight)
        
        case .storeFeature, .memberFeature:
            
            let space: CGFloat = 8
            
            let count: CGFloat = 3
            
            let width = collectionView.width / count - space
            
            return CGSize(width: width, height: width*0.75)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
}
