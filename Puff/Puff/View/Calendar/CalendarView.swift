//
//  CalendarView.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/7.
//

import UIKit

protocol CalendarViewDataSource: AnyObject {
    
    func calendarView(_ view: CalendarView) -> CalendarManager
}

protocol CalendarViewDelegate: AnyObject {
    
    func calendarView(_ view: CalendarView, didSelect: IndexPath)
}

class CalendarView: UIView {
    
    weak var dataSource: CalendarViewDataSource? {
        
        didSet {
            
            setup()
        }
    }
    
    weak var delegate: CalendarViewDelegate?
    
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
    
    var collectionView: UICollectionView? {
        
        didSet {
            
            guard let collectionView = self.collectionView else { return }
            
            // 關閉自動計算約束
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            
            // 註冊 Nib
            
            let nibName = UINib(nibName: String(describing: CalendarCollectionViewCell.self), bundle: nil)
            
            collectionView.register(nibName, forCellWithReuseIdentifier: String(describing: CalendarCollectionViewCell.self))
            
            // 關閉垂直、水平滑桿
            
            collectionView.showsVerticalScrollIndicator = false
            
            collectionView.showsHorizontalScrollIndicator = false
            
            collectionView.delegate = self

            collectionView.dataSource = self
            
            collectionView.backgroundColor = .white
            
            addSubview(collectionView)
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
    
    func setup() {
        
        setupTitleView()

        setupTitleLabel()

        setupStackView()

        setupCollectionView()

        setupNextAndPrevButton()

        changeTitleLabel()
    }
    
    func changeTitleLabel() {
        
        guard let manager = dataSource?.calendarView(self) else { return }
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM YYYY"
        
        titleLabel.text = dateFormatter.string(from: manager.date)
    }
}

// MARK: - UICollectionView Data Sourece

extension CalendarView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        guard let manager = dataSource?.calendarView(self) else { return 0 }
        
        return manager.dateArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CalendarCollectionViewCell.self), for: indexPath) as! CalendarCollectionViewCell
        
        guard let manager = dataSource?.calendarView(self) else { return cell }
        
        let date = manager.dateArray[indexPath.row]
        
        cell.setup(date: date)
        
        return cell
    }
}

// MARK: - UICollectionView Delegate

extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let delegate = self.delegate, let dataSource = self.dataSource else {
            
            return
        }
        
        delegate.calendarView(self, didSelect: indexPath)
    }
}

// MARK: - UIButton selector function

extension CalendarView {
    
    @objc func nextMonth() {
        
        guard let manager = dataSource?.calendarView(self) else { return }
        
        manager.date.changeMonth(.next)
        
        changeTitleLabel()
        
        collectionView?.reloadData()
    }
    
    @objc func prevMonth() {
        
        guard let manager = dataSource?.calendarView(self) else { return }
        
        manager.date.changeMonth(.prev)
        
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
        
        // collectionView layout
        
        let layout = UICollectionViewFlowLayout()
        
        let size = CGSize(width: UIScreen.width / 7, height: 50)
        
        layout.itemSize = size
        
        layout.minimumInteritemSpacing = 0
        
        layout.minimumLineSpacing = 5
        
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        
        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView!.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView!.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
}
