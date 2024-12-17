#
# Be sure to run `pod lib lint MGActionSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XMGActionSheet'
  s.version          = '0.2.0'
  s.summary          = 'MGActionSheet. 一款仿微信底部弹框，支持高度自定义'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.homepage         = 'https://github.com/xiaomage1478/MGActionSheet'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '小马哥' => '354938940@qq.com' }
  s.source           = { :git => 'https://github.com/xiaomage1478/MGActionSheet.git', :tag => "#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_versions = '6.0'
  s.source_files = 'XMGActionSheet/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MGActionSheet' => ['MGActionSheet/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'FloatingBottomSheet'
end
