//
//  BackToTopButton.swift
//  BackTopButtonDemo
//
//  Created by Neo on 16/1/18.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class BackToTopButton: UIButton {
    
    var myContext=0
    private weak var scrollView:UIScrollView?
    
    static func addBackButton(yourViewController vc:UIViewController,yourTableView scrollView:UIScrollView, offsetY:CGFloat = 0){
        let topBtn = BackToTopButton()
        topBtn.scrollView = scrollView
        let view = vc.view
        let width = view.frame.size.width
        let height = view.frame.size.height
        let frame = CGRectMake( width-60, height-80-64 + offsetY, 50, 50)
        topBtn.frame = frame
        topBtn.setImage(UIImage.init(named: "backBtn"), forState: UIControlState.Normal)
        topBtn.addTarget(topBtn, action: "topBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        scrollView.addObserver(topBtn, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: &topBtn.myContext)
        view.insertSubview(topBtn, atIndex: view.subviews.count + 1)
    }
    
    func topBtnClick(btn:UIButton){
        let indexPath=NSIndexPath(forRow: 0, inSection: 0)
        if let tb = self.scrollView as? UITableView{
            if  tb.numberOfRowsInSection(0) != 0{
                tb.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            }else{
                UIView.animateWithDuration(0.3) { () -> Void in
                    self.scrollView?.contentOffset=CGPointMake(0, 0)
                }
            }
        }else{
            UIView.animateWithDuration(0.3) { () -> Void in
                self.scrollView?.contentOffset=CGPointMake(0, 0)
            }
        }
    }

    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &myContext {
            if keyPath == "contentOffset"{
                if let offset = (change?[NSKeyValueChangeNewKey] as? NSValue)?.CGPointValue(){
                    if offset.y > 200 {
                        self.hidden = false
                    }else{
                        self.hidden = true
                    }
                }
            }
        }
    }
    
    deinit{
        scrollView?.removeObserver(self, forKeyPath: "contentOffset")
    }

}
