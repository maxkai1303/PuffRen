//
//  UserProfileViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class UserProfileViewController: BaseViewController {
    
    typealias DataProvider = UserProfileDataProvider
    
    typealias SectionHeader = UserProfileDataProvider.SectionHeaderData
    
    struct Segue {
        
        static let record = "SegueToRecord"
        
        static let edit = "SegueToEdit"
        
        static let event = "SegueToEvent"
        
        static let memberQuickResponseCode = "SegueToMemberQuickResponseCode"
        
        static let stateReport = "SegueToStateReport"
        
        static let storeRecord = "SegueToStoreRecord"
        
        static let storeQuickResponseCode = "SegueToStoreQuickResponseCode"
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.registerNib(cell: UserProfileCollectionViewCell.self)
            
            collectionView.registerNib(cell: FeatureCollectionViewCell.self)
            
            collectionView.registerHeaderNib(reusableView: FeatureHeaderCollectionReusableView.self, type: .header)
        }
    }

    var loginStatus: UserProfileDataProvider.LoginStatus = .store
    
    override var navigationBarTitle: String { return "會員頁面" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigation()
    }
}


// MARK: - UICollectionView Data Source

extension UserProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 { return 1 }
        
        switch loginStatus {
        
        case .member:
            
            return DataProvider.MemberFeature.allCases.count
            
        case .store:
            
            return DataProvider.StoreFeature.allCases.count
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            let cell = collectionView.reuse(cell: UserProfileCollectionViewCell.self, for: indexPath)
            
            cell.setup()
            
            return cell
        }
        
        let cell = collectionView.reuse(cell: FeatureCollectionViewCell.self, for: indexPath)
        
        switch loginStatus {
        
        case .member:
            
            let featureName = DataProvider.MemberFeature.allCases[indexPath.row].rawValue
            
            cell.setup(name: featureName)
            
            return cell
            
        case .store:
            
            let featureName = DataProvider.StoreFeature.allCases[indexPath.row].rawValue
            
            cell.setup(name: featureName)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView = collectionView.reuseView(view: FeatureHeaderCollectionReusableView.self, kind: kind, for: indexPath)
        
        if indexPath.section != 0 {
            
            switch loginStatus {
            
            case .member:
                
                reusableView.setup(DataProvider.MemberFeature.title)
                
            case .store:
                
                reusableView.setup(DataProvider.StoreFeature.title)
            }
        }
    
        return reusableView
    }
}


// MARK: - UICollectionView Delegate

extension UserProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch loginStatus {
        
        case .member:
            
            switch DataProvider.MemberFeature.allCases[indexPath.row] {
                
            case .record:
                
                performSegue(withIdentifier: Segue.record, sender: nil)
                
            case .edit:
                
                performSegue(withIdentifier: Segue.edit, sender: nil)
                
            case .event:
                
                performSegue(withIdentifier: Segue.event, sender: nil)
                
            case .quickResponseCode:
                
                performSegue(withIdentifier: Segue.memberQuickResponseCode, sender: nil)
            }
            
        case .store:
            
            switch DataProvider.StoreFeature.allCases[indexPath.row] {
                
            case .stateReport:
                
                performSegue(withIdentifier: Segue.stateReport, sender: nil)
                
            case .recordReport:
                
                performSegue(withIdentifier: Segue.storeRecord, sender: nil)
                
            case .quickResponseCode:
                
                performSegue(withIdentifier: Segue.storeQuickResponseCode, sender: nil)
            }
        }
    }
}


// MARK: - UICollectionView Delegate Flow Layout

extension UserProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        switch DataProvider.SectionHeaderData.allCases[section] {
        
        case .userProfile:
            
            return CGSize(width: 0, height: 0)
            
        case .storeFeature, .memberFeature:
            
            return CGSize(width: collectionView.width, height: 45)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch DataProvider.SectionHeaderData.allCases[indexPath.section] {
        
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
