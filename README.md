### ethtest for chainstack

### steps

```
clone https://github.com/unixneo/ethtest.git
cd ethtest
bundle
rake eth:hello_world
```

or from the console after bundle and cd into repo

```
rails c
require "#{Rails.root}/lib/assets/eth.rb"
EthGem::Core.contract("hello_world","chainstack_ropsten")
```

Running, you will get this error:

```
ETH ERROR: infura_ropsten contract deployment failed: insufficient funds for gas * price + value
```

If you increase gas fees enough, you will this "already known"  error:

```
{"jsonrpc"=>"2.0",
"id"=>6,
"error"=>{"code"=>-32000, "message"=>"already known"}}
```

I have been in this loop for days.... 