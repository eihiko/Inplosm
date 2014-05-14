class AddNotFoundRegexToComics < ActiveRecord::Migration
  change_table :comics do |t|
    t.string :not_found_regex
  end
end
