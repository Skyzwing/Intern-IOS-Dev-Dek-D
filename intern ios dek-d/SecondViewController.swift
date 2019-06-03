//
//  SecondViewController.swift
//  intern ios dek-d
//
//  Created by Surachat Yaitammasan on 31/5/2562 BE.
//  Copyright © 2562 Surachat Yaitammasan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var keepTitle: String?
    var keepDetail: String?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = keepTitle
        labelDesc.text = keepDetail
    }
    

}
