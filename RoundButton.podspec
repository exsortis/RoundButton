Pod::Spec.new do |s|

  s.name         = "RoundButton"
  s.version      = "1.1"
  s.summary      = "A round, framed button"

  s.description  = <<-DESC
                    A round, framed button that includes a drop-shadow.
                   DESC
  s.homepage     = "https://github.com/exsortis/RoundButton"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Paul Schifferer" => "paul@schifferers.net" }
  s.social_media_url   = "https://twitter.com/paulyhedral"

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/exsortis/RoundButton.git", :tag => s.version.to_s }

  s.source_files  = "RoundButton/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.public_header_files = "RoundButton/**/*.h"

  s.requires_arc = true

end
