require 'rake'

[
    "../assets/eth.rb",
].each do |filename|
    require_relative filename
end

namespace :eth do

    desc "Test Hello World Contract"
    task :hello_world, [:test_network, :debug]   => :environment do |t, args| 
        provider_network = args[:test_network].nil? ? "infura_ropsten" : args[:test_network]
        debugger = args[:debug].nil? ? false : args[:debug]
        if debugger
            EthGem::Core.contract("hello_world", provider_network)
        else
            begin
                EthGem::Core.contract("hello_world", provider_network)
            rescue  Exception => e 
                puts "ETH ERROR: #{provider_network} contract deployment failed: #{e}"
            end
        end
    end

    desc "Update Wallet"
    task :update_wallet, [:reserved]   => :environment do |t, args| 
        flag = args[:test_network].nil? ? nil : args[:reserved]
        begin
            status = EthGem::Core.update_wallet
            puts "Wallet Update Status: #{status}"
        rescue  Exception => e 
            puts "ETH ERROR: Update Wallet Failed: #{e}"
        end
    end

end
