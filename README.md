### ethtest 

This is a public test repo for the `eth.rb' gem based on a larger private repo.

### steps

Set your env vars:

```shell
ENV['BLOCKCHAIN_PROVIDER_ENDPOINT']
ENV['PRIVATE_SIGNING_KEY']
ENV['ETH_WALLET_ADDRESS']
```

```
git clone https://github.com/unixneo/ethtest.git
cd ethtest
bundle
```
Then:

```
rake eth:hello_world
```

or from the console after bundle and cd into repo

```
rails c
require "#{Rails.root}/lib/assets/eth.rb"
EthGem::Core.contract("hello_world")
```