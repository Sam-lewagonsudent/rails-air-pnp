class AddReferenceToPools < ActiveRecord::Migration[7.0]
  def change
    add_reference :pools, :user, foreign_key: true
  end
end
