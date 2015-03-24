//
//  SHNScreenHelper.swift
//
//  Created by Shaun Harrison
//  Copyright (c) 2015 Shaun Harrison.
//

import UIKit

private struct UIScreenHolder {
	private static var hairline: [ Int: CGFloat ] = Dictionary()
	private static var category: [ Int: SHNScreenCategory ] = Dictionary()
}

public extension UIScreen {
	
	/** Get the hairline size for the current screen */
	public var hairline: CGFloat {
		let hash = self.hash
		
		if UIScreenHolder.hairline[hash] == nil {
			UIScreenHolder.hairline[hash] = UIScreen.hairlineForScale(self.scale)
		}
		
		return UIScreenHolder.hairline[hash]!
	}
	
	/** Get the category for the current screen */
	public var category: SHNScreenCategory {
		let hash = self.hash

		if UIScreenHolder.category[hash] == nil {
			UIScreenHolder.category[hash] = SHNScreenCategory.categoryForScreenBounds(self.bounds)
		}
		
		return UIScreenHolder.category[hash]!
	}
	
	/** Get the hairline size for a given scale. */
	public class func hairlineForScale(scale: CGFloat) -> CGFloat {
		if scale <= 1.5 {
			return 1.0
		} else if scale <= 2.5 {
			return 1.0 / scale
		} else {
			return 2.0 / scale
		}
	}
	
}
