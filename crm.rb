require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'Enter contact (first_name) '
    value = gets.chomp

    contact_change = Contact.find_by("first_name", value)

    print 'Enter attribute to change: '
    att = gets.chomp

    print 'Enter new info: '
    new_value = gets.chomp

    contact_change.update(att, new_value)

  end

  def delete_contact
    print 'Enter id of contact to delete: '
    id = gets.chomp
    contact = Cantact.find(id)
    contact.delete
  end

  def display_all_contacts
    Contact.all.each do |contact|
     p "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note}"
   end
  end

  def search_by_attribute
    print 'Enter attribute to search by: '
    att = gets.chomp

    print 'Enter value to search for: '
    search = gets.chomp

    Contact.search_by_attribute(att, search)
  end
end

app01 = CRM.new(app01)
app01.main_menu
