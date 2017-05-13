class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # userinfosテーブルとのアソシエーションです
  has_one :userinfo, dependent: :destroy
  accepts_nested_attributes_for :userinfo
end
