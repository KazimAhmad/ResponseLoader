//
//  LoadingView.swift
//  ResponseLoader
//
//  Created by KazimAhmad on 04/02/2019.
//  Copyright © 2019 self. All rights reserved.
//

import Foundation
import UIKit

open class ProgressView {
    
    var actView: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var titleLabel: UILabel = UILabel()
    
    open class var shared: ProgressView {
        struct Static {
            static let instance: ProgressView = ProgressView()
        }
        return Static.instance
    }
    
    open func showActivity(_ myView: UIView, _ myTitle: String) {
        myView.isUserInteractionEnabled = false
        myView.window?.isUserInteractionEnabled = false
        myView.endEditing(true)
        actView.frame = CGRect(x:0, y:0, width:myView.frame.width, height:myView.frame.height)
        actView.center = myView.center
        actView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
        loadingView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(90), height: CGFloat(90))
        loadingView.center = myView.center
        loadingView.backgroundColor = UIColor(red: 7.0/255.0,green: 139.0/255.0, blue: 94.0/255.0, alpha: 0.8)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        titleLabel.frame = CGRect(x:5, y: loadingView.frame.height-20, width: loadingView.frame.width-10, height: 20)
        titleLabel.textColor = UIColor.white
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = myTitle
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        
        loadingView.addSubview(activityIndicator)
        actView.addSubview(loadingView)
        loadingView.addSubview(titleLabel)
        myView.addSubview(actView)
        activityIndicator.startAnimating()
    }
    open func removeActivity(_ myView: UIView) {
        DispatchQueue.main.async {
            myView.isUserInteractionEnabled = true
            myView.window?.isUserInteractionEnabled = true
            self.activityIndicator.stopAnimating()
            self.actView.removeFromSuperview()
        }
        
    }
}// end of class
