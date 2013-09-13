omniauth-arcgis
===============

ArcGIS Online strategy for [OmniAuth](https://github.com/intridea/omniauth)

Installation
------------

```
gem install omniauth-arcgis
```

or in a Gemfile,

```
gem 'omniauth'
gem 'omniauth-arcgis'
```

Basic Sinatra Example
---------------------

```
class SinatraApp < Sinatra::Base

  configure do
    set :sessions, true
  end

  use OmniAuth::Builder do
    # Register an app at https://developers.arcgis.com
    provider :arcgis, 'CLIENT ID', 'CLIENT SECRET'  
  end

  get '/' do
    <<-HTML
    <p><a href='/auth/arcgis'>Sign in with ArcGIS Online</a></p>
    HTML
  end

  get '/auth/:provider/callback' do
    erb "<h1>#{params[:provider]}</h1>
         <pre>#{JSON.pretty_generate(request.env['omniauth.auth'])}</pre>"
  end

end
```


### License

```
Copyright 2013 by Esri

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
