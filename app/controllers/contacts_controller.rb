class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def new

  end 

  def create
    new_contact = Contact.new(name: params[:name], address: params[:address], phone_number: params[:phone_number])
    new_contact.save
    flash[:success] = "Contact Added"
    redirect_to "/contacts/#{new_contact.id}"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.name = params[:name]
    @contact.address = params[:address]
    @contact.phone_number = params[:phone_number]
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
