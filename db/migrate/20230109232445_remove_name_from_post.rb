# frozen_string_literal: true

class RemoveNameFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :name, :string
  end
end
