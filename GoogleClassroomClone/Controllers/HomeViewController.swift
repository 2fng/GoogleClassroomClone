//
//  SideBarViewController.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 11/07/2021.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapSideButton()
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public var classrooms: [Classroom] = [
        
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Ngoc Tu", subject: "Nguyen ly he dieu hanh"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Thanh Tan", subject: "Nhap mon tin hoc"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Ngo Hoang Huy", subject: "Nhap mon hoc may"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Be", subject: "Tieng Anh 2"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Tran Van Dinh", subject: "Khai Pha Du Lieu"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Can Duc Diep", subject: "Quan Tri Du An CNTT"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Thanh Tan", subject: "Tri tue nhan tao"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Ngo Hoang Huy", subject: "Cau truc du lieu va giai thuat"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Ngo Hoang Huy", subject: "Cau truc du lieu va giai thuat 2")
    ]
    
    private let tableView: UITableView = {
        
        let table = UITableView()
        table.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        return table
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classrooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let classroomCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        
        classroomCell.textLabel?.numberOfLines = 0
        classroomCell.configure(subjectText: classrooms[indexPath.row].subject, teacherName: classrooms[indexPath.row].teacherName)
        
        return classroomCell
    }
    

    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = nil
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        self.tableView.rowHeight = 140
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tableHeight = view.bounds.size.height - view.safeAreaInsets.bottom
        tableHeight -= view.safeAreaInsets.top
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: tableHeight)
    }
    
    private func configureNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .done, target: self, action: nil)
    }
    
    @objc func didTapSideButton() {
        delegate?.didTapSideButton()
    }
}
