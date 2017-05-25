class CRM

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
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

  def modify_existing_contact(id)
    print 'Enter contact id: '
    id = gets.to_i
    contact = Contact.find(id)

    print 'Enter attribute to change: '
    att = gets.chomp

    print 'Enter new info: '
    value = gets.chomp

    contact.update(att, value)

  end

  def delete_contact
    print 'Enter id of contact to delete: '
    id = gets.chomp
    contact = Cantact.find(id)
    contact.delete
  end

  def display_all_contacts
    puts Contact.all
  end

  def search_by_attribute
    print 'Enter attribute to search by: '
    att = gets.chomp

    print 'Enter value to search for: '
    search = gets.chomp

    Contact.search_by_attribute(att, search)
  end


end
