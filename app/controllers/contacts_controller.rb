class ContactsController < ApplicationController
  
  def index
    sort = params[:sort]
    if sort = nil
      @contacts = current_user.contacts
    else
      @contacts = Contact.order(sort)
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def new

  end 

  def create
    address = params[:address]
    coordinates = Geocoder.coordinates(address)
    new_contact = Contact.new(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], address: params[:address], phone_number: params[:phone_number], latitude: coordinates[0], longitude: coordinates[1], user_id: current_user.id)
    new_contact.save
    flash[:success] = "Contact Added"
    redirect_to "/contacts/#{new_contact.id}"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name]
    @contact.middle_name = params[:middle_name]
    @contact.last_name = params[:last_name]
    @contact.address = params[:address]
    @contact.phone_number = params[:phone_number]
    @contact.latitude = params[:latitude]
    @contact.longitude = params[:longitude]
    @contact.save
    flash[:success] = "Contact Updated"
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:success] = "Contact Deleted"
    redirect_to "/contacts"
  end

end
