#
# Be sure to run `pod lib lint GGFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GGFoundation'
  s.version          = '0.1.0'
  s.summary          = 'A short description of GGFoundation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.homepage         = 'https://github.com/iOSRay/GGFoundation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'waley' => 'waley518@gmail.com' }
  s.source           = { :git => 'https://github.com/iOSRay/GGFoundation.git', :tag => s.version.to_s }

  s.source_files = 'GGFoundation/Classes/**/*'
  
  s.ios.deployment_target  = '10.0'
  s.platform               = :ios, '10.0'
  s.requires_arc           = true
  s.prefix_header_contents = '#import "YYKitMacro.h"', '#import "YYKit.h"'
  s.dependency 'YYKit'
end
