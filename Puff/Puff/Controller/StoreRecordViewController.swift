//
//  RecordViewController.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/3/8.
//

import UIKit

class StoreRecordViewController: UIViewController {
    
    @IBOutlet weak var calendarView: CalendarView! {
        
        didSet {
            
            calendarView.dataSource = self
            
            calendarView.delegate = self
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let calendarManager = CalendarManager(date: Date())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension StoreRecordViewController: CalendarViewDataSource {
    
    func calendarView(_ view: CalendarView) -> CalendarManager {
        
        return calendarManager
    }
}

extension StoreRecordViewController: CalendarViewDelegate {
    
    func calendarView(_ view: CalendarView, didSelect: IndexPath) {
        
        print(#function, didSelect)
    }
}

extension StoreRecordViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

extension StoreRecordViewController: UITableViewDelegate {
    
    
}
