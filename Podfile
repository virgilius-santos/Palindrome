# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'
use_frameworks!

def swinject_pods
    pod 'Swinject', '2.5.0'
    pod 'SwinjectStoryboard', '2.1.0'
end

target 'Palindrome' do
    # Pods for Palindrome
    pod 'RealmSwift', '3.11.1'
    pod 'IQKeyboardManager', '6.2.0'
    swinject_pods
end

def testing_pods
    pod 'Quick', '1.3.2'
    pod 'Nimble', '7.3.1'
    swinject_pods
end

target 'PalindromeTests' do
    testing_pods
end
