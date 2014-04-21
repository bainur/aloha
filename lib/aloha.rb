require 'aloha/version'
require 'rubygems'
require 'savon'
require 'httpclient'

module Aloha

  system_id = 'rr39261'
  company_id = 'RDS11'
  user_id = 'Web.Service'
  pwd = 'LoyaltyAPI1'
  password='!069158823A'
  default_request = {'company_id' => company_id, 'userID' => user_id, 'password' => pwd}
  wsdl_url = 'https://memberlinkWS.alohaenterprise.com/insightws/MemberLinkWS?wsdl'

  @client = Savon.client do
    wsdl wsdl_url
    wsse_timestamp true
    wsse_auth system_id, password
    log true
    log_level :debug
    pretty_print_xml true
  end

  ### addMemberProfile
  def self.add_member_profile
    @client.call(:add_member_profile) do
      message(add_member_profile_request: {
        profile: {
          member_account_id: 1,
          card_number: '4242424242424242',
          first_name: 'Bainur',
          last_name: 'Budi',
          company: 'company',
          date_of_birth: {
              date: '04/17/2014',
              locale: 'en_US'
          },
          anniversaryDate: {
              date: '04/17/2014',
              locale: 'en_US'
          },
          drivers_license: '1234567890',
          address1: 'Cimahi',
          address2: 'Karawang',
          city: 'Cimahi',
          state_province: 'West Java',
          country: 'Indonesia',
          postal_code: '40000',
          email_address: 'bainur@yahoo.com',
          phone_number: '0891000000',
          other_phone_number: '022900000'
        }
      })
    end
  end

  ### adjustCredit()
  def self.adjust_credit
    @client.call(:adjust_credit) do
      message(:adjust_credit_request => {
        'cardNumber' => '4242424242424242',
        'BPID' => 1,
        'adjustmentType' => 1234500000001,
        'BPCredit' => 1,
        'reason' => 'test reason'
      })
    end
  end

  ### getBonusPlanHistory()
  def self.get_bonus_plan_history
    @client.call(:get_bonus_plan_history) do
      message('GetBonusPlanHistoryRequest' => {
        card_number: '4242424242424242',
        number_of_assignments: 1,
        number_of_days: 1,
        start_date: '01/01/2014',
        end_date: '12/31/2014'
      })
    end
  end

  ### getBonusPlanStandings()
  def self.get_bonus_plan_standings
    @client.call(:get_bonus_plan_standings) do
      message(get_bonus_plan_standings_request: {
        card_number: '42424242424242',
        available_items_return: true,
        purchased_items_return: true
      })
    end
  end

  ### eMailExists()
  def self.email_exists
    @client.call(:e_mail_exists) do
      message(e_mail_exists_request: {e_mail_address: 'bainur@yahoo.com'})
    end
  end

  ### getCardNumberByEmail()
  def self.get_card_number_by_email
    @client.call(:get_card_number_by_email) do
      message('GetCardNumberByEmailRequest' => {email_address: 'bainur@yahoo.com'})
    end
  end

  ### getCardNumberByPhone()
  def self.get_card_number_by_phone
    @client.call(:get_card_number_by_phone) do
      message('GetCardNumberByPhoneRequest' => {phone_number: "022900000"})
    end
  end

  ### getCardStatus()  
  def self.get_card_status
    @client.call(:get_card_status) do
      message(get_card_status_request: {card_number: '42424242424242'})
    end
  end

  ### getMemberProfile()  
  def self.get_member_profile
    @client.call(:get_member_profile) do
      message(get_member_profile_request: {card_number: '42424242424242'})
    end
  end

  ### phoneNumberExists() 
  def self.phone_number_exists
    @client.call(:phone_number_exists) do
      message('PhoneNumberExistsRequest' => {phone_number: '0229000000'})
    end
  end

  ### updateMemberProfile()
  def self.update_member_profile
    @client.call(:update_member_profile) do
      message(update_member_profile_request: {
        profile: {
          member_account_id: 1,
          card_number: '4242424242424242',
          first_name: 'Bainur',
          last_name: 'Budi',
          company: 'company',
          date_of_birth: {
            date: '04/17/2014',
            locale: 'en_US'
          },
          anniversaryDate: {
            date: '04/17/2014',
            locale: 'en_US'
          },
          drivers_license: '1234567890',
          address1: 'Cimahi',
          address2: 'Karawang',
          city: 'Cimahi',
          state_province: 'West Java',
          country: 'Indonesia',
          postal_code: '40000',
          email_address: 'bainur@yahoo.com',
          phone_number: '0891000000',
          other_phone_number: '022900000'
        }
      })
    end
  end

  ### assignForgottenCard()
  def self.assign_forgotten_card
    @client.call(:assign_forgotten_card) do
      message(assign_forgotten_card_request: {
          card_number: '4242424242424242',
          claim_ID: '12345678910'
      })
    end
  end

  ### getCheckDetail()
  def self.get_check_detail
    @client.call(:get_check_detail) do
      message('GetCheckDetailRequest' => {
          claim_ID: 'testexample123123',
          store_ID: 1122334455,
          date_of_business: '04/17/2014'
      })
    end
  end
end
