module EthGem 
    require "eth"
    require "colorize"
   
    require "#{Rails.root}/lib/assets/config.rb"

    class Core
       include Endpoint
       include Wallet
       def initialize
       
       end

       
       def self.contract(file="hello_world")
        return nil if file.nil?
        addr = Eth::Address.new Wallet::Address.eth_wallet_address
        puts "Endpoint: #{Endpoint::Provider.get}"
        chain = Eth::Client.create Endpoint::Provider.get

        # the follow three gas params are per Chainstack (E. K.)
        chain.gas_limit = 200000 
        chain.max_priority_fee_per_gas=0.3e11
        chain.max_fee_per_gas=0.31e11
        # end gas params
        
        puts "GAS Params: chain.max_fee_per_gas=#{chain.max_fee_per_gas} chain.gas_limit=#{chain.gas_limit} max_priority_fee_per_gas=#{chain.max_priority_fee_per_gas}"
      
        
        puts "METAMASK_ADDRESS: #{addr.to_s}"
        deposit_contract = Eth::Address.new  addr.to_s
        balance = (chain.get_balance deposit_contract).to_f
        puts "Balance is #{balance.round(8)}"
        
        contract_file = "#{Rails.root}/lib/assets/contracts/#{file}.sol"
        puts "FILE: #{contract_file}"
        contract = Eth::Contract.from_file(file: contract_file)
        
        priv_key = ENV['PRIVATE_SIGNING_KEY']
       
        key = Eth::Key.new priv:  priv_key 

        tx_id = chain.deploy_and_wait(contract,sender_key:key)
        results = chain.eth_get_transaction_by_hash tx_id 
        puts results
       end

  end
end
