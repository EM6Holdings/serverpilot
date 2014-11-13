require 'ServerPilot/version'
require 'ServerPilot/connection'

module ServerPilot

  class API

    def initialize(api_client_id, api_key)

      @sp_client_id = api_client_id

      @sp_key = api_key

    end

    def build_path(action, id = nil)

      if action === 'ssl'

        ['/v1', 'apps', id, 'ssl'] * '/'

      else

        if id
          ['/v1', action, id] * '/'
        else
          ['/v1', action] * '/'
        end

      end

    end

    def method_missing(name, *arguments)

      #Check if name includes one and only one underscore
      if (name.to_s.include? '_') && (name.to_s.count('_') === 1)

        #Get the verb to call
        verb = case name.to_s.downcase
                 when /^get/ then 'get'
                 when /^post/ then 'post'
                 when /^delete/ then 'delete'
                 else nil
               end

        #Check if the verb used is not nil
        if verb

          #Get the action to execute
          action = name.to_s.downcase.split('_').last

          #Check the number of arguments passed is zero
          if arguments.length === 0

            #Get the path (e.g. /servers) to call without id
            path = build_path action

          else

            #Check if the first argument is an integer value
            if (arguments[0].is_a? Integer) || (arguments[0].is_a? String)

              #Get the path (e.g. /servers) to call passing the integer
              path = build_path action, arguments[0]

              #Check if the second argument is a hash and assign to params
              if arguments[1].is_a? Hash
                params = arguments[1]
              end

            else

              #Get the path (e.g. /servers) to call
              path = build_path action

              #If the first argument is a hash
              if arguments[0].is_a? Hash
                params = arguments[0]
              end

            end

          end

          #Create a new connection
          connection = ServerPilot::Connection.new(@sp_client_id, @sp_key)

          #Execute the command via the connection and return the results
          connection.execute verb, path, params

        else
          #Raise an exception based on the verb used is not correct
          raise ArgumentError, 'Unsupported verb, functions should begin get_ post_ or delete_', caller
        end

      else
        #Raise an exception based on the name of the function being incorrect
        raise ArgumentError, 'Multiple underscores not allowed in function call', caller
      end

    end

  end

end
