class AddUserIdtoBike < ActiveRecord::Migration
  def change
    change_table :bikes do |b|
      b.references :user 
      end 
  end
end
