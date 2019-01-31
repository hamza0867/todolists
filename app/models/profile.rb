class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: { in: %w[male female] }
  validate :not_both_names_null
  validate :no_male_Sue

  def not_both_names_null
    errors.add(:first_name, 'first_name and last_name both null') if first_name.nil? && last_name.nil?
  end

  def no_male_Sue
    errors.add(:first_name, 'A male can\'t have Sue as a first_name') if first_name == 'Sue' && gender == 'male'
  end

  def self.get_all_profiles(min, max)
    where('birth_year between :min and :max', min: min, max: max).order(birth_year: :asc).to_a
  end
end
