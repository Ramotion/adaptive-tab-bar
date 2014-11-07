def run(command)
  system(command) or raise "RAKE TASK FAILED: #{command}"
end

exec( "pwd" )

namespace "test" do
  desc "Run unit tests for all iOS targets"
  task :ios do |t|
    run "xcodebuild -project './adaptive-tab-bar/SamplesAdaptiveController.xcworkspace' -scheme AdaptiveControllerTests clean test"
  end

end

task default: ["test:ios"]