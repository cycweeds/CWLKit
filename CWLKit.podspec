#
# Be sure to run `pod lib lint CWLKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CWLKit'
  s.version          = '1.4.2'
  s.summary          = 'swift项目中常用的方法'
  s.swift_version = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/cycweeds/CWLKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cycweeds' => 'cycweeds@gmail.com' }
  s.source           = { :git => 'https://github.com/cycweeds/CWLKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  # 文件顺序不能换  不然会无法通过
  s.source_files = 'CWLKit/Classes/*','CWLKit/Classes/**/*'

end
