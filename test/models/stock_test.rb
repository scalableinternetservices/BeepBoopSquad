# == Schema Information
#
# Table name: stocks
#
#  id          :bigint           not null, primary key
#  name        :string
#  symbol      :string
#  share_price :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end