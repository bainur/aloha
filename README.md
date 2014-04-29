# Aloha

Aloha is a gem to access the web services

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aloha', git: 'git://github.com/bainur/aloha.git'
```

And then execute:
```ruby
$ bundle install
```

## Usage

The first, you create a variable eg. `client` like this :
```ruby
client = Aloha::Soap.new(system_id: 'system ID', company_id: 'company ID', user_id: 'user ID', account_password: 'password', system_password: 'password', wsdl_url: 'https://memberlinkWS.alohaenterprise.com/insightws/MemberLinkWS?wsdl')
```

Then, you can access for :

* Add member profile without parameter :
```ruby
client.add_member_profile
```
* Add member profile with parameters :
```ruby
client.add_member_profile(member_account_id: :integer, card_number: :string, first_name: :string, last_name: :string, company: :string, date_of_birth: {date: :string, locale: :string}, anniversary_date: {date: :string, locale: :string}, drivers_license: :string, address1: :string, address2: :string, city: :string, state_province: :string, country: :string, postal_code: :string, email_address: :string, phone_number: :string, other_phone_number: :string, profile_exists: :boolean, company_defined1: :string, company_defined2: :string, company_defined2: :string)
```

* Adjust credit without parameter
```ruby
client.adjust_credit
```
* Adjust credit with parameters
```ruby
client.adjust_credit(card_number: :string, bpid: :integer, adjustment_type: :string, bp_credit: :integer, reason: :string)
```

* Get bonus plan history without parameter
```ruby
client.get_bonus_plan_history
```
* Get bonus plan history without parameters
```ruby
client.get_bonus_plan_history(card_number: :string,  number_of_assignments: :integer, number_of_days: :integer, start_date: :string,  end_date: :string)
```

* Check email exists without parameter
```ruby
client.email_exists
```
* Check email exists with parameter
```ruby
client.email_exists(email_address: :string)
```

* Get card number by email without parameter
```ruby
client.get_card_number_by_email
```
* Get card number by email with parameter
```ruby
client.get_card_number_by_email(account_status: :string, email_address: :string)
```

* Get card number by phone without parameter
```ruby
client.get_card_number_by_phone
```
* Get card number by phone with parameter
```ruby
client.get_card_number_by_phone(account_status: :string, phone_number: :string)
```

* Get card status without parameter
```ruby
client.get_card_status
```
* Get card status with parameter
```ruby
client.get_card_status(card_number: :string)
```

* Get member profile without parameter
```ruby
client.get_member_profile
```
* Get member profile with parameter
```ruby
client.get_member_profile(card_number: :string)
```

* Check phone number exists without parameter
```ruby
client.phone_number_exists
```
* Check card number by phone with parameter
```ruby
client.phone_number_exists(phone_number: :string)
```

* Update member profile without parameter
```ruby
client.update_member_profile
```
* Update member profile with parameter
```ruby
client.update_member_profile(member_account_id: :integer, card_number: :string, first_name: :string, last_name: :string, company: :string, date_of_birth: {date: :string, locale: :string}, anniversary_date: {date: :string, locale: :string}, drivers_license: :string, address1: :string, address2: :string, city: :string, state_province: :string, country: :string, postal_code: :string, email_address: :string, phone_number: :string, other_phone_number: :string, profile_exists: :boolean, company_defined1: :string, company_defined2: :string, company_defined2: :string)
```

* Assign forgotten card without parameter
```ruby
client.assign_forgotten_card
```
* Assign forgotten card with parameter
```ruby
client.assign_forgotten_card(card_number: :string, claim_id: :string)
```

* Get check detail without parameter
```ruby
client.get_check_detail
```
* Get check detail with parameter
```ruby
client.get_check_detail(claim_id: :string, store_id: :integer, date_of_business: :string)
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/aloha/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
