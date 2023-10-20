class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_apparel
  before_destroy :check_for_employees

  def must_carry_apparel
    # This condition `unless mens_apparel || womens_apparel` checks if the store has either mens_apparel set to true or womens_apparel set to true.
    # If the condition is not met (i.e., the store doesn't carry either men's or women's apparel), it adds an error message to the :base context using errors.add(:base, "Stores must carry at least one type of apparel").
    # In simpler terms, this validation is ensuring that a store must have at least one type of apparel. If a store is created or updated without specifying either `mens_apparel`` or `womens_apparel`, it will trigger this validation error. 
    unless mens_apparel || womens_apparel
      # Using :base is helpful when you have validations that involve multiple attributes or the overall state of the object rather than just one attribute.
      errors.add(:base, "Stores must carry at least one type of apparel")
    end
  end

  private

  def check_for_employees
    if employees.any?
      errors.add(:base, "Cannot destroy store with employees.")
      throw(:abort)
    end
  end
end
