//
//  SHNScreenHelper.swift
//
//  Created by Shaun Harrison
//  Copyright (c) 2015 Shaun Harrison.
//

import UIKit

public extension UIScreen {
	private static var hairlineValues: [ Int: CGFloat ] = Dictionary()
	private static var categoryValues: [ Int: SHNScreenCategory ] = Dictionary()

	/** Get the hairline size for the current screen */
	public var hairline: CGFloat {
		let hash = self.hash

		if self.dynamicType.hairlineValues[hash] == nil {
			self.dynamicType.hairlineValues[hash] = UIScreen.hairlineForScale(self.scale)
		}

		return self.dynamicType.hairlineValues[hash]!
	}

	/** Get the category for the current screen */
	public var category: SHNScreenCategory {
		let hash = self.hash

		if self.dynamicType.categoryValues[hash] == nil {
			self.dynamicType.categoryValues[hash] = SHNScreenCategory.categoryForScreenBounds(self.bounds)
		}

		return self.dynamicType.categoryValues[hash]!
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
