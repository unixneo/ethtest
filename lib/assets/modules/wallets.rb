module Wallet
    class Address
        def initialize
        end

        def self.eth_wallet_address
           ENV['METAMASK_ETH_ADDRESS'].nil? ? nil : ENV['METAMASK_ETH_ADDRESS']
        end
    end
end