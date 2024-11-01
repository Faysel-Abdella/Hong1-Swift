//
//  CustomSegmentedControl.swift
//  hong1
//
//  Created by Yohannes Haile on 10/17/24.
//


import UIKit

@IBDesignable
@objcMembers
open class CustomSegmentedControl: UIControl {
    
    // MARK: Customizing Appearance
    
    /// A Boolean value that controls whether the segmented control bounces past the edge of content and back again.
    /// If the value of this property is true, the segmented control bounces when it encounters a boundary of the content. Bouncing visually indicates that control has reached an edge of the content. If the value is false, scrolling stops immediately at the content boundary without bouncing. The default value is true.
    @IBInspectable public dynamic var bounces: Bool {
        get { return _scrollView.bounces }
        set { _scrollView.bounces = newValue }
    }
    
    /// The font of the segments.
    /// If you are using styled text in iOS 6 or later, assigning a new value to this property causes the font to be applied to the entirety of the string in the attributedText property. If you want to apply the font to only a portion of the text, create a new attributed string with the desired style information and associate it with the segment. If you are not using styled text, this property applies to the entire segments string in the title property.
    /// The default value for this property is the system font at a size of 17 points (using the systemFont(ofSize:) class method of UIFont).
    @IBInspectable public dynamic var font = UIFont.systemFont(ofSize: 17) {
        didSet {
            for segment in contentView.segments {
                segment.titleLabel?.font = font
            }
            setNeedsLayout()
        }
    }
    
    /// Sets the color of the segments title to use for the normal state.
    @IBInspectable public dynamic var textColor: UIColor = .lightGray {
        didSet {
            for segment in contentView.segments {
                segment.setTitleColor(textColor, for: .normal)
            }
        }
    }
    
    /// Sets the color of the segments title to use for the selected state.
    @IBInspectable public dynamic var selectedTextColor: UIColor? {
        didSet {
            for segment in contentView.segments {
                segment.setTitleColor(selectedTextColor, for: .selected)
            }
        }
    }
    
    /// Sets the width of the segments.
    @IBInspectable public var segmentWidth: CGFloat = 0 {
        didSet {
            for segment in contentView.segments {
                segment.width = segmentWidth
            }
            setNeedsLayout()
        }
    }
    
    /// The segmented control content insets
    @IBInspectable public dynamic var contentEdgeInsets = UIEdgeInsets.zero
    
