# == Schema Information
#
# Table name: exchanges
#
#  id            :bigint           not null, primary key
#  amount        :bigint
#  exchange_date :datetime
#  type          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_exchanges_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Exchange < ApplicationRecord
  belongs_to :user
  enum type: [:deposit, :withdrawal]
end
