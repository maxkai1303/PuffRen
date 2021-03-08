//
//  CalendarView.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/7.
//

import UIKit

class CalendarView: UIView {
    
    var calendarManager: CalendarManager
    
    lazy var titleView: UIView = {
       
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        
        addSubview(view)
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.backgroundColor = .clear
        
        label.textAlignment = .center
    
        titleView.addSubview(label)
        
        return label
    }()
    
    lazy var nextMonthButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .clear
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(scale: .large)
        
        let image = UIImage(systemName: "chevron.right", withConfiguration: symbolConfig)
        
        button.setImage(image, for: .normal)
        
        button.addTarget(self, action: #selector(nextMonth), for: .touchUpInside)
        
        titleView.addSubview(button)
        
        return button
    }()
    
    lazy var prevMonthButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .clear
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(scale: .large)
        
        let image = UIImage(systemName: "chevron.left", withConfiguration: symbolConfig)
        
        button.setImage(image, for: .normal)
        
        button.addTarget(self, action: #selector(prevMonth), for: .touchUpInside)
        
        titleView.addSubview(button)
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.alignment = .fill
        
        stack.axis = .horizontal
        
        stack.distribution = .fillEqually
        
        addSubview(stack)
        
        return stack
    }()
    
    var collectionView: UICollectionView?
    
    init(origin: CGPoint, calenderManager: CalendarManager = CalendarManager(date: Date())) {
    
        self.calendarManager = calenderManager
    
        super.init(frame: CGRect(origin: origin, size: CGSize(width: UIScreen.main.bounds.width, height: 380)))

        setupTitleView()
        
        setupTitleLabel()
        
        setupStackView()
        
        setupCollectionView()
        
        setupNextAndPrevButton()
        
        changeTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeTitleLabel() {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM YYYY"
        
        titleLabel.text = dateFormatter.string(from: calendarManager.date)
    }
}

// MARK: - UICollectionView Data Sourece

extension CalendarView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return calendarManager.dateArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CalendarCollectionViewCell.self), for: indexPath) as! CalendarCollectionViewCell
        
        let date = calendarManager.dateArray[indexPath.row]
        
        cell.setup(date: date)
        
        return cell
    }
}

// MARK: - UICollectionView Delegate

extension CalendarView: UICollectionViewDelegate {
    
}

// MARK: - UIButton selector function

extension CalendarView {
    
    @objc func nextMonth() {
        
        calendarManager.date.changeMonth(.next)
        
        changeTitleLabel()
        
        collectionView?.reloadData()
        
    }
    
    @objc func prevMonth() {
        
        calendarManager.date.changeMonth(.prev)
        
        changeTitleLabel()
        
        collectionView?.reloadData()
    }
}

// MARK: - Set up all userinterface

extension CalendarView {
    
    // TitleLabel
    
    func setupTitleView() {
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleView.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupTitleLabel() {
        
        layoutIfNeeded()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleView.frame.height)
        ])
    }
    
    func setupNextAndPrevButton() {
        
        layoutIfNeeded()
        
        NSLayoutConstraint.activate([
            nextMonthButton.topAnchor.constraint(equalTo: titleView.topAnchor),
            nextMonthButton.leftAnchor.constraint(equalTo: titleLabel.rightAnchor),
            nextMonthButton.heightAnchor.constraint(equalToConstant: 40),
            nextMonthButton.widthAnchor.constraint(equalToConstant: 40),
            prevMonthButton.topAnchor.constraint(equalTo: titleView.topAnchor),
            prevMonthButton.rightAnchor.constraint(equalTo: titleLabel.leftAnchor),
            prevMonthButton.heightAnchor.constraint(equalToConstant: 40),
            prevMonthButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    // Week Labels in StackView
    
    func setupStackView() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        addWeekLabel()
    }
    
    func addWeekLabel() {
        
        for weekText in ["日", "一", "二", "三", "四", "五", "六"] {
            
            let label = UILabel()
            
            label.textAlignment = .center
            
            label.textColor = .black
            
            label.text = weekText
            
            stackView.addArrangedSubview(label)
        }
    }
    
    // CollectionView
    
    func setupCollectionView() {
        
        // 先更新畫面，才可以取得 stackView 裡 label 的 size
        
        layoutIfNeeded()
        
        // collectionView layout
        
        let layout = UICollectionViewFlowLayout()
        
        let size = CGSize(width: stackView.arrangedSubviews[0].frame.width, height: 50)
        
        layout.itemSize = size
        
        layout.minimumInteritemSpacing = 0
        
        layout.minimumLineSpacing = 5
        
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        // UICollectionView
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let nibName = UINib(nibName: String(describing: CalendarCollectionViewCell.self), bundle: nil)
        
        collectionView.register(nibName, forCellWithReuseIdentifier: String(describing: CalendarCollectionViewCell.self))
        
        collectionView.delegate = self

        collectionView.dataSource = self
        
        collectionView.backgroundColor = .white
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
}