    /// The inset or outset margins for the rectangle surrounding all of the segments' content.
    /// Use this property to resize and reposition the effective drawing rectangle for the segments content. The content comprises the segment image and segment title. You can specify a different value for each of the four insets (top, left, bottom, right). A positive value shrinks, or insets, that edge—moving it closer to the center of the segment. A negative value expands, or outsets, that edge. Use the UIEdgeInsets(top:left:bottom:right:) function to construct a value for this property. The default value is UIEdgeInsetsZero.
    /// The segments uses this property to determine intrinsicContentSize and sizeThatFits(_:).
    @IBInspectable public dynamic var segmentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) {
        didSet {
            for segment in contentView.segments {
                segment.contentEdgeInsets = segmentEdgeInsets
            }
            setNeedsLayout()
        }
    }
    
    /// The segmented control's indicator.
    public let indicator = CustomIndicator()
    
    /// The segmented control's separators.
    public internal(set) var separators: Separators {
        get { return contentView.separators }
        set { contentView.separators = newValue }
    }
    
    /// The indicator animation description.
    public var animation = Animation(duration: 0.25, delay: 0, dampingRatio: 1, velocity: 0, options: [.beginFromCurrentState, .allowUserInteraction])
    
    /// The indicator progress.
    public var progress: CGFloat = 0 {
        didSet { layoutIndicator() }
    }
    
    /// The currently selected segment index.
    public private(set) var selectedIndex: Int = 0 {
        willSet { contentView.segments[selectedIndex].isSelected = false }
        didSet {
            sendActions(for: .valueChanged)
            contentView.segments[selectedIndex].isSelected = true
        }
    }
    
    // MARK: Initializers
    
    let _scrollView = UIScrollView()
    let contentView = ContentView()
    
    /// :nodoc:
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    /// :nodoc:
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    /// Initializes and returns a newly allocated segmented control object with the specified titles.
    ///
    /// - Parameter titles: The segments titles.
    public convenience init(withTitles titles: [String]) {
        self.init(frame: CGRect.zero)
        for title in titles {
            append(title: title)
        }
    }
    
    /// Initializes and returns a newly allocated segmented control object with the specified titles.
    ///
    /// - Parameter titles: The segments titles.
    public convenience init(withAttributedTitles titles: [NSAttributedString]) {
        self.init(frame: CGRect.zero)
        for title in titles {
            append(attributedTitle: title)
        }
    }
    
    /// Initializes and returns a newly allocated segmented control object with the specified images.
    ///
    /// - Parameter images: The segments images.
    public convenience init(withImages images: [UIImage]) {
        self.init(frame: CGRect.zero)
        for image in images {
            append(image: image)
        }
    }
    
    private func initialize() {
        _scrollView.canCancelContentTouches = true
        _scrollView.showsVerticalScrollIndicator = false
        _scrollView.showsHorizontalScrollIndicator = false
        
        selectedTextColor = tintColor
        
        _scrollView.addSubview(indicator)
        _scrollView.addSubview(contentView)
        addSubview(_scrollView)
    }
    
    deinit {
        guard let scrollView = scrollView else { return }
        scrollView.removeObserver(self, forKeyPath: keyPath, context: &context)
    }
    
    // MARK: Layout
    
    /// :nodoc:
    open override func layoutSubviews() {
        super.layoutSubviews()
       
        var frame = self.bounds.inset(by: contentEdgeInsets)
        _scrollView.frame = frame
        
        let size = contentView.intrinsicContentSize
        if size.width > frame.size.width {
            frame.size.width = size.width
        }
        
        contentView.setNeedsLayout()
        contentView.frame = frame
        contentView.layoutIfNeeded()
        
        _scrollView.contentSize = frame.size
        _scrollView.contentInset = UIEdgeInsets.zero
        
        layoutIndicator()
    }
    
    private func layoutIndicator() {
        guard contentView.segments.count > 0 else {
            return
        }
        
        let index = min(Int(progress), contentView.segments.count - 1)
        let current = segment(at: index)!
        
        var frame = CGRect.zero
        frame.size.height = bounds.height
        
        // Compute indicator's position
        var x = progress < 0 ? 0 : current.frame.size.width * (progress - CGFloat(index))
        
        for i in 0..<index {
            x += segment(at: i)!.frame.size.width
        }
        
        x += CGFloat(index) * separators.inset.width
        frame.origin.x = x
        
        // Compute indicator's width
        if progress < 0 {
            // Bounce left
            frame.size.width = current.frame.size.width * (progress + 1)
            
        } else if index + 1 < contentView.segments.count {
            
            let next = segment(at: index + 1)!
            let dx = (next.frame.size.width - current.frame.size.width) * (progress - CGFloat(index))
            frame.size.width = current.frame.size.width + dx
            
        } else {
            //bounce right
            frame.size.width = current.frame.size.width * (CGFloat(contentView.segments.count) - progress)
        }
        
        indicator.frame = frame
        _scrollView.scrollRectToVisible(frame, animated: !frame.intersects(_scrollView.bounds))
    }
    
    /// :nodoc:
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        append(title: "First")
        append(title: "Second")
        append(title: "Third")
        setNeedsLayout()
    }
    
    // MARK: Attaching Scroll View
    
    /// A scroll view to observe in order to move the indicator.
    @IBOutlet public weak var scrollView: UIScrollView? {
        willSet { scrollView?.removeObserver(self, forKeyPath: keyPath, context: &context) }
        didSet { scrollView?.addObserver(self, forKeyPath: keyPath, context: &context) }
    }
    
    private var context: UInt8 = 1
    private let keyPath = NSStringFromSelector(#selector(getter: UIScrollView.contentOffset))
    
    /// :nodoc:
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &self.context {
            
            if let scrollView = scrollView, scrollView.isDragging || scrollView.isDecelerating {
                progress = CGFloat(scrollView.contentOffset.x / scrollView.frame.size.width)
                selectedIndex = Int(roundf( Float(progress) ))
            }
            
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
}

// MARK: - Interface Builder Inspectable and Appearence
extension CustomSegmentedControl {
    
    @IBInspectable public dynamic var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable public dynamic var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable public dynamic var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable public dynamic var separatorTop: CGFloat {
        get { return contentView.separators.inset.top }
        set { contentView.separators.inset.top = newValue }
    }
    
    @IBInspectable public dynamic var separatorBottom: CGFloat {
        get { return contentView.separators.inset.bottom }
        set { contentView.separators.inset.bottom = newValue }
    }
    
    @IBInspectable public dynamic var separatorWidth: CGFloat {
        get { return contentView.separators.inset.width }
        set { contentView.separators.inset.width = newValue }
    }
    
    @IBInspectable public dynamic var separatorColor: UIColor {
        get { return contentView.separators.color }
        set { contentView.separators.color = newValue }
    }
    
    @IBInspectable public dynamic var indicatorLeft: CGFloat {
        get { return indicator.contentEdgeInsets.left }
        set { indicator.contentEdgeInsets.left = newValue }
    }
    
    @IBInspectable public dynamic var indicatorRight: CGFloat {
        get { return indicator.contentEdgeInsets.right }
        set { indicator.contentEdgeInsets.right = newValue }
    }
    
    @IBInspectable public dynamic var indicatorHeight: CGFloat {
        get { return indicator.lineHeight }
        set { indicator.lineHeight = newValue }
    }
    
    @IBInspectable public dynamic var indicatorColor: UIColor? {
        get { return indicator.lineView.backgroundColor }
        set { indicator.lineView.backgroundColor = newValue }
    }
    
    @IBInspectable public dynamic var boxColor: UIColor? {
        get { return indicator.boxView.backgroundColor }
        set { indicator.boxView.backgroundColor = newValue }
    }
    
    @IBInspectable public dynamic var boxOpacity: CGFloat {
        get { return indicator.boxView.alpha }
        set { indicator.boxView.alpha = newValue }
    }
    
}

// MARK: - Segment Management

extension CustomSegmentedControl {
    
    /// Gets the segment at the given index.
    ///
    /// - Parameter index: The segment index.
    /// - Returns: The segment at the index. nil if the index is out of range.
    func segment(at index: Int) -> CustomSegment? {
        guard index < contentView.segments.count else {
            return nil
        }
        return contentView.segments[index]
    }
    
    /// Counts of segment.
    var count: Int {
        return contentView.segments.count
    }
    
    func newSegment() -> CustomSegment {
        
        let segment = CustomSegment()
        
        segment.setTitleColor(textColor, for: .normal)
        segment.setTitleColor(selectedTextColor, for: .selected)
        segment.contentEdgeInsets = segmentEdgeInsets
        segment.titleLabel?.font = font
        segment.isSelected = (contentView.segments.count == selectedIndex)
        segment.addTarget(self, action: #selector(CustomSegmentedControl.select(segment:)), for: .touchUpInside)
        
        contentView.append(segment)
        return segment
    }
    
    @objc private func select(segment: CustomSegment) {
        if let index = contentView.segments.firstIndex(of: segment) {
            select(index: index, animated: true)
        }
    }
    
    /// Removes the segment the given index.
    ///
    /// - Parameter index: The segment index to remove.
    public func remove(segmentAt index: Int) {
        guard index < contentView.segments.count else {
            return
        }
        contentView.remove( segment(at: index)! )
    }
    
    /// Removes all segments.
    public func removeAll() {
        for segment in contentView.segments {
            contentView.remove(segment)
        }
        layoutIfNeeded()
    }
    
    /// Creates and append a new segment with the given title.
    ///
    /// - Parameter title: The new segment title.
    @discardableResult func append(title: String) -> CustomSegment {
        let segment = newSegment()
        segment.setTitle(title, for: .normal)
        return segment
    }
    
    /// Creates and append a new segment with the given title.
    ///
    /// - Parameter title: The new segment title.
    @discardableResult func append(attributedTitle: NSAttributedString) -> CustomSegment {
        let segment = newSegment()
        segment.setAttributedTitle(attributedTitle, for: .normal)
        return segment
    }
    
    /// Creates and append a new segment with the given image.
    ///
    /// - Parameter title: The new segment image.
    @discardableResult func append(image: UIImage?) -> CustomSegment {
        let segment = newSegment()
        segment.setImage(image, for: .normal)
        return segment
    }
    
    /// Selects the segment at the given index.
    ///
    /// - Parameters:
    ///   - index: The segment index to be selected.
    ///   - animated: true if the selection should be animated, false if it should be immediate.
    public func select(index: Int, animated: Bool) {
        selectedIndex = index
        
        UIView.animate(withDuration: animated ? animation.duration : 0,
                       delay: animation.delay,
                       usingSpringWithDamping: animation.dampingRatio,
                       initialSpringVelocity: animation.velocity,
                       options: animation.options,
                       animations: { self.progress = CGFloat(index) })
        
        if let scrollView = scrollView {
            var contentOffset = scrollView.contentOffset
            contentOffset.x = CGFloat(index) * scrollView.frame.size.width
            scrollView.setContentOffset(contentOffset, animated: animated)
        }
    }
    
}

// MARK: - Content View

extension CustomSegmentedControl {
    
    class ContentView: UIView {
        
        var segments = [CustomSegment]()
        
        var separators = Separators()
        
        func append(_ segment: CustomSegment) {
            guard !segments.contains(segment) else {
                return
            }
            
            if segments.count > 0 {
                let separator = CALayer()
                separator.backgroundColor = separators.color.cgColor
                layer.addSublayer(separator)
                separators.layers.append(separator)
            }
            
            addSubview(segment)
            segments.append(segment)
            
            invalidateIntrinsicContentSize()
            layoutIfNeeded()
        }
        
        func remove(_ segment: CustomSegment) {
            guard var index = segments.firstIndex(of: segment) else {
                return
            }
            
            segment.removeFromSuperview()
            segments.remove(at: index)
            
            if segments.count > 0 {
                index = segments.count - 1
                let separator = separators.layers[index]
                separator.removeFromSuperlayer()
                separators.layers.remove(at: index)
            }
            
            invalidateIntrinsicContentSize()
            layoutIfNeeded()
        }
        
        override var intrinsicContentSize: CGSize {
            get {
                var size = CGSize(width: CGFloat(separators.layers.count) * separators.inset.width, height: UIView.noIntrinsicMetric)
                for segment in segments {
                    size.width += segment.width
                    size.height = max(segment.intrinsicContentSize.height, size.height)
                }
                return size
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            let segments = self.segments.sorted(by: { $0.width > $1.width })
            
            let height = frame.size.height
            var width = frame.size.width - CGFloat(separators.layers.count) * separators.inset.width
            
            for (index, segment) in segments.enumerated() {
                
                var frame = CGRect.zero
                frame.size.width = max(segment.width, width / CGFloat(self.segments.count - index))
                frame.size.height = height
                segment.layer.frame = frame
                
                width -= frame.size.width
            }
            
            var separatorFrame = CGRect(x: 0, y: separators.inset.top, width: separators.inset.width, height: height - separators.inset.top - separators.inset.bottom)
            for (index, segment) in self.segments.enumerated() {
                
                if index > 0 {
                    separators.layers[index - 1].frame = separatorFrame
                    separatorFrame.origin.x += separators.inset.width
                }
                
                var frame = segment.frame
                frame.origin.x = separatorFrame.origin.x
                segment.frame = frame
                separatorFrame.origin.x += frame.size.width
            }
        }
        
    }
    
}

// MARK: - Animation

extension CustomSegmentedControl {
    
    /// The indicator animation properties.
    public struct Animation {
        
        /// The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
        public var duration: TimeInterval
        
        /// The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
        public var delay: TimeInterval
        
        /// The damping ratio for the spring animation as it approaches its quiescent state.
        /// To smoothly decelerate the animation without oscillation, use a value of 1. Employ a damping ratio closer to zero to increase oscillation.
        public var dampingRatio: CGFloat
        
        /// The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
        /// A value of 1 corresponds to the total animation distance traversed in one second. For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
        public var velocity: CGFloat
        
        /// A mask of options indicating how you want to perform the animations. For a list of valid constants, see UIViewAnimationOptions.
        public var options: UIView.AnimationOptions
    }
    
}

// MARK: - Separators

extension CustomSegmentedControl {
    
    /// Segmented control seperators representation.
    /// This structure lets you customize the seperator inset as well as the color. You can also customize the seperators layers directly.
    public struct Separators {
        
        /// The seperator inset representation.
        public struct Inset {
            
            /// The seperator inset top value.
            public var top: CGFloat
            
            /// The seperator inset width value.
            public var width: CGFloat
            
            /// The seperator inset bottom value.
            public var bottom: CGFloat
            
            /// Initializes a zero value seperator inset.
            public static var zero = Inset(top: 0, width: 0, bottom: 0)
            
            public init(top: CGFloat, width: CGFloat, bottom: CGFloat) {
                self.top = top
                self.width = width
                self.bottom = bottom
            }
        }
        
        /// The separators inset.
        public var inset = Inset.zero
        
        /// The seperators color.
        public var color = UIColor.lightGray
        
        /// The separators layers.
        public internal(set) var layers = [CALayer]()
    }
    
}
