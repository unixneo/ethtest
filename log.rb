require 'ostruct'
require 'ethereum.rb'

client = Eth::Client.create(ENV['QUICKNODE_ALPHA'])
abi = [
  {
    "inputs": [],
    "name": "increment",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "oldValue",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "newValue",
        "type": "uint256"
      }
    ],
    "name": "ValueChanged",
    "type": "event"
  },

  {
    "inputs": [],
    "name": "getCount",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
]

contract =  client.create(
  client: client,
  name: "event", 
  address: "CONTRACT_ADDRESS_FROM_REMIX", 
  abi: abi
)
event_abi = contract.abi.find {|a| a['name'] == 'ValueChanged'}
event_inputs = event_abi['inputs'].map {|i| OpenStruct.new(i)}
decoder = Ethereum::Decoder.new
filter_id = contract.new_filter.value_changed(
  {
    from_block: '0x0',
    to_block: 'latest',
    address: 'CONTRACT_ADDRESS_FROM_REMIX',
    topics: []
  }
)

events = contract.get_filter_logs.value_changed(filter_id)
events.each do |event|
  transaction_id = event[:transactionHash]
  transaction = client.eth_get_transaction_receipt(transaction_id)
  logs = transaction.dig('result', 'logs').find { |d| d['data'] != "0x" }
  data = logs.fetch('data')
  args = decoder.decode_arguments(event_inputs, data)
  eventlogs = transaction.inspect
  block = logs.fetch('blockNumber')
  puts "Transaction: #{eventlogs} with args: #{args}"
  puts "-" * 20
  puts "The Transaction was added to block: #{block.to_i(16)}" 
end
