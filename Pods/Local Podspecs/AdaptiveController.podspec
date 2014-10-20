Pod::Spec.new do |s|
  s.name = 'AdaptiveController'
  s.version = '0.0.1'
  s.summary = 'AdaptiveController is a Progressive Reduction Swift module for adding custom states to Native or Custom UI elements.'
  s.license = {"type"=>"MIT"}
  s.authors = {"Artem Kislitsyn, Yuri Vasilenko"=>"yuri.v@ramotion.com"}
  s.homepage = 'https://github.com/Ramotion/adaptive-tab-bar'
  s.frameworks = ["UIKit"]
  s.requires_arc = true
  s.source = {}

  s.osx.platform             = :osx, ''
  s.osx.preserve_paths       = 'osx/AdaptiveController.framework'
  s.osx.public_header_files  = 'osx/AdaptiveController.framework/Versions/A/Headers/*.h'
  s.osx.resource             = 'osx/AdaptiveController.framework/Versions/A/Resources/**/*'
  s.osx.vendored_frameworks  = 'osx/AdaptiveController.framework'
  s.ios.platform             = :ios, ''
  s.ios.preserve_paths       = 'ios/AdaptiveController.framework'
  s.ios.public_header_files  = 'ios/AdaptiveController.framework/Versions/A/Headers/*.h'
  s.ios.resource             = 'ios/AdaptiveController.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'ios/AdaptiveController.framework'
end
