module Endpoint
    class Provider
        def initialize
        end
        def self.get(provider_network=ENV['ALCHEMY_ENDPOINT_GOERLI'])
            if provider_network == "alchemy_mainnet"
                    ENV['ALCHEMY_ENDPOINT_ETH_MAINNET'].nil? ? nil :  ENV['ALCHEMY_ENDPOINT_ETH_MAINNET']

                elsif provider_network == "getblock_goerli"
                    ENV['GETBLOCK_ENDPOINT_GOERLI'].nil? ? nil :  ENV['GETBLOCK_ENDPOINT_GOERLI']

                elsif provider_network == "quicknode_ropsten"
                    ENV['QUICKNODE_ENDPOINT_ROPSTEN'].nil? ? nil :  ENV['QUICKNODE_ENDPOINT_ROPSTEN']

                elsif provider_network == "quicknode_goerli"
                    ENV['QUICKNODE_ENDPOINT_GOERLI'].nil? ? nil :  ENV['QUICKNODE_ENDPOINT_GOERLI']
                
                elsif provider_network == "chainstack_ropsten"
                    ENV['CHAINSTACK_ENDPOINT_ROPSTEN'].nil? ? nil :  ENV['CHAINSTACK_ENDPOINT_ROPSTEN']

                elsif provider_network == "chainstack_goerli"
                    ENV['CHAINSTACK_ENDPOINT_GOERLI'].nil? ? nil :  ENV['CHAINSTACK_ENDPOINT_GOERLI']

                elsif provider_network == "alchemy_goerli"
                    ENV['ALCHEMY_ENDPOINT_GOERLI'].nil? ? nil :  ENV['ALCHEMY_ENDPOINT_GOERLI']

                elsif provider_network == "alchemy_rinkeby"
                    ENV['ALCHEMY_ENDPOINT_RINK'].nil? ? nil :  ENV['ALCHEMY_ENDPOINT_RINK']

                elsif provider_network == "infura_mainnet"
                    ENV['INFURA_ENDPOINT_MAINNET'].nil? ? nil :  ENV['INFURA_ENDPOINT_MAINNET']

                elsif provider_network == "infura_goerli"
                    ENV['INFURA_ENDPOINT_GOERLI'].nil? ? nil :  ENV['INFURA_ENDPOINT_GOERLI']
                
                elsif provider_network == "infura_ropsten"
                    ENV['INFURA_ENDPOINT_ROPSTEN'].nil? ? nil :  ENV['INFURA_ENDPOINT_ROPSTEN']    

                elsif provider_network == "infura_koven"
                    ENV['INFURA_ENDPOINT_KOVAN'].nil? ? nil :  ENV['INFURA_ENDPOINT_KOVAN'] 

                elsif provider_network == "quicknode_bsc"
                    ENV['QUICKNODE_ENDPOINT_BSC'].nil? ? nil :  ENV['QUICKNODE_ENDPOINT_BSC'] 

                else
                    ENV['ALCHEMY_ENDPOINT_GOERLI'].nil? ? nil :  ENV['ALCHEMY_ENDPOINT_GOERLI']
            end
        end

        def self.core_nodes
            [
                ENV['INFURA_ENDPOINT_MAINNET'],
                ENV['INFURA_ENDPOINT_ROPSTEN'],
                ENV['ALCHEMY_ENDPOINT_GOERLI'],
                ENV['ALCHEMY_ENDPOINT_RINK'],
                ENV['INFURA_ENDPOINT_KOVAN'],
                ENV['QUICKNODE_ENDPOINT_BSC'],
            ]
        end
    end
end

