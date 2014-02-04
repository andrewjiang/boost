class AddStructuredPartnerNotesToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :partner_note, :text
    add_column :users, :parking_instructions, :text
    add_column :users, :parking_timing, :text
    add_column :users, :how_to_contact, :text
  end
end
