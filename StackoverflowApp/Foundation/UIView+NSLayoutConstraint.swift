//
//  UIView+NSLayoutConstraint.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation
import UIKit

extension UIView {
	@discardableResult
	func leadingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		let constrainable = safeConstrainable(for: superview)
		
		return leading(to: constrainable, anchor, offset: offset)
	}
	@discardableResult
	func trailingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		let constrainable = safeConstrainable(for: superview)
		
		return trailing(to: constrainable, anchor, offset: offset)
	}
	@discardableResult
	func topToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		let constrainable = safeConstrainable(for: superview)
		
		return top(to: constrainable, anchor, offset: offset)
	}
	@discardableResult
	func bottomToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		let constrainable = safeConstrainable(for: superview)
		
		return bottom(to: constrainable, anchor, offset: offset)
	}
	@discardableResult
	func centerYToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		let constrainable = safeConstrainable(for: superview)
		
		return centerY(to: constrainable, anchor, offset: offset)
	}
}

private extension UIView {
	@discardableResult
	func prepareForLayout() -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		return self
	}
	
	func safeConstrainable(for superview: UIView?) -> UIView {
		guard let superview = superview else {
			fatalError("Unable to create this constraint to it's superview, because it has no superview.")
		}
		
		prepareForLayout()
		
		return superview
	}
	
	@discardableResult
	func leading(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		prepareForLayout()
		
		return leadingAnchor.constraint(equalTo: anchor ?? view.leadingAnchor, constant: offset).set(true)
	}
	
	@discardableResult
	func trailing(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		prepareForLayout()
		
		return trailingAnchor.constraint(equalTo: anchor ?? view.trailingAnchor, constant: offset).set(true)
	}
	
	@discardableResult
	func top(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		prepareForLayout()
		
		return topAnchor.constraint(equalTo: anchor ?? view.topAnchor, constant: offset).set(true)
	}
	
	@discardableResult
	func bottom(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		prepareForLayout()
		
		return bottomAnchor.constraint(equalTo: anchor ?? view.bottomAnchor, constant: offset).set(true)
	}
	
	@discardableResult
	func centerY(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0) -> NSLayoutConstraint {
		prepareForLayout()
		
		let constraint: NSLayoutConstraint
		
		if let anchor = anchor {
			constraint = centerYAnchor.constraint(equalTo: anchor, constant: offset)
		} else {
			constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: offset)
		}
		
		constraint.isActive = true
		
		return constraint
	}
}

private extension NSLayoutConstraint {
	func set(_ active: Bool) -> Self {
		isActive = active
		return self
	}
}
