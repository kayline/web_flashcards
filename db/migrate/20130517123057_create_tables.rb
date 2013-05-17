class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :password_hash, :null => false
      
      t.timestamps
    end

    create_table :decks do |t|
      t.string :name, :null => false
      t.string :topic 

      t.timestamps
    end
    
    create_table :cards do |t|
      t.string :question, :answer, :null => false
      t.references :deck
      t.timestamps
    end

    create_table :rounds do |t|
      t.integer :correct, :incorrect, :unanswered

      t.references :deck, :user
      t.timestamps
    end


  end
end
