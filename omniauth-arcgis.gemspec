require './lib/omniauth-arcgis/version'
Gem::Specification.new do |s|
  s.name = 'omniauth-arcgis'
  s.version = OmniAuth::ArcGIS::VERSION
  s.authors = ['Aaron Parecki']
  s.email = ['aparecki@esri.com']
  s.homepage = 'https://github.com/Esri/omniauth-arcgis'
  s.summary = 'ArcGIS Online adapter for OmniAuth'
  s.description = 'ArcGIS Online adapter for OmniAuth.'
  s.license = 'Apache 2.0'

  s.files = ['lib/omniauth-arcgis.rb', 'lib/omniauth/strategies/arcgis.rb', 'lib/omniauth-arcgis/version.rb']
  s.require_paths = %w[lib]

  s.add_dependency 'omniauth-oauth2', '>= 1.1.1'
end