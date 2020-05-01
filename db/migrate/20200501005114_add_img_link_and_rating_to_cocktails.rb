class AddImgLinkAndRatingToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :img_link, :string
    add_column :cocktails, :rating, :integer, null: false,  default: 0
  end
end
