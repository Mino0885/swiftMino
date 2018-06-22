//
//  U2MsgViewController.swift
//  Mino
//
//  Created by Mino on 2018/6/19.
//  Copyright © 2018年 Mino. All rights reserved.
//

import UIKit
struct Msg {
    var msgType:Int?
    var msgSender:String?
    var msg:String?
}
class U2MsgViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
    var array = Array<Msg>()
    var flag = true
    var imgFlag = true
    //模拟导航栏
    private lazy var toolBar: UIView = {
        let toolBar = UIView()
        toolBar.backgroundColor = UIColor.init(red: 29/255, green: 139/255, blue: 241/255, alpha: 1)
        return toolBar
    }()
    //站点信息和好友信息view
    private lazy var infoView: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    //用户名
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "用户1"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }()
    //所在站点描述
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "A K A X I N | mino.site"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.sizeToFit()
        return label
    }()
    //消息区域
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        table.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.estimatedRowHeight = 50
        table.rowHeight = UITableViewAutomaticDimension
        table.allowsSelection = false
        return table
    }()
    // 底部工具栏
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    // 聊天文本框
    private lazy var inputText: UIView = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.delegate = self
//        textField.isHidden = true
        textField.returnKeyType = UIReturnKeyType.done
        return textField
    }()
    //语音按钮
    private lazy var voiceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
