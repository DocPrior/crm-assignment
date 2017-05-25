class Contact
  @@contacts = []
  @@id = 1

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |id|
      if id == contact.id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(att)
    if att == "first_name"
      gets new_first_name.chomp
      @first_name = new_first_name
    elsif att == "last_name"
      gets new_last_name.chomp
      @last_name = new_last_name
    elsif att == "email"
      gets new_email.chomp
      @email = new_email
    else att == "note"
      gets new_note.chomp
      @note = new_note
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(att, search)
    if att == "first_name"
      @@contacts.each do |search|
        if search == contact.first_name
          return contact
        end
      end
    elsif att == "last_name"
      @@contacts.each do |search|
        if search == contact.last_name
          return contact
        end
      end
    elsif att == "email"
      @@contacts.each do |search|
        if search == contact.email
          return contact
        end
      end
    else att == "note"
      @@contacts.each do |search|
        if search == contact.note
          return contact
        end
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    puts "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end

contact1 = Contact.create("Betty", "Makes", "bettymakes@gmail.com", "Loves Pokemon")

contact2 = Contact.create("Joe", "Maker", "joemake@gmail.com", "loves cats")

puts Contact.all

puts Contact.find_by("first_name", "Joe")
