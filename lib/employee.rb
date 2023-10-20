class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  before_create :generate_password
  # before_save :generate_password, if: -> { new_record? }

  private

  def generate_password
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    random_string = Array.new(8) { chars.sample }.join
    self.password = random_string
  end
end
