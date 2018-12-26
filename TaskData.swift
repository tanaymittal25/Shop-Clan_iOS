//
//  TaskData.swift
//  Task Manager
//
//  Created by CAMSMAC on 13/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class TaskData: UICollectionViewCell {
    
    var taskName = UILabel()
    var view = UIView()
    var date = UILabel()
    var time = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        addSubview(view)
        
        taskName.frame = CGRect(x: 10, y: 5, width: frame.size.width, height: 20)
        view.addSubview(taskName)
        //taskName.layer.borderColor = UIColor.darkGray.cgColor
        //taskName.layer.borderWidth = 0.3
        
        date.frame = CGRect(x: 10, y: taskName.frame.origin.y + taskName.frame.size.height + 10, width: frame.size.width, height: 20)
        view.addSubview(date)
        
        time.frame = CGRect(x: 10, y: date.frame.origin.y + date.frame.size.height + 10, width: frame.size.width, height: 20)
        view.addSubview(time)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
