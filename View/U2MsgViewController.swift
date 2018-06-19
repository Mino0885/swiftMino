//
//  U2MsgViewController.swift
//  Mino
//
//  Created by Mino on 2018/6/19.
//  Copyright © 2018年 Mino. All rights reserved.
//

import UIKit

class U2MsgViewController: UIViewController {
    private lazy var toolBar: UIView = {
        let toolBar = UIView()
        toolBar.backgroundColor = UIColor.init(red: 29/255, green: 139/255, blue: 241/255, alpha: 1)
        return toolBar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.view.addSubview(toolBar)
        let imgview = UIImageView(image: #imageLiteral(resourceName: "Image"))
        self.view.addSubview(imgview)
        toolBar.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
            make.width.equalTo(self.view)
        }
        imgview.snp.makeConstraints { (make) in
            make.top.equalTo(toolBar.snp.bottom)
            make.bottom.width.equalToSuperview()
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
