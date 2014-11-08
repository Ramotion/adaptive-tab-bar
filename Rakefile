def run(command)
  system(command) or raise "RAKE TASK FAILED: #{command}"
end

namespace "test" do
  desc "Run unit tests for all iOS targets"
  task :ios do |t|
  	run "xcodebuild -project AdaptiveController/AdaptiveController.xcodeproj  -scheme AdaptiveController"
    run "xcodebuild -project AdaptiveController/AdaptiveController.xcodeproj  -scheme AdaptiveControllerTests  test"
  end

end

task default: ["test:ios"]