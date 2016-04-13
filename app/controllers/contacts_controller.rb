class ContactsController < ApplicationController
  
  def contacts
    @first_contact = Contact.first 
    @second_contact = Contact.find_by(id: 2)
    contacts = Contact.all
    @third_contact = contacts[2]
  end



end
