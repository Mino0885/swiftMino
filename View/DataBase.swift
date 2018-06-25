//
//  DataBase.swift
//  Mino
//
//  Created by Mino on 2018/6/25.
//  Copyright © 2018年 Mino. All rights reserved.
//

import Foundation
import SQLite


class SQLiteManager {
    private var db: Connection!
    private let users = Table("users") //表名
    private let id = Expression<Int64>("id")      //主键
    private let name = Expression<String>("name")  //列表1
    private let pwd = Expression<String>("pwd") //列表2
    private let state = Expression<Bool>("state")//登陆状态 1 成功
    
    init() {
        createdsqlite3()
    }

    
    //创建数据库文件
    func createdsqlite3(filePath: String = "/Documents")  {
        
        let sqlFilePath = NSHomeDirectory() + filePath + "/Mino.sqlite3"
        print("---------------")
        print(sqlFilePath)
        print("---------------")
        do {
            
            db = try Connection(sqlFilePath)
            try db.run(users.drop())
            try db.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(pwd)
                t.column(state)
            })
            insertData(_name: "MINO", _pwd: "123", _state: false)
        } catch {
            print("HELLO")
            print(error)
        }
    }
    
    //插入数据
    func insertData(_name: String, _pwd: String,_state: Bool){
        do {
            let insert = users.insert(name <- _name, pwd <- _pwd, state <- _state)
            try db.run(insert)
        } catch {
            print(error)
        }
    }
    
    //读取数据
    func readData() -> [(id: String, name: String, pwd: String,state: Bool)] {
        var userData = (id: "", name: "", pwd: "",state: false)
        var userDataArr = [userData]
        for user in try! db.prepare(users) {
            userData.id = String(user[id])
            userData.name = user[name]
            userData.pwd = user[pwd]
            userData.state = user[state]
            userDataArr.append(userData)
        }
        return userDataArr
    }
    
    //更新数据
    func updateData(newName: String, newPwd: String,newState: Bool) {
        let currUser = users.filter(name == newName)
        do {
            try db.run(currUser.update(name <- newName,pwd <- newPwd, state <- newState))
        } catch {
            print(error)
        }
        
    }
    
    //删除数据
    func delData(userId: Int64) {
        let currUser = users.filter(id == userId)
        do {
            try db.run(currUser.delete())
        } catch {
            print(error)
        }
    }
    
    func getState(userName: String) -> Bool {
        let currUser = users.filter(name == userName)
        do{
            for user in try db.prepare(currUser.select(id, state)) {
                return user[state]
            }
        }catch {
            print("HELLO")
            print(error)
        }
        return false
    }
    func getUser(userName: String) -> (id: Int64,name: String,pwd: String,state:Bool) {
        let currUser = users.filter(name == userName)
        var userData = (id:Int64() , name: "", pwd: "",state: false)
        for user in try! db.prepare(currUser) {
            userData.id = user[id]
            userData.name = user[name]
            userData.pwd = user[pwd]
            userData.state = user[state]
        }
        return userData
    }
}
