class Userinfo < ApplicationRecord
  # usersテーブルとのアソシエーションです
  belongs_to :user
end
