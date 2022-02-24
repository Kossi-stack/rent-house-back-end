FactoryBot.define do
  factory :reservation do
    start_time { '2022-02-04' }
    end_time { '2022-02-05' }
    user_id { '1' }
    house_id { '1' }
  end
end
