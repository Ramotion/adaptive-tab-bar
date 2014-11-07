def run(command)
  system(command) or raise "RAKE TASK FAILED: #{command}"
end

namespace "test" do
  desc "Run unit tests for all iOS targets"
  task :ios do |t|
  	run "xcodebuild -workspace adaptive-tab-bar/SamplesAdaptiveController.xcworkspace -scheme AdaptiveController"
    run "xcodebuild -workspace adaptive-tab-bar/SamplesAdaptiveController.xcworkspace -scheme AdaptiveControllerTests  test"
  end

end

task default: ["test:ios"]