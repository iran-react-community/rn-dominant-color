require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|

  s.name          = "RNDominantColor"
  s.version       = package['version']
  s.summary       = package['description']
  s.authors       = { "Matin ZD" => "zadehdolatabad@gmail.com" }
  s.homepage      = "https://github.com/matinzd/rn-dominant-color"
  s.license       = "MIT"
  s.platforms     = { :ios => "8.0", :tvos => "9.0" }
  s.framework     = 'UIKit'
  s.requires_arc  = true
  s.source        = { :git => "https://github.com/matinzd/rn-dominant-color.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m,swift}"
  s.swift_version = '4.0'

  s.dependency 'React'

end
