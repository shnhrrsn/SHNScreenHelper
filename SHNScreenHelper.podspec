Pod::Spec.new do |s|

	s.name         = "SHNScreenHelper"
	s.version      = "1.0.1"
	s.summary      = "Utility helper for UIScreen."
	s.homepage     = "https://github.com/shnhrrsn/SHNScreenHelper"
	s.license      = "MIT"

	s.author       = "Shaun Harrison"
	s.social_media_url   = "http://twitter.com/shnhrrsn"

	s.platform     = :ios, "8.0"

	s.source       = { :git => "https://github.com/shnhrrsn/SHNScreenHelper.git", :tag => s.version }

	s.source_files = "*.swift"
	s.requires_arc = true

end