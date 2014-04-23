# Aloha

Aloha is a gem to access the web services

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aloha'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install aloha

## Usage

The first, you create a variable eg. `client` without parameter like this :
```ruby
client = Aloha.soap_setting
```
or use parameter :
```ruby
client = Aloha.soap_setting(system_id: 'system ID', company_id: 'company ID', user_id: 'user ID', password: 'password', wsdl_url: 'https://memberlinkWS.alohaenterprise.com/insightws/MemberLinkWS?wsdl')
```

Then, you can access for :

Add member profile without parameter :
```ruby
Aloha.add_member_profile(client)
```
Add member profile with parameters :
```ruby
Aloha.add_member_profile(client, member_account_id: :integer, card_number: :string, first_name: :string, last_name: :string, company: :string, date_of_birth: {date: :string, locale: :string}, anniversary_date: {date: :string, locale: :string}, drivers_license: :string, address1: :string, address2: :string, city: :string, state_province: :string, country: :string, postal_code: :string, email_address: :string, phone_number: :string, other_phone_number: :string, profile_exists: :boolean)
```

Adjust credit without parameter
```ruby
Aloha.adjust_credit(client)
```
Adjust credit with parameters
```ruby
Aloha.adjust_credit(client, card_number: :string, bpid: :integer, adjustment_type: :string, bp_credit: :integer, reason: :string)
```

Get bonus plan history without parameter
```ruby
Aloha.get_bonus_plan_history(client)
```
Get bonus plan history without parameters
```ruby
Aloha.get_bonus_plan_history(client, card_number: :string,  number_of_assignments: :integer, number_of_days: :integer, start_date: :string,  end_date: :string)
```

* Check email exists without parameter
```ruby
Aloha.email_exists(client)
```
* Check email exists with parameter
```ruby
Aloha.email_exists(client, email_address: :string)
```

* Get card number by email without parameter
```ruby
Aloha.get_card_number_by_email(client)
```
* Get card number by email with parameter
```ruby
Aloha.get_card_number_by_email(client, email_address: :string)
```

* Get card number by phone without parameter
```ruby
Aloha.get_card_number_by_phone(client)
```
* Get card number by phone with parameter
```ruby
Aloha.get_card_number_by_phone(client, phone_number: :string)
```

* Get card status without parameter
```ruby
Aloha.get_card_status(client)
```
* Get card status with parameter
```ruby
Aloha.get_card_status(client, card_number: :string)
```

* Get member profile without parameter
```ruby
Aloha.get_member_profile(client)
```
* Get member profile with parameter
```ruby
Aloha.get_member_profile(client, card_number: :string)
```

* Check phone number exists without parameter
```ruby
Aloha.phone_number_exists(client)
```
* Check card number by phone with parameter
```ruby
Aloha.phone_number_exists(client, phone_number: :string)
```

* Update member profile without parameter
```ruby
Aloha.update_member_profile(client)
```
* Update member profile with parameter
```ruby
Aloha.update_member_profile(client, member_account_id: :integer, card_number: :string, first_name: :string, last_name: :string, company: :string, date_of_birth: {date: :string, locale: :string}, anniversary_date: {date: :string, locale: :string}, drivers_license: :string, address1: :string, address2: :string, city: :string, state_province: :string, country: :string, postal_code: :string, email_address: :string, phone_number: :string, other_phone_number: :string, profile_exists: :boolean)
```

* Assign forgotten card without parameter
```ruby
Aloha.assign_forgotten_card(client)
```
* Assign forgotten card with parameter
```ruby
Aloha.assign_forgotten_card(client, card_number: :string, claim_id: :string)
```

* Get check detail without parameter
```ruby
Aloha.get_check_detail(client)
```
* Get check detail with parameter
```ruby
Aloha.get_check_detail(client, claim_id: :string, store_id: :integer, date_of_business: :string)
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/aloha/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
