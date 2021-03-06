# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  cash_balance :decimal(15, 2)
#  name         :string
#  password     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :ownerships, dependent: :delete_all
  has_many :stocks, through: :ownerships
  has_many :transactions, dependent: :delete_all
  has_many :portfolio_value_histories, dependent: :delete_all
  has_many :exchanges, dependent: :delete_all

  def portfolio_value
    total_value = self.cash_balance
    portfolio_ownerships = self.ownerships.includes(:stock)
    portfolio_ownerships.each do |ownership|
      total_value += ownership.num_shares * ownership.stock.share_price
    end
    total_value
  end

  def stocks_ownership
    self.ownerships.includes(:stock)
  end
end
