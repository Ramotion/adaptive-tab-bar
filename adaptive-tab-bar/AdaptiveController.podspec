Pod::Spec.new do |s|
  s.name     = 'AdaptiveController'
  s.version  = '0.0.1'
  s.license  = { :type => 'MIT' }
  s.homepage = 'https://github.com/Ramotion/adaptive-tab-bar'
  s.authors  = { 'Artem Kislitsyn, Yuri Vasilenko' => 'yuri.v@ramotion.com' }
  s.summary  = 'Elegant state machine for Swift.'
  s.source   = { :git => 'https://github.com/Ramotion/adaptive-tab-bar', :tag => "#{s.version}" }
  s.source_files = 'SwiftState/*.{h,swift}'
  s.frameworks = 'Swift'
  s.requires_arc = true
end