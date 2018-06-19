//
//  MainController.swift
//  Mino
//
//  Created by Mino on 2018/6/15.
//  Copyright © 2018年 Mino. All rights reserved.
//

import UIKit

class MainController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let arry:[String] = ["用户1", "用户2", "用户3"]
    //模拟导航栏
    private lazy var toolBar: UIView = {
        let toolBar = UIView()
        toolBar.backgroundColor = UIColor.init(red: 29/255, green: 139/255, blue: 241/255, alpha: 1)
        return toolBar
    }()
    
    //右上角图标
    private lazy var addButton: UIButton = {
        let button = UIButton()
        //        button.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        button.setBackgroundImage(#imageLiteral(resourceName: "etp"), for: UIControlState.normal)
        return button
    }()
    
    //站点信息view
    private lazy var infoView: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    // 站点名称
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "A K A X I N"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        
        label.sizeToFit()
        return label
    }()
    
    //站点地址
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "mino.site"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        
        label.sizeToFit()
        return label
    }()
    
    //单击事件
    private lazy var gestrue: UITapGestureRecognizer = {
        let gestrue = UITapGestureRecognizer()
        gestrue.numberOfTapsRequired = 1
        gestrue.numberOfTapsRequired = 1
        gestrue.addTarget(self, action: #selector(changeSite))
        return gestrue
    }()
    
    //背景颜色
    private lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return view
    }()
    
    //表单
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        tableView.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(toolBar)
        toolBar.addSubview(addButton)
        
        toolBar.addSubview(infoView)
        infoView.addSubview(nameLabel)
        infoView.addSubview(addressLabel)
        infoView.addGestureRecognizer(gestrue)
        
        
        self.view.addSubview(backView)
        self.view.addSubview(tableView)
        
        toolBar.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
            make.width.equalTo(self.view)
        }
        addButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(toolBar.snp.bottom).offset(-22)
            make.right.equalTo(-40)
        }
        
        infoView.snp.makeConstraints { (make) in
            make.centerX.equalTo(toolBar)
            make.centerY.equalTo(toolBar.snp.bottom).offset(-22)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(infoView)
            make.top.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()
        }
        
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalTo(infoView)
            make.bottom.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()
        }
       
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(toolBar.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(toolBar.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    @objc func changeSite(_ sender: AnyObject) {
        print("!@#!")
        self.navigationController?.pushViewController(U2MsgViewController(), animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    //设置section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIdentifer = arry[indexPath.row]
        let cell = MyCell(style: UITableViewCellStyle.default, reuseIdentifier: initIdentifer)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        print("HELLO")
        view.tintColor = .red
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HELLO")
        self.navigationController?.pushViewController(U2MsgViewController(), animated: true)
    }
}

//自定义cell

class MyCell: UITableViewCell {
    var personalImage: UIImageView?
    var nameLabel: UILabel?
    var shortMsg: UILabel?
    var data:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.personalImage = makeMask(UIImageView(image: #imageLiteral(resourceName: "pet")))
        self.nameLabel = {
           let label = UILabel()
            label.text = reuseIdentifier
            label.font = UIFont.systemFont(ofSize: 15)
            label.sizeToFit()
            return label
        }()
        self.shortMsg = {
            let label = UILabel()
            label.text = "\(String(describing: reuseIdentifier))给你发送了一条消息..."
            label.font = UIFont.systemFont(ofSize: 12)
            label.sizeToFit()
            return label
        }()
        self.data = {
            let label = UILabel()
            label.text = "6/19"
            label.font = UIFont.systemFont(ofSize: 12)
            label.sizeToFit()
            return label
        }()
        setUpCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func setUpCell() {
        self.contentView.addSubview(personalImage!)
        self.contentView.addSubview(nameLabel!)
        self.contentView.addSubview(shortMsg!)
        self.contentView.addSubview(data!)
        personalImage?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        })
        nameLabel?.snp.makeConstraints({ (make) in
            make.top.greaterThanOrEqualToSuperview().offset(10)
            make.left.equalTo((personalImage?.snp.right)!).offset(15)
        })
        shortMsg?.snp.makeConstraints({ (make) in
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
            make.left.equalTo(nameLabel!)
        })
        data?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(nameLabel!)
            make.right.equalToSuperview().offset(-20)
        })
    }
    func makeMask(_ imageView:UIImageView)-> UIImageView {
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.red.cgColor
        return imageView
    }
    
    
    
}
