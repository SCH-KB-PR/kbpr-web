class AddReleaseModel < ActiveRecord::Migration[7.0]
  def change
    create_table :releases do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :published, default: false

      t.timestamps
    end

    create_table :puzzles do |t|
      t.string :name
      t.string :description
      t.bigint :release_id

      t.timestamps
    end

    create_table :puzzle_solutions do |t|
      t.string :name
      t.string :description
      t.bigint :puzzle_id

      t.timestamps
    end

    create_table :kwc_archive do |t|
      t.string :name
      t.bigint :release_id

      t.timestamps
    end
  end
end
