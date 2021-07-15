//
//  HomeTableViewCell.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 15/07/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet var mySubjectText: UILabel!
    @IBOutlet var myTeacherName: UILabel!
    @IBOutlet var cellView: UIView!
    
    static let identifier = "HomeTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    public func configure(subjectText: String, teacherName: String) {
        mySubjectText.text = subjectText
        mySubjectText.font = UIFont.boldSystemFont(ofSize: 25)
        myTeacherName.text = teacherName
        cellView.backgroundColor = UIColor.random
        cellView.layer.cornerRadius = 10
        cellView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
