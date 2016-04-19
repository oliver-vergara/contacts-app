class Contact < ActiveRecord::Base


  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def friendly_full_name
    first_name +last_name
  end

  def friendly_jap_code
    "+81 #{phone_number}"
  end

end