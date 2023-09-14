FactoryBot.define do
  factory :journal_entry do
    title { 'Sample Entry1' }
    date { Date.today }
    content { 'This is a test entry.' }
  end
end 