//        button.la
        button.setTitle("按住 说话", for: UIControlState.normal)
        button.setTitleColor(.black, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.isHidden = true
        return button
    }()
    // 语音和键盘切换按钮
    private lazy var switchButton: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pet"))
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.tag = 1
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    // emoji和键盘切换按钮
    private lazy var emojiButton: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "etp"))
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.tag = 1
        imageView.isUserInteractionEnabled = true
    return imageView
}()
    //语音和键盘单击事件
    private lazy var voiceGestrue: UITapGestureRecognizer = {
        let gestrue = UITapGestureRecognizer()
        gestrue.numberOfTapsRequired = 1
        gestrue.numberOfTapsRequired = 1
        gestrue.addTarget(self, action: #selector(switchVoiceButton))
        return gestrue
    }()
    private lazy var emojiGiestrue: UITapGestureRecognizer = {
        let gestrue = UITapGestureRecognizer()
        gestrue.numberOfTapsRequired = 1
        gestrue.numberOfTapsRequired = 1
        gestrue.addTarget(self, action: #selector(switchEmojiButton))
        return gestrue
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加假数据
//        array.append("你好")
//        array.append("pet")
//        array.append("ABCDEFGHIJKLMNOPQRSTUVWXYZ,ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//        array.append("Image")
//        array.append("你好")
//        array.append("pet")
//        array.append("ABCDEFGHIJKLMNOPQRSTUVWXYZ,ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//        array.append("Image")
//        array.append("你好")
//        array.append("pet")
//        array.append("ABCDEFGHIJKLMNOPQRSTUVWXYZ,ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//        array.append("Image")
//        array.append("你好")
//        array.append("pet")
//        array.append("ABCDEFGHIJKLMNOPQRSTUVWXYZ,ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//        array.append("Image")
        array.append(Msg(msgType: 1, msgSender: "pet", msg: "你好"))
        array.append(Msg(msgType: 1, msgSender: "etp", msg: "你好"))
        array.append(Msg(msgType: 2, msgSender: "etp", msg: "pet"))
        array.append(Msg(msgType: 2, msgSender: "pet", msg: "Image"))
        array.append(Msg(msgType: 2, msgSender: "pet", msg: "Image"))
        array.append(Msg(msgType: 1, msgSender: "pet", msg: "你好"))
        array.append(Msg(msgType: 1, msgSender: "etp", msg: "你好"))
        array.append(Msg(msgType: 2, msgSender: "etp", msg: "pet"))
        array.append(Msg(msgType: 2, msgSender: "pet", msg: "Image"))
        array.append(Msg(msgType: 2, msgSender: "pet", msg: "Image"))
        self.view.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        self.view.addSubview(toolBar)
        self.view.addSubview(infoView)
        infoView.addSubview(nameLabel)
        infoView.addSubview(descLabel)
        self.view.addSubview(tableView)
//        self.tableView.transform = CGAffineTransform (scaleX: 1,y: -1);
        self.view.addSubview(bottomView)
        bottomView.addSubview(inputText)
        bottomView.addSubview(voiceButton)
        bottomView.addSubview(switchButton)
        switchButton.addGestureRecognizer(voiceGestrue)
        bottomView.addSubview(emojiButton)
        emojiButton.addGestureRecognizer(emojiGiestrue)
       
        
        toolBar.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
            make.width.equalTo(self.view)
        }
        infoView.snp.makeConstraints { (make) in
            make.centerX.equalTo(toolBar)
            make.centerY.equalTo(toolBar.snp.bottom).offset(-22)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(infoView)
        }
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(infoView)
        }
//        imgview.snp.makeConstraints { (make) in
//            make.top.equalTo(toolBar.snp.bottom)
//            make.bottom.width.equalToSuperview()
//        }
//        // Do any additional setup after loading the view.
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(toolBar.snp.bottom)
            make.bottom.equalTo(bottomView.snp.top)
            make.width.equalToSuperview()
        }
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaInsets.bottom).offset(-34)
            make.height.equalTo(44)
            make.width.equalToSuperview()
        }
        
        inputText.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(250)
            make.left.equalTo(50)
        }
        voiceButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(250)
            make.left.equalTo(50)
        }
    
        switchButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalTo(25)
        }
        emojiButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(325)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func switchVoiceButton(_ sender: AnyObject){
        let tag = sender.view.tag
        if 1 == tag{
            switchButton.image = #imageLiteral(resourceName: "etp")
            inputText.isHidden = true
            voiceButton.isHidden = false
            voiceButton.titleLabel?.isHidden = false
            switchButton.tag = 2
        }else{
            switchButton.image = #imageLiteral(resourceName: "pet")
            inputText.isHidden = false
            voiceButton.isHidden = true
            switchButton.tag = 1
        }
        
    }
    @objc func switchEmojiButton(_ sender: AnyObject){
        let tag = sender.view.tag
        if  1 == tag {
            emojiButton.image = #imageLiteral(resourceName: "pet")
            //弹窗
            
            emojiButton.tag = 2
        }else{
            emojiButton.image = #imageLiteral(resourceName: "etp")
            //关闭弹窗
            emojiButton.tag = 1
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.flag { //只在初始化的时候执行
            let popTime = DispatchTime.now() + 0.005 //延迟执行5毫秒
            DispatchQueue.main.asyncAfter(deadline: popTime) {
                if self.array.count > 0 {
                    tableView.scrollToRow(at: IndexPath(row: self.array.count - 1, section: 0), at: .bottom, animated: false)
                }
                self.flag = true
            }
        }
        return array.count
    }
    
    //设置section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 0 && array[indexPath.row - 1].msgSender == array[indexPath.row].msgSender {
            imgFlag = false
        }else{
            imgFlag = true
        }
            
        let cell = MsgCell(style: UITableViewCellStyle.default, msg: array[indexPath.row], imgFlag:imgFlag)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        self.flag = false
    }
}
class MsgCell: UITableViewCell {
    var personalImage: UIImageView?
    var msgView:UIView?
    var label:UILabel?
    var imgeview:UIImageView?
    
    
    init(style: UITableViewCellStyle,msg:Msg,imgFlag:Bool) {
        super.init(style: style, reuseIdentifier: msg.msg)
        self.personalImage = makeMask(UIImageView(image: UIImage(named: msg.msgSender!)))
        self.msgView = {
            let view = UIView()
            view.backgroundColor = UIColor.white
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
            return view
        }()
        
        if 1 == msg.msgType{
            self.label = {
                let label = UILabel()
                label.text = msg.msg
                label.lineBreakMode = NSLineBreakMode.byWordWrapping
                label.numberOfLines = 0
                label.sizeToFit()
                return label
            }()
        }else {
            self.imgeview = {
                let imgView = UIImageView()
                imgView.image = UIImage(named: msg.msg!)
                imgView.contentMode = UIViewContentMode.scaleAspectFill
                return imgView
            }()
        }
        print(imgFlag)
        if msg.msgSender == "pet" {
            setUpCellR(msgType: msg.msgType!, imgFlag: imgFlag)
        }else{
            setUpCellL(msgType: msg.msgType!, imgFlag: imgFlag)
        }
        self.contentView.backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func setUpCellR(msgType:Int ,imgFlag:Bool) {
        if imgFlag {
            self.contentView.addSubview(personalImage!)
            personalImage?.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView).offset(30)
                make.right.equalToSuperview().offset(-20)
                make.bottom.lessThanOrEqualTo(self.contentView)
            })
        }
        self.contentView.addSubview(msgView!)
        msgView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.contentView).offset(30)
            make.right.equalToSuperview().offset(-80)
            make.bottom.lessThanOrEqualTo(self.contentView)
        })
        if msgType == 1 {
            msgView!.addSubview(label!)
            label?.snp.makeConstraints({ (make) in
                make.width.lessThanOrEqualTo(msgView!).offset(-20)
                make.width.lessThanOrEqualTo(200)
                make.height.lessThanOrEqualTo(msgView!).offset(-20)
                make.centerY.equalTo(msgView!)
                make.centerX.equalTo(msgView!)
            })
        }else if msgType == 2{
            msgView!.addSubview(imgeview!)
            imgeview?.snp.makeConstraints({ (make) in
                make.width.lessThanOrEqualTo(200)
                make.height.lessThanOrEqualTo(100)
                make.width.lessThanOrEqualTo(msgView!).offset(-20)
                make.height.lessThanOrEqualTo(msgView!).offset(-20)
                make.center.equalTo(msgView!)
            })
        }
        
    }
    func setUpCellL(msgType:Int ,imgFlag:Bool) {
        if imgFlag {
            self.contentView.addSubview(personalImage!)
            personalImage?.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView).offset(30)
                make.left.equalToSuperview().offset(20)
                make.bottom.lessThanOrEqualTo(self.contentView)
            })
        }
        self.contentView.addSubview(msgView!)
        msgView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.contentView).offset(30)
            make.left.equalToSuperview().offset(80)
            make.bottom.lessThanOrEqualTo(self.contentView)
        })
        if msgType == 1 {
            msgView!.addSubview(label!)
            label?.snp.makeConstraints({ (make) in
                make.width.lessThanOrEqualTo(msgView!).offset(-20)
                make.width.lessThanOrEqualTo(200)
                make.height.lessThanOrEqualTo(msgView!).offset(-20)
                make.centerY.equalTo(msgView!)
                make.centerX.equalTo(msgView!)
            })
        }else if msgType == 2{
            msgView!.addSubview(imgeview!)
            imgeview?.snp.makeConstraints({ (make) in
                make.width.lessThanOrEqualTo(200)
                make.height.lessThanOrEqualTo(100)
                make.width.lessThanOrEqualTo(msgView!).offset(-20)
                make.height.lessThanOrEqualTo(msgView!).offset(-20)
                make.center.equalTo(msgView!)
            })
        }
        
    }
    func makeMask(_ imageView:UIImageView)-> UIImageView {
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        return imageView
    }
}

