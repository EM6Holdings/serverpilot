require 'net/http'
require 'uri'
require 'json'
require 'ostruct'

module ServerPilot

  class Connection

    ENDPOINT = {
        :scheme => 'https',
        :host => 'api.serverpilot.io',
        :port => 443
    }

    def initialize(api_client_id, api_key)
      @sp_client_id = api_client_id
      @sp_key = api_key
    end

    def create_uri(path)

      URI::Generic.build({:scheme=>ENDPOINT[:scheme], :host=>ENDPOINT[:host], :path=>path, :port=>ENDPOINT[:port]})

    end

    def request(verb, path, params = nil)

      uri = create_uri path

      Net::HTTP.start(uri.host,uri.port,:use_ssl => true) do |http|

        case verb.downcase
          when 'get'
            request = Net::HTTP::Get.new uri.path
          when 'post'
            request = Net::HTTP::Post.new uri.path, initheader = {'Content-Type' => 'application/json'}
            request.body = params.to_json
          when 'delete'
            request = Net::HTTP::Delete.new uri.path
        end

        request.basic_auth @sp_client_id, @sp_key

        http.request request

      end

    end

    def parse_json(response)

      body = JSON.parse(response.body)

      OpenStruct.new(:code => response.code, :body => body)

    end

    def execute(verb, path, params = nil)

      response = request(verb, path, params)

      parse_json response

    end

  end

end