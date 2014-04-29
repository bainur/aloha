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

* Add member profile
```ruby
client.add_member_profile(member_account_id: :integer, card_number: :string, first_name: :string, last_name: :string, company: :string, date_of_birth: {date: :string, locale: :string}, anniversary_date: {date: :string, locale: :string}, drivers_license: :string, address1: :string, address2: :string, city: :string, state_province: :string, country: :string, postal_code: :string, email_address: :string, phone_number: :string, other_phone_number: :string, profile_exists: :boolean, company_defined1: :string, company_defined2: :string, company_defined2: :string)
```

* Adjust credit
```ruby
client.adjust_credit(card_number: :string, bpid: :integer, adjustment_type: :string, bp_credit: :integer, reason: :string)
```

* Get bonus plan history
```ruby
client.get_bonus_plan_history(card_number: :string,  number_of_assignments: :integer, number_of_days: :integer, start_date: :string,  end_date: :string)
```

* Check email exists
```ruby
client.email_exists(email_address: :string)
```

* Get card number by email
```ruby
client.get_card_number_by_email(account_status: :string, email_address: :string)
```

* Get card number by phone
```ruby
client.get_card_number_by_phone(account_status: :string, phone_number: :string)
```

* Get card status
```ruby
client.get_card_status(card_number: :string)
```

* Get member profile
```ruby
client.get_member_profile(card_number: :string)
```

* Check card number by phone
```ruby
client.phone_number_exists(phone_number: :string)
```

* Update member profile
```ruby
client.update_member_profile(member_account_id: :integer, card_number: :string, first_name: :string, last_name: :string, company: :string, date_of_birth: {date: :string, locale: :string}, anniversary_date: {date: :string, locale: :string}, drivers_license: :string, address1: :string, address2: :string, city: :string, state_province: :string, country: :string, postal_code: :string, email_address: :string, phone_number: :string, other_phone_number: :string, profile_exists: :boolean, company_defined1: :string, company_defined2: :string, company_defined2: :string)
```

* Assign forgotten card
```ruby
client.assign_forgotten_card(card_number: :string, claim_id: :string)
```

* Get check detail
```ruby
client.get_check_detail(claim_id: :string, store_id: :integer, date_of_business: :string)
```

* Create virtual card
```ruby
client.create_virtual_card(card_series: :string)
```

* New virtual card
```ruby
client.new_virtual_card(card_series: :string)
```

* Opt out
```ruby
client.opt_out(card_number: :string)
```


* Phone number exists
```ruby
client.phone_number_exists(phone_number: :string)
```


* Activate new card
```ruby
client.activate_new_card(batch_id: :integer)
```


* Create new card
```ruby
client.create_new_card(activate_card: :boolean, batch_desc: :string, batch_id: :integer, card_series: :string, number_of_cards: :integer, numeric_sequence_type: :integer, starting_card_number: :integer)
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/aloha/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
