# == Schema Information
#
# Table name: books
#
#  id                 :bigint           not null, primary key
#  collect_ended_at   :datetime
#  collect_started_at :datetime
#  description        :string
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
require "test_helper"

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
