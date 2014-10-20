platform :ios, "7.0"

source 'https://github.com/CocoaPods/Specs.git'

workspace 'SamplesAdaptiveController.xcworkspace'

xcodeproj 'Samples/adaptive-dates-tabbar/example-date-adaptive-tab-bar.xcodeproj'
xcodeproj 'Samples/adaptive-launches-tabbar/example-count-launches-adaptive-tabbar.xcodeproj'

link_with ['example-count-launches-adaptive-tabbar', 'example-date-adaptive-tab-bar'] 

target 'example-date-adaptive-tab-bar' , :exclusive => true do
    
 xcodeproj 'Samples/adaptive-dates-tabbar/example-date-adaptive-tab-bar.xcodeproj'   
 pod "AdaptiveController", :path => "./AdaptiveController-0.0.1"

end

target 'example-count-launches-adaptive-tabbar' , :exclusive => true do
    
  xcodeproj 'Samples/adaptive-launches-tabbar/example-count-launches-adaptive-tabbar.xcodeproj'
  pod "AdaptiveController", :path => "./AdaptiveController-0.0.1"

end


post_install do |installer|
  installer.project.targets.each do |target|
    puts "#{target.name}"
  end
end

#post_install do |installer|
#  settings = Xcodeproj::Project.send(:build_settings, Pod::Platform.new(:ios), :debug)
#  configs  = installer.project.build_configurations
#  configs.new('name' => 'Spec', 'buildSettings' => settings.merge('CONFIGURATION_BUILD_DIR' => '$(BUILD_DIR)/Debug$(EFFECTIVE_PLATFORM_NAME)'))
#end

#post_install do |installer_representation|
#    workDir = Dir.pwd
#    xcconfigFilename = "#{workDir}/Pods/Target Support Files/Pods-AdaptiveController/Pods-AdaptiveController.xcconfig"
#    xcconfig = File.read(xcconfigFilename)
#    newXcconfig = xcconfig.gsub(/HEADER_SEARCH_PATHS = "/, "HEADER_SEARCH_PATHS = $(inherited) \"")
#    File.open(xcconfigFilename, "w") { |file| file << newXcconfig }
#end