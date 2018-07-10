#
# Be sure to run `pod lib lint Kobeios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Kobeios'
  s.version          = '0.1.0'
  s.summary          = 'A Kobe library to implement default logic'


  s.description      = <<-DESC
Basic logic that we reapeat every day :)
                       DESC

  s.homepage         = 'https://github.com/fbttec/Kobeios.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rodrigo.freitas@kobe.io' => 'rodrigo.freitas@kobe.io' }
  s.source           = { :git => 'https://github.com/fbttec/Kobeios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Kobeios/Classes/**/*'
  
  s.resource_bundles = {
     'Kobeios' => ['Kobeios/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'R.swift'
    s.dependency 'Kingfisher'

end
