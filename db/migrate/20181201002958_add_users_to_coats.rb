class AddUsersToCoats < ActiveRecord::Migration[5.2]
  def change
    add_reference :coats, :user, foreign_key: true
  end
end
