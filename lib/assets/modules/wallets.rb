module Wallet
    class Address
        def initialize
        end

        def self.metamask_eth
           ENV['METAMASK_ETH_ADDRESS'].nil? ? nil : ENV['METAMASK_ETH_ADDRESS']
        end

        def self.metamask 
            "0xE179C056024150d56A4e94af9C5A36BCC0B4e502"
        end

        def self.metamask_beta
            "0xB9719112650A834B06Bae0fb3a948ce6e9d31185"
        end

        def self.metamask_delta
            "0x1FD81f8A8656Ad7b02B72fA811b08f23a0d2a899"
        end

        def self.metamask_gamma
            "0xb3A1E573AaeB3D5b1A82731D598be91Ba39673D2"
        end

        def self.metamask_pi
            "0x9C503Be37Bdf4B0217E8339135f15182cFb36aB4"
        end

        def self.metamask_ruby
            "0x863de77F62cf351124A386Cbd4eC3925d28358F1"
        end

        def self.metamask_zeta
            "0xf3f40E53432a66aF32f5dAe80caC917a3525821d"
        end

        def self.all 
            [
                metamask, 
                metamask_beta,
                metamask_delta,
                metamask_gamma,
                metamask_pi,
                metamask_ruby,
                metamask_zeta,     
            ]
        end
    end
end