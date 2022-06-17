class Keybank < ApplicationRecord
    encrypts :private,:seed_phrase, deterministic: true
end
