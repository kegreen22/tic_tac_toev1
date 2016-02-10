class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end

end

class LinkedList
  def initialize(value)  # creates a default linked list with a default header
    @head = Node.new(value, nil)
  end

  def add(data)  # go to tail and insert new node
    current = @head
    while current.next_node != nil #keep searching until the end to add the link
      current = current.next_node
    end
    current.next_node = Node.new(data, nil)
  end

  def delet(data)  # search for data to be deleted & reset the header and tail as needed
    current = @head
    if current.data == data
      @head = current.next_node  # if the head is the link to delete then reset the head to the next link (skip the former head)
    else
      while (current != nil) && (current.next_node != nil) && ((current.next_node).data != data)
        current = current.next_node
      end
      if (current != nil) && (current.next_node != nil)
        current.next_node = (current.next_node).next_node   # skip the link that is to be deleted by setting the prior node to skip it
      end
    end
  end

  def show


  end


