//
//  MapView.swift
//  MathMonsters
//
//  Created by Pradip Walghude on 15/09/19.
//  Copyright © 2019 iPradip LLC. All rights reserved.
//

import UIKit

class MapView: UIView {
    
    
    var view: UIView!
    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    // MARK: Private Methods
    private func setup() {
        view = self.loadFromNib(target: self)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    
    
    // write below code common utils class 
    func loadFromNib(target: AnyObject) -> UIView {
        let nibName = String(describing: type(of:target))
        let bundle = Bundle(for: type(of:target))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: target, options: nil)[0] as! UIView
        return view
    }
    
   

}
