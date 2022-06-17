module Endpoint
    class Provider
        def initialize
        end
        def self.get(provider_network=ENV['INFURA_ENDPOINT_ROPSTEN'])
                if provider_network == "infura_mainnet"
                    ENV['INFURA_ENDPOINT_MAINNET'].nil? ? nil :  ENV['INFURA_ENDPOINT_MAINNET']

                elsif provider_network == "infura_goerli"
                    ENV['INFURA_ENDPOINT_GOERLI'].nil? ? nil :  ENV['INFURA_ENDPOINT_GOERLI']
                
                elsif provider_network == "infura_ropsten"
                    ENV['INFURA_ENDPOINT_ROPSTEN'].nil? ? nil :  ENV['INFURA_ENDPOINT_ROPSTEN']    

                elsif provider_network == "infura_koven"
                    ENV['INFURA_ENDPOINT_KOVAN'].nil? ? nil :  ENV['INFURA_ENDPOINT_KOVAN'] 
                else
                    ENV['INFURA_ENDPOINT_ROPSTEN'].nil? ? nil :  ENV['INFURA_ENDPOINT_ROPSTEN']    
            end
        end   
    end
end

