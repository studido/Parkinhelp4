#Uncomment next line to define global platform for the project
#platform :ios, '12.1'
use_frameworks!

def shared_pods
  pod 'Firebase/Analytics'
  pod 'Firebase'
  pod 'Firebase/Auth'
  pod 'FirebaseDatabase'
  pod 'GoogleSignIn', '<5.0.0'
end

target "275_test" do
  
  pod 'Firebase/Analytics'
  pod 'Firebase'
  pod 'Firebase/Auth'
  pod 'FirebaseDatabase'
  pod 'GoogleSignIn', '<5.0.0'
  
  #target '275_testTests' do
  #  inherit! :search_paths
  #end
  
  #target '275_testUITests' do
  #  inherit! :search_paths
  #end
  
end

target '275_testTests' do
  inherit! :search_paths
  shared_pods
end

target '275_testUITests' do
  inherit! :search_paths
  shared_pods
end
