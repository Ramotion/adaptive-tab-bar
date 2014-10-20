Pod::Spec.new do |s|
  s.name     = 'AdaptiveController'
  s.version  = '0.0.1'
  s.license  = { :type => 'MIT' }
  s.homepage = 'https://github.com/Ramotion/adaptive-tab-bar'
  s.authors  = { 'Artem Kislitsyn, Yuri Vasilenko' => 'yuri.v@ramotion.com' }
  s.summary  = 'AdaptiveController is a Progressive Reduction Swift module for adding custom states to Native or Custom UI elements.'
  s.source   = { :git => 'https://github.com/Ramotion/adaptive-tab-bar.git', :tag => "#{s.version}" }
  s.ios.platform             = :ios, "7.0"
  s.source_files = 'AdaptiveController/AdaptiveController/*.{h,swift}'
  s.frameworks = 'Swift','UIKit'
  s.requires_arc = true
end