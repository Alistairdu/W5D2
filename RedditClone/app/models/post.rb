# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, presence: true

  belongs_to :sub,
  class_name: :Sub,
  foreign_key: :sub_id

  belongs_to :author,
  class_name: :User,
  foreign_key: :user_id
  
  has_many :subs,
  through: :sub,
  source: :posts
  
end
