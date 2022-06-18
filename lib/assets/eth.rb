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
        puts "Endpoint: #{Endpoint::Provider.get}"
        chain = Eth::Client.create Endpoint::Provider.get
        gas_pump = 2
        chain.gas_limit=70000
        gas_price =  chain.max_fee_per_gas
        chain.max_fee_per_gas = gas_price *  gas_pump
        gas_limit=chain.gas_limit
        chain.gas_limit = gas_limit *  gas_pump
        puts "PUMPED UP GAS: chain.max_fee_per_gas=#{chain.max_fee_per_gas} & chain.gas_limit=#{chain.gas_limit}"
        #chain.gas_limit = 230_420
        
        addr = Eth::Address.new Wallet::Address.eth_wallet_address
        puts "METAMASK_ADDRESS: #{addr.to_s}"
        deposit_contract = Eth::Address.new  addr.to_s
        balance = (chain.get_balance deposit_contract).to_f
        puts "Balance is #{balance.round(8)}"
        
        contract_file = "#{Rails.root}/lib/assets/contracts/#{file}.sol"
        puts "FILE: #{contract_file}"
        contract = Eth::Contract.from_file(file: contract_file)
        
        
        puts "Gas Max Fee: #{chain.eth_gas_price}"
        priv_key = ENV['PRIVATE_SIGNING_KEY']
       
        key = Eth::Key.new priv:  priv_key 

        tx_id = chain.deploy_and_wait(contract,sender_key:key)
        results = chain.eth_get_transaction_by_hash tx_id 
        puts results
       end

  end
end
