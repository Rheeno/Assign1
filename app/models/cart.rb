class Cart < ActiveRecord::Base
 has_many :Line_items, dependent: :destroy
end
