//
//  ChildMenuViewController.swift
//  mamakarute
//
//  Created by 武久　直幹 on 2022/07/22.
//

import Foundation
import UIKit

class ChildMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // メニュー画面の位置
        let menuPosition = self._.layer.position
        // 初期位置設定
        self._.layer.position.x = -self._.frame.width
        // 表示アニメーション
        UIView.animate(
            withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
                self._.layer.position.x = menuPosition.x
            }, completion: { bool in })
    }
    
    // メニュー外をタップした場合に非表示にする
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if touch.view?.tag == 1 {
                UIView.animate( withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                    self._.layer.position.x = -self._.frame.width
                }, completion: { bool in self.dismiss(animated: true, completion: nil)
                    
                }
                )
            }
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
