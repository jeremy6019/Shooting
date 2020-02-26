//
//  Bullet.swift
//  Shooting
//
//  Created by 503 on 2020/02/26.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

// 총알로서 가져야할 속성 및 메서드
class Bullet: NSObject {
    var parent:UIView! //총알이 붙어지낼 뷰
    var url:String //이미지 경로
    var img:UIImageView! //총알이미지
    var x:CGFloat // 총알의 좌표
    var y:CGFloat //총알의 y 좌표x
    var velX:CGFloat //총알의 속도
    var width:CGFloat
    var height:CGFloat
    
    
    init(parent:UIView,url:String, x:CGFloat,y:CGFloat, velX:CGFloat, width:CGFloat, height:CGFloat){
        self.parent = parent
        self.url = url
        self.x = x
        self.y = y
        self.velX = velX
        self.width = width
        self.height = height
        
        //넘겨받은 url로 아미지 생성
        img = UIImageView(image: UIImage(named:url))
        img.frame = CGRect(x: x, y: y, width: width, height: height)
        
        //총알 부모뷰에 붙이기
        parent.addSubview(img)
    }
    //좌표값 변경메서드
    func tick(){
        x = x + velX
    }
    
    //변경된 물리량을 그래픽적으로 반영 및 표현 '
    func render(){
        img.frame.origin.x = x
    }
}
