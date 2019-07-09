# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  title       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord

    validates :user_id, :title, :description, presence: true

    has_many :posts,
    class_name: :Post,
    foreign_key: :sub_id

    belongs_to :moderator,
    class_name: :User,
    foreign_key: :user_id

end
