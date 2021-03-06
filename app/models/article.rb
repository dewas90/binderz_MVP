class Article < ApplicationRecord
  before_validation :generate_hash

  validates :title, presence: true
  validates :text, presence: true
  validates :text_hash, presence: true
  validates :user_id, presence: true

  belongs_to :user

  def generate_hash
    self.text_hash = Digest::SHA256.hexdigest self.text
  end

end
