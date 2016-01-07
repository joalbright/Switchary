#
# Be sure to run `pod lib lint Switchary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Switchary"
  s.version          = "0.1.1"
  s.summary          = "Simple library to create an assignment that works like a ternary switch"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC

    The library supports a few operators to build a ternary - switch assignment. Also, has built in closure assignment.

                       DESC

  s.homepage         = "https://github.com/joalbright/Switchary"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jo Albright" => "me@jo2.co" }
  s.source           = { :git => "https://github.com/joalbright/Switchary.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/joalbright'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Switchary' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
