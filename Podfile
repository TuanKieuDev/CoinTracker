# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CoinTracker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WeatherForecast

    # ReactiveX
    pod 'RxSwift', '~> 5.1.1'
    pod 'RxCocoa', '~> 5.1.1'
    pod 'RxDataSources', '~> 4.0.1'
    pod 'NSObject+Rx', '~> 5.1.0'
    pod 'RxAlamofire', '~> 5.7.1'
    pod "RxGesture"
    pod 'RxSwiftUtilities', '~> 2.2.0'

    # API Service
    pod 'Alamofire', '~> 5.9.1'
    pod 'ObjectMapper', '~> 4.2.0'
    
    # Core
    pod 'Then', '~> 3.0.0'
    pod 'Reusable', '~> 4.1.1'
    pod 'MBProgressHUD',:git => 'https://github.com/jdg/MBProgressHUD.git'
    pod 'SDWebImage', '~> 5.18.7'
    pod 'SwiftLint', '~> 0.46.0'

end

deployment_target = '12.0'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
            end
        end
        project.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
    end
end
