require_relative '../config/environment'

class RecipeDatabase

    def initialize(id=nil)
      @id = id
      @item = item
      @rating = rating
      @timeddifficulty = timeddifficulty
      @hyperlink = hyperlink
      @summary = summary
    end
    
    def self.create_user
      sql = <<-SQL
      CREATE TABLE IF NOT EXISTS recipes (
        id INTEGER PRIMARY KEY,
        item TEXT,
        rating TEXT,
        timedifficulty TEXT,
        hyperlink TEXT, 
        summary TEXT,
      )
      SQL
      DB[:conn].execute(sql)
    end
  
    def self.get_page
      Nokogiri::HTML(open("https://www.bbcgoodfood.com/recipes/collection/all-time-top-20-recipes"))
    end
  
    def self.get_items
      self.get_page.css(".d-inline").map{|n| n.text}
    end
  
    def self.get_ratings
      self.get_page.css(".rating").map{|n| n.text}
    end
  
    def self.get_time_and_difficulty
      self.get_page.css(".d-flex").map{|n| n.text}
    end
  
    def self.get_hyperlink
      extension = self.get_page.css("div.card__section a[href]")
      extension.map{|element| "https://www.bbcgoodfood.com" + element["href"]}.compact.uniq
    end
  
    def self.get_courses
      self.get_page.css(".list-item").map{|n| n.text}
    end
  
    def self.get_summary
      self.get_page.css("p.d-block").map{|n| n.text}
    end
  
    def self.drop_user
      sql = "DROP TABLE IF EXISTS recipes"
      DB[:conn].execute(sql)
    end
  
    def self.create(name:, grade:)
      student = Student.new(name, grade)
      student.save
      student
    end
  
    def self.add_to_database
      sql = <<-SQL
      INSERT INTO #{current_user} (item, rating, timedifficulty, hyperlink, summary)
      VALUES (#{self.get_item[self.id]}, #{self.get_rating[self.id]}, #{self.timeddifficulty[self.id]}, #{self.get_hyperlink[self.id]}, #{self.get_summary[self.id]})
      SQL
  
      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{current_user}")[0][0]
    end
  
    def self.remove_from_database
      sql = <<-SQL
      DELETE FROM #{current_user} (name, grade)
      WHERE name = ?
      SQL
  
      DB[:conn].execute(sql, self.name, self.grade)
    end
  
    def view_database
      sql = <<-SQL
      SELECT * FROM #{current_user} 
      SQL
      DB[:conn].execute(sql)
    end
  
    def self.make_courses
      self.get_courses.each do |post|
        course = Course.new
        course.title = self.get_items
      end
    end
  
    def self.print_courses
      self.make_courses
      Course.all.each do |course|
        if course.title && course.title != ""
          puts "Title: #{course.title}"
          puts "  Schedule: #{course.schedule}"
          puts "  Description: #{course.description}"
        end
      end
    end
  
  end