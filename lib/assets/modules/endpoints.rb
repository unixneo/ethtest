module Endpoint
    class Provider
        def initialize
        end
        # removed provider specific endpoints for public repo
        def self.get(provider_network=ENV['BLOCKCHAIN_PROVIDER_ENDPOINT'])
            ENV['BLOCKCHAIN_PROVIDER_ENDPOINT'].nil? ? nil :  ENV['BLOCKCHAIN_PROVIDER_ENDPOINT']
        end
    end
end

