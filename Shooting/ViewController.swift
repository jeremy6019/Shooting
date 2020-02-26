//
//  ViewController.swift
//  Shooting
//
//  Created by 503 on 2020/02/26.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bullet:Bullet!
    //총알이 존재할때만 동작해야하므호 생성된 총알은 배열에 담아놓자
    var bulletArray:Array = Array<Bullet>()
    
    @IBAction func btnClick(_ sender: Any) {
        fire()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
    }
    
    //발사버튼을 누를때마다 객체 생성
    //객체를 재생산 할 수 있는 틀인 클래스를 이용하자
    func fire(){
        bullet = Bullet(parent: self.view, url: "ball.png", x: 100, y: 150, velX: 5, width: 30, height: 30)
        
        //방금 생성된 총알을 배열에 탑재
        bulletArray.append(bullet)
        
        
    }
    //게임에 등장하는 모든 오브젝트들을 움직여주는 무한루프
    //이 무한루프의 속도에 따라 게임의 속도가 좌우된다
    //(FPS: frame Per Second)
    @objc func gameLoop(){
        //배열애 들어있는 만큼만 돌리자
        for obj in bulletArray{
            obj.tick()
            obj.render()
        }
    }
}

