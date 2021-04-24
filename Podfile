# Uncomment the next line to define a global platform for your project
platform :ios, '13.5'

target 'English' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'RealmSwift','5.1.0'
 # add the Firebase pod for Google Analytics
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Google-Mobile-Ads-SDK'
# add pods for any other desired Firebase products
# https://firebase.google.com/docs/ios/setup#available-pods
  # Pods for English
  

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
  end
end




end
