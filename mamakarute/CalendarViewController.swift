//
//  CalendarViewController.swift
//  mamakarute
//
//  Created by 武久　直幹 on 2022/07/15.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController {
    
    var editBarButtonItem: UIBarButtonItem!
    var addBarButtonItem: UIBarButtonItem!
    
    var recordList: [DailyCondition] = []
    var childList: [ChildProfile] = []
    

    
    @IBOutlet weak var calendarView: FSCalendar!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addButton(_ sender: UIButton) {
        transitionToEditorView()
    }
    
    @IBOutlet weak var childNameLabel: UILabel!
    
    
    @IBOutlet weak var childIconImageView: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "calendar"
        
        
        configureCalendar()
        
        
        let realm = try! Realm()
        let result = realm.objects(ChildProfile.self).value(forKey: "name")
        
        childNameLabel.text = String(describing: result)
        
        print("\(String(describing: result))")
        self.title = "カレンダー画面"
                self.view.backgroundColor = .white
                
        
        editBarButtonItem = UIBarButtonItem(title: "編集", style: .done, target: self, action: #selector(editBarButtonTapped(_:)))
        addBarButtonItem = UIBarButtonItem(title: "追加", style: .done, target: self, action: #selector(addBarButtonTapped(_:)))
        
        self.navigationItem.rightBarButtonItems = [editBarButtonItem]
        self.navigationItem.leftBarButtonItems = [addBarButtonItem]
        calendarView.dataSource = self
        calendarView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRecord()
        calendarView.reloadData()
    }
    
    func configureCalendar() {
        // ヘッダーの日付フォーマット変更
        calendarView.appearance.headerDateFormat = "yyyy年MM月dd日"
        
        // 曜日と今日の色指定
        calendarView.appearance.todayColor = .systemPink
        calendarView.appearance.headerTitleColor = .systemPink
        calendarView.appearance.weekdayTextColor = .black
        // 曜日表示内容を変更
        calendarView.calendarWeekdayView.weekdayLabels[0].text = "日"
        calendarView.calendarWeekdayView.weekdayLabels[1].text = "月"
        calendarView.calendarWeekdayView.weekdayLabels[2].text = "火"
        calendarView.calendarWeekdayView.weekdayLabels[3].text = "水"
        calendarView.calendarWeekdayView.weekdayLabels[4].text = "木"
        calendarView.calendarWeekdayView.weekdayLabels[5].text = "金"
        calendarView.calendarWeekdayView.weekdayLabels[6].text = "土"
        
        calendarView.calendarWeekdayView.weekdayLabels[0].textColor = .red
        calendarView.calendarWeekdayView.weekdayLabels[6].textColor = .blue
        
    }
    
    func transitionToEditorView(with record: DailyCondition? = nil) {
        let storyboard = UIStoryboard(name: "EditorViewController", bundle: nil)
        guard let editorViewcontroller = storyboard.instantiateInitialViewController() as? EditorViewController else { return }
        if let record = record {
            editorViewcontroller.record = record
        }
        present(editorViewcontroller, animated: true)
    }
    
    func transitionToSignUpView() {
    let storyboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
    guard let signUpViewController = storyboard.instantiateInitialViewController() as? SignUpViewController else { return }
    present(signUpViewController, animated: true)
    }
    
    @objc func editBarButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        print("1110")
        transitionToSignUpView()
    }
    
    func getRecord() {
        let realm = try! Realm()
        recordList = Array(realm.objects(DailyCondition.self))
        childList = Array(realm.objects(ChildProfile.self))
    }
    
}

extension CalendarViewController: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateList = recordList.map({ $0.date })
        let isEqualDate = dateList.contains(date.zeroclock)
        return isEqualDate ? 1 : 0
    }
}

extension CalendarViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let record = recordList.first(where: { $0.date.zeroclock == date.zeroclock }) else { return }
        transitionToEditorView(with: record)
    }
}

