class Order < ApplicationRecord
  belongs_to :user
  belongs_to :group

  enum :paper_size, { a2: 'a2', a3: 'a3', a4: 'a4', a5: 'a5', a6: 'a6' }
end