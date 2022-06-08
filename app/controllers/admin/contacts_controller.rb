class Admin::ContactsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new
    @weekday = days[day]
    @date = Date.current.strftime('%Y年 %m月 %d日')

  end

  def index
     @customer = Customer.find(params[:customer_id])
     @contacts = Contact.page(params[:page])
     @contacts_all_count=Contact.all.count
  end

  def show
    # @customer = Customer.find(params[:customer_id])
    @contact = Contact.find(params[:id])

  end

  def create
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.new(contact_params)
    @contact.admin_id = current_admin.id
      if @contact.save
        flash[:notice]="新規登録しました"
        redirect_to admin_customer_contacts_path
      else
        @contacts = Contact.all
        render :index
      end
  end

    private

  def contact_params
    params.require(:contact).permit(:customer_id, :admin_id, :child_id, :image, :weather, :staple, :main, :side, :dessert, :staple_quantity, :main_quantity, :side_quantity, :dessert_quantity, :nap_started_at, :nap_finished_at, :comment, :humor, :defecation, :defecation_number, :temperture, :tempertured_at, :status)
  end
end

