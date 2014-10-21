



Pod::Spec.new do |s|
  s.name = 'AdaptiveController'
  s.version = '0.0.5'
  s.summary = 'AdaptiveController is a Progressive Reduction Swift module for adding custom states to Native or Custom UI elements.'
  s.license = {"type"=>"MIT"}
  s.authors = {"Artem Kislitsyn, Yuri Vasilenko"=>"juri.v@ramotion.com"}
  s.homepage = 'https://github.com/Ramotion/adaptive-tab-bar'
  #s.frameworks = ["UIKit"]
  s.frameworks          = 'Foundation', 'AdaptiveController','UIKit'

  
  s.requires_arc = true
  s.source = { :git => 'https://github.com/Ramotion/adaptive-tab-bar.git', :tag => "#{s.version}" }
  
  #s.source_files        = 'AdaptiveController/AdaptiveController/*.{h}'  
  
  # Crashes here - Source_file imports MyFramework.h. If I take this out, it passes spec lint validation
  
  s.osx.platform             = :osx, ''
  s.osx.preserve_paths       = 'AdaptiveController-0.0.1/osx/AdaptiveController.framework'
  s.osx.public_header_files  = 'AdaptiveController-0.0.1/osx/AdaptiveController.framework/Versions/A/Headers/*.h'
  s.osx.vendored_frameworks  = 'AdaptiveController-0.0.1/osx/AdaptiveController.framework'

  s.ios.platform             = :ios, "7.0"
  s.ios.preserve_paths       = 'AdaptiveController-0.0.1/ios/AdaptiveController.framework'
  s.ios.public_header_files  = 'AdaptiveController-0.0.1/ios/AdaptiveController.framework/Versions/A/Headers/*.h','AdaptiveController/AdaptiveController/*.{h,swift}'
  s.ios.vendored_frameworks  = 'AdaptiveController-0.0.1/ios/AdaptiveController.framework'

end
