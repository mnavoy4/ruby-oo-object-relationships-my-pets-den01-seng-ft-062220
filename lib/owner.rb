require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize name
    @species = "human"
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat name
    new_cat = Cat.new(name, self)
  end

  def buy_dog name
    new_dog = Dog.new name, self
  end

  def walk_dogs
    Dog.all.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end






end