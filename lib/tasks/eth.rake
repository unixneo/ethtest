require 'rake'

[
    "../assets/eth.rb",
].each do |filename|
    require_relative filename
end

namespace :eth do

    desc "Test Hello World Contract"
    task :hello_world, [:debug]   => :environment do |t, args| 
        debugger = args[:debug].nil? ? false : args[:debug]
        
        begin
            EthGem::Core.contract("hello_world")
        rescue  Exception => e 
            puts "ETH ERROR: contract deployment failed: #{e}"
        end
    
    end
end
