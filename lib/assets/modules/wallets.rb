module Wallet
    class Address
        def initialize
        end

        def self.metamask_eth
           ENV['METAMASK_ETH_ADDRESS'].nil? ? nil : ENV['METAMASK_ETH_ADDRESS']
        end
    end
end