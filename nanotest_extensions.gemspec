Gem::Specification.new do |s|
  s.name                = "nanotest_extensions"
  s.summary             = "Nano extensions for nanotest"
  s.description         = "Nano extensions for nanotest."
  s.author              = "Martin Aumont"
  s.email               = "mynyml@gmail.com"
  s.homepage            = "http://github.com/mynyml/nanotest_extensions"
  s.rubyforge_project   = "nanotest_extensions"
  s.require_path        = "lib"
  s.version             = "0.6.1"
  s.files               =  File.read("Manifest").strip.split("\n")

  s.add_development_dependency 'nanotest'
end
