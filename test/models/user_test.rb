# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  user_type       :integer
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  mc_id           :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end