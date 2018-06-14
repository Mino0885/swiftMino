//
//  MyView.swift
//  Mino
//
//  Created by Mino on 2018/6/13.
//  Copyright © 2018年 Mino. All rights reserved.
//

import UIKit

class LoginController: UIViewController,UITextFieldDelegate {

    //用户名label
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.gray
        label.text = "NAME"
        label.textAlignment = .center
//        label.backgroundColor = UIColor.blue
        label.sizeToFit()
        return label
    }()
    
    //pwd label
    private lazy var pwdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.gray
        label.text = "PWD"
        label.textAlignment = .center
//        label.backgroundColor = UIColor.blue
        label.sizeToFit()
        return label
    }()
    
    //用户名 Text
    private lazy var nameText: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.alpha = 0.5
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        return textField
    }()

    //pwdText
    private lazy var pwdText: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.alpha = 0.5
        textField.textContentType = UITextContentType.password
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
       
        return textField
    }()
    //提交按钮
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        button.setTitle("LOGIN", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        
        return button
    }()
    
    private lazy var gestrue: UITapGestureRecognizer = {
        let gestrue = UITapGestureRecognizer()
        gestrue.numberOfTapsRequired = 1
        gestrue.numberOfTapsRequired = 1
        gestrue.addTarget(self, action: #selector(textFieldShouldReturn_Tap))
        return gestrue
    }()
    //背景图片
    private lazy var imageView = UIImageView(image: #imageLiteral(resourceName: "IMG_2697"))
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //背景图片
        self.view.addSubview(imageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameText)
        self.view.addSubview(pwdLabel)
        self.view.addSubview(pwdText)
        self.view.addSubview(submitButton)
        self.view.addGestureRecognizer(gestrue)
        
        
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(self.view)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(220)
            make.left.equalTo(50)
        }
        nameLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        pwdLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel).offset(150)
            make.centerX.equalTo(nameLabel.snp.centerX)
        }
        pwdLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        nameText.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(40)
            make.right.equalTo(-50)
            make.centerY.equalTo(nameLabel)
        }
        
        pwdText.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(40)
            make.right.equalTo(-50)
            make.centerY.equalTo(pwdLabel)
        }
        
        submitButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-150)
        }
    }
    
    @objc private func submitAction(_ sender:UIButton){
        let alertContoller = UIAlertController(title: "确定信息", message: "确认信息无误", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "确认", style: .default) { (action) in
          self.navigationController?.pushViewController(MainController(), animated: true)
            
        }
        let noAction = UIAlertAction(title: "NO!!!", style: .cancel, handler: nil)
        alertContoller.addAction(alertAction)
        alertContoller.addAction(noAction)
        if let ppc = alertContoller.popoverPresentationController{
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        present(alertContoller, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldShouldReturn_Tap(_ sender: AnyObject) {
        nameText.resignFirstResponder()
        pwdText.resignFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
}
