class Contact < ActiveRecord::Base

  belongs_to :user


  def friendly_updated_at
    updated_at.strftime("%m-%e-%y %H:%M")
  end

  def full_name
    "#{first_name}  #{middle_name}  #{last_name}"
  end

  def jap_code
    "+81 #{phone_number}"
  end

end