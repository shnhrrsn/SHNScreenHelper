import UIKit

public enum SHNScreenCategory {
	case Small // ~= iPhone 3.5"
	case Medium // ~= iPhone 4"
	case Large // ~= iPhone 4.7"
	case XL // ~= iPhone 5.5"
	case XXL // ~= iPad
}

public func SHNScreenCategoryGetValue<T>(smallOrMediumValue: T, largeOrXLOrXXLValue: T) -> T {
	return SHNScreenCategoryGetValue(smallOrMediumValue, smallOrMediumValue, largeOrXLOrXXLValue, largeOrXLOrXXLValue, largeOrXLOrXXLValue)
}

public func SHNScreenCategoryGetValue<T>(smallOrMediumValue: T, largeValue: T, xlOrXXLValue: T) -> T {
	return SHNScreenCategoryGetValue(smallOrMediumValue, smallOrMediumValue, largeValue, xlOrXXLValue, xlOrXXLValue)
}

public func SHNScreenCategoryGetValue<T>(smallOrMediumValue: T, largeValue: T, xlValue: T, xxlValue: T) -> T {
	return SHNScreenCategoryGetValue(smallOrMediumValue, smallOrMediumValue, largeValue, xlValue, xxlValue)
}

public func SHNScreenCategoryGetValue<T>(smallValue: T, mediumValue: T, largeValue: T, xlValue: T, xxlValue: T) -> T {
	switch(UIScreen.mainScreen().category) {
		case .XXL:
			return xxlValue
		case .XL:
			return xlValue
		case .Large:
			return largeValue
		case .Medium:
			return mediumValue
		case .Small:
			return smallValue
		default:
			return smallValue
	}
}

public extension UIScreen {
	private static var _hairline: CGFloat?
	private static var _category: SHNScreenCategory?

	public var hairline: CGFloat {
		if UIScreen._hairline == nil {
			UIScreen._hairline = UIScreen.hairlineForScale(self.scale)
		}
		
		return UIScreen._hairline!
	}
	
	public var category: SHNScreenCategory {
		if UIScreen._category == nil {
			let bounds = self.bounds
			let width = min(bounds.size.width, bounds.size.height)
			
			if width <= 340.0 {
				let height = max(bounds.size.width, bounds.size.height)
				
				if height <= 510.0 {
					UIScreen._category = SHNScreenCategory.Small
				} else {
					UIScreen._category = SHNScreenCategory.Medium
				}
			} else if width <= 400.0 {
				UIScreen._category = SHNScreenCategory.Large
			} else if width <= 680.0 {
				UIScreen._category = SHNScreenCategory.XL
			} else {
				UIScreen._category = SHNScreenCategory.XXL
			}
		}
		
		return UIScreen._category!
	}
	
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
