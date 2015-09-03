//
//  SHNScreenCategory.swift
//
//  Created by Shaun Harrison
//  Copyright (c) 2015 Shaun Harrison.
//

import UIKit

/**
Provides a loose representation of the current screen size.

Key metrics are intentionally fuzzy for future proofing, so
correlations to existing devices are considered approximate.
*/
public enum SHNScreenCategory {
	/** Screen size ~= iPhone 3.5" */
	case Small

	/** Screen size ~= iPhone 4" */
	case Medium

	/** Screen size ~= iPhone 4.7" */
	case Large

	/** Screen size ~= iPhone 5.5" */
	case XL

	/** Screen size ~= iPad */
	case XXL

	/** Determine a category for screen bounds */
	public static func categoryForScreenBounds(bounds: CGRect) -> SHNScreenCategory {
		let width = min(bounds.size.width, bounds.size.height)

		if width <= 340.0 {
			let height = max(bounds.size.width, bounds.size.height)

			if height <= 510.0 {
				return .Small
			} else {
				return .Medium
			}
		} else if width <= 400.0 {
			return .Large
		} else if width <= 680.0 {
			return .XL
		} else {
			return .XXL
		}
	}
}

/**
Get a conditional value based on the main screen category

:param: smallOrMediumValue Value if screen category <= medium
:param: largeOrXLOrXXLValue Value if screen category >= large
*/
public func SHNScreenCategoryGetValue<T>(smallOrMediumValue: T, _ largeOrXLOrXXLValue: T) -> T {
	return SHNScreenCategoryGetValue(smallOrMediumValue, smallOrMediumValue, largeOrXLOrXXLValue, largeOrXLOrXXLValue, largeOrXLOrXXLValue)
}

/**
Get a conditional value based on the main screen category

:param: smallOrMediumValue Value if screen category <= medium
:param: largeValue Value if screen category == large
:param: xlOrXXLValue Value if screen category >= XL
*/
public func SHNScreenCategoryGetValue<T>(smallOrMediumValue: T, _ largeValue: T, _ xlOrXXLValue: T) -> T {
	return SHNScreenCategoryGetValue(smallOrMediumValue, smallOrMediumValue, largeValue, xlOrXXLValue, xlOrXXLValue)
}

/**
Get a conditional value based on the main screen category

:param: smallOrMediumValue Value if screen category <= medium
:param: largeValue Value if screen category == large
:param: xlValue Value if screen category == XL
:param: xxlValue Value if screen category == XXL
*/
public func SHNScreenCategoryGetValue<T>(smallOrMediumValue: T, _ largeValue: T, _ xlValue: T, _ xxlValue: T) -> T {
	return SHNScreenCategoryGetValue(smallOrMediumValue, smallOrMediumValue, largeValue, xlValue, xxlValue)
}

/**
Get a conditional value based on the main screen category

:param: smallValue Value if screen category == small
:param: mediumValue Value if screen category == medium
:param: largeValue Value if screen category == large
:param: xlValue Value if screen category == XL
:param: xxlValue Value if screen category == XXL
*/
public func SHNScreenCategoryGetValue<T>(smallValue: T, _ mediumValue: T, _ largeValue: T, _ xlValue: T, _ xxlValue: T) -> T {
	switch UIScreen.mainScreen().category {
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
	}
}
