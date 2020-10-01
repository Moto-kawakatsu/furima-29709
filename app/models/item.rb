class Item < ApplicationRecord


belongs_to :user
has_one :purchase

# with_options presence: true do
#     validates :password, length: {minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
    
end
end
