FactoryGirl.define do
  factory :user do
    username "Testi"
    password "Test1"
    password_confirmation "Test1"
  end

  factory :artist do
	name "Boyd"
	info "Yeah"
  end

  factory :band do
	name "NON"
	info "Apocalypse"
	formed 1984
  end

  factory :record do
	name "rec"
	info "yeah"
	year 1990
  end

end
