//
//  MPTextField.swift
// HeroEyez
//
//  Created by MANISH_iOS on 28/07/16.
//  Copyright © 2016 iDev Softwares. All rights reserved.
//

import UIKit

@IBDesignable
class MPTextField: UITextField, UIGestureRecognizerDelegate
{
    
    // MARK: - IBInspectable
    /// show border or hide border.
    @IBInspectable var showBorder: Bool = false
    /// Assign color to border of placeholder.
    @IBInspectable var borderColor : UIColor = Macros.Colors.brownColor
    @IBInspectable var imageOnLeftView : UIImage!
    @IBInspectable var imageOnRightView: UIImage!
    @IBInspectable var addAction: Bool = false

     @IBInspectable var customTag : Int = 0
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)

        self.initialize()
    }
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        
        self.initialize()
    }
    convenience init()
    {
        self.init(frame: CGRect.zero)
        
        self.initialize()
    }
    func initialize()
    {
        preUI()
    }
    
    override func draw(_ rect: CGRect)
    {
        
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 2.0
        
        Macros.Colors.brownColor.setStroke()
        
        path.stroke()
    }
    
    func preUI()
    {
        self.autocorrectionType = .no
        self.setValue(Macros.Colors.brownColor, forKeyPath: "_placeholderLabel.textColor")
        self.font =  Macros.Fonts.robotoRegular
        self .textColor = Macros.Colors.brownColor
        self .backgroundColor = UIColor.clear
        self .borderStyle = .none
    }
    
    override func awakeFromNib()
    {
        setpSideView()
    }
    
    func setpSideView()
    {
        if imageOnLeftView != nil
        {
            
            let img = UIImageView(frame: CGRect(x: 5, y: 0,width: 20, height: 20))
            img.image = imageOnLeftView
            self .leftView  = img
            self.leftViewMode   = .always
        }
        
        if imageOnRightView != nil
        {
            
            let img = UIImageView(frame: CGRect(x: self .frame .size .width - 20, y: 0,width: 20, height: 20))
            img.image = imageOnRightView
            self .rightView  = img
            self.rightViewMode  = .always
        }
    }
    
}

