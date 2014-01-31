class AddPartnerNoteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :partner_note, :text
  end
end
