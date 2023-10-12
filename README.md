On line 25, we disable automatic resizing, and on line 29, we add our title to the view. 

What does the term "safe area layout guide" refer to? 

The safe area layout guide defines an unobscured area of the view, which can be used for aligning views to ensure maximum visibility. 

Why is [weak self] important? 

By using [weak self], we create a weak reference to the view controller in the closure. This ensures that if the view controller is deallocated, the closure will automatically have a nil reference to 'self', preventing memory leaks. 

What is the meaning of clipsToBounds? 

ClipsToBounds is a Boolean value that determines whether a view and its subviews are confined to their bounds when being drawn.
