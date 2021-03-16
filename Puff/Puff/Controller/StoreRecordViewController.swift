//
//  RecordViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/3/8.
//

import UIKit

class StoreRecordViewController: BaseViewController {
    
    @IBOutlet weak var calendarView: CalendarView! {
        
        didSet {
            
            calendarView.dataSource = self
            
            calendarView.delegate = self
            
            calendarView.backButton.addTarget(self, action: #selector(backToPreviousView), for: .touchUpInside)
            
            calendarView.editButton.addTarget(self, action: #selector(editData), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    @IBOutlet weak var recordView: UIView!
    
    let calendarManager = CalendarManager(date: Date())
    
    override var hideNavigationBar: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func editData() {
        
        print("edit data")
    }
}

// MARK: - Calendar view data source

extension StoreRecordViewController: CalendarViewDataSource {
    
    func calendarView(_ view: CalendarView) -> CalendarManager {
        
        return calendarManager
    }
}

// MARK: - Calendar view delegate

extension StoreRecordViewController: CalendarViewDelegate {
    
    func calendarView(_ view: CalendarView, didSelect: IndexPath) {
        
        let day = calendarManager.dateArray[didSelect.row]
        
        let date = calendarManager.transformData(from: day)
        
        print(date)
    }
}

// MARK: - UITableView data source

extension StoreRecordViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreRecordTableViewCell", for: indexPath)
        
        return cell
    }
}

extension StoreRecordViewController: UITableViewDelegate {

}
