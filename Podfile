source 'https://github.com/CocoaPods/Specs.git'

platform :osx, '10.12'
use_frameworks!

target 'Cryptotable' do
  
pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :tag => ‘4.4.0’
pod 'SwiftyJSON'
pod 'CustomSegue'


end


post_install do |installer|
   installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
           config.build_settings['SWIFT_VERSION'] = '3.0'
       end
   end
end