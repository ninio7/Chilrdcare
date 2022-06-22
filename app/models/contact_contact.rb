class ContactContact < ApplicationRecord
  def admin_contact(day)
    Contact.find_by(id: self.admin_contact_id)
  end

  def customer_contact(day)
    Contact.find_by(id: self.customer_contact_id)
  end

  def self.check_customer_contact(day, customer)
    contacts_ids = customer.contacts.ids
    contact_contact_ids = ContactContact.where(day: day.to_i).pluck(:customer_contact_id)
    duplicate_ids = contacts_ids & contact_contact_ids
    duplicate_ids.present?
  end

  def self.check_admin_contact(day, admin)
    contacts_ids = admin.contacts.ids
    admin_contact_ids = ContactContact.where(day: day.to_i).pluck(:admin_contact_id)
    duplicate_ids = contacts_ids & admin_contact_ids
    duplicate_ids.present?
  end
end