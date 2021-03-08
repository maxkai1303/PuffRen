//
//  BaseViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

class BaseViewController: UIViewController {

    var hideNavigationBackButton: Bool { return false }
    
    var hideNavigationBar: Bool { return false }
    
    var navigationBarTitle: String {
        
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        setupNavigation()
    }
    
    func setupNavigation() {
        
        let barAppearance = UINavigationBarAppearance()
        
        barAppearance.backgroundColor = .main
        
        navigationController?.navigationBar.standardAppearance = barAppearance
        
        self.navigationItem.hidesBackButton = hideNavigationBackButton
        
        self.navigationController?.isNavigationBarHidden = hideNavigationBar
        
        self.navigationController?.title = navigationBarTitle
    }

    func addBackButton(frame: CGRect = CGRect(x: 20, y: 55, width: 46, height: 46), backgroundColor: UIColor = .main) {
        
        let backButton = UIButton(frame: frame)
        
        let symbolConfig = UIImage.SymbolConfiguration(scale: .large)
        
        let image = UIImage(systemName: "chevron.backward", withConfiguration: symbolConfig)
        
        backButton.setImage(image, for: .normal)
        
        backButton.tintColor = .text
        
        backButton.backgroundColor = backgroundColor
        
        backButton.contentMode = .scaleAspectFit
        
        backButton.cutRound()
        
        backButton.addTarget(self, action: #selector(backToPreviousView), for: .touchUpInside)
        
        self.view.addSubview(backButton)
    }
    
    @objc func backToPreviousView() {
        
        navigationController?.popViewController(animated: true)
    }
}
