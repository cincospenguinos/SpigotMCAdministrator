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

class User < ApplicationRecord
	has_secure_password
	enum user_type: [ :user, :admin ]

	validates_presence_of :username, :user_type, :email, :user_type, :password_digest
	validates_format_of :email, with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

	def is_admin?
		self.user_type.to_sym == :admin
	end
end
