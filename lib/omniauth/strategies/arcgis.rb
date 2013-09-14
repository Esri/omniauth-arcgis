require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class ArcGIS < OmniAuth::Strategies::OAuth2
      option :name, 'arcgis'

      option :client_options, {
        :site => 'https://www.arcgis.com',
        :authorize_url => 'https://www.arcgis.com/sharing/oauth2/authorize',
        :token_url => 'https://www.arcgis.com/sharing/oauth2/token'
      }

      # Force the access token response to be parsed as JSON even though the content type header response is text/plain
      option :token_params, {
        :parse => :json
      }

      uid { 
        raw_info['id'] 
      }

      info do
        info = raw_info['user'] || {}
        info = deep_symbolize(info)
        info[:name] = info[:fullName]
        info
      end

      extra do
        {
          :subscriptionInfo => raw_info['subscriptionInfo'],
          :appInfo => raw_info['appInfo'],
          :allSSL => raw_info['allSSL']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/sharing/portals/self', {:parse => :json, :params => {:f => 'json', :token => access_token.token}}).parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'arcgis', 'ArcGIS'
