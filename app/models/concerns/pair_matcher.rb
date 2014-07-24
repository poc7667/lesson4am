require 'active_support/concern'
module PairMatcher
  include ActiveSupport::Concern

  def get_prev_record(group)
    pr = PairRecord.where(pair_group_id: group.id).last
    if pr
      return pr.pair_result
    else
      return nil
    end
  end

end

class Pair
  attr_accessor :male, :female
  def initialize(male, female)
    self.male = male
    self.female = female
  end

  def content
    [male, female]
  end

  def to_s
    male+female
  end
end

class Drawer 
  include PairMatcher
  attr_accessor :members, :male_lst,  :female_lst, :members, :prev_pair_record
  attr_accessor :pair_groups, :numbers_setting
  def initialize(group, pair_setting ,numbers_setting)
    self.numbers_setting = numbers_setting
    self.members = eval(group.members)
    self.male_lst =  self.members[:male].shuffle.dup
    self.female_lst = self.members[:female].shuffle.dup    
    self.members = self.male_lst + self.female_lst
    self.prev_pair_record = get_prev_record(group)
    self.pair_groups = [] # record current match
    if "numbers_of_groups" == pair_setting
      (0..numbers_setting-1).each do |i| # init pair_groups
        pair_groups << {male:[], female:[]} 
      end
      do_groups_match(numbers_setting)
      # save_answer
    elsif "numbers_in_groups" == pair_setting
      numbers_in_groups_match(numbers_setting)
    end

    pair_setting = {
      action: pair_setting,
      numbers_setting: numbers_setting
    }
    PairRecord.create(
      user_id: group.user_id,
      pair_group_id: group.id,
      pair_setting: pair_setting.to_s,
      pair_result: pair_groups.to_s
    )
  end

  def numbers_in_groups_match(numbers_setting)
    members = (male_lst.zip(female_lst)).collect do |m, f| 
      [[m,:male],[f, :female]] 
    end.flatten(1)
    members.reject!{ | m | m.first == nil}
    members.each_slice(numbers_setting).each do |group|
      pair_groups << {male:[], female:[]} 
      group.each do |member|
        pair_groups.last[member.last] << member.first
      end
    end
  end

  def show_anwser
    pair_groups.each do |group|
      print (group)
      ap "\t#{group[:male].count}, #{group[:female].count}, #{group[:female].count+group[:male].count}"
    end
  end

  def do_groups_match(numbers_setting)
    begin
      dispatch_couples   
      show_anwser
      dispatch_remains
    rescue Exception => e
      binding.pry
    end
  end


  def dispatch_couples
    num_of_couples = [male_lst.count, female_lst.count].min
    couples_per_group = num_of_couples / numbers_setting
    pair_groups.each do |group|
      (0..couples_per_group-1).each do
        group[:male] << male_lst.pop
        group[:female] << female_lst.pop
      end
    end
  end

  def dispatch_remains
    group_numbers = (0..numbers_setting-1).to_a.shuffle
    begin
      group_numbers*=2
    end while group_numbers.count < (male_lst.count + female_lst.count)
    (male_lst.zip(female_lst)).each do |m, f|
      pair_groups[group_numbers.pop][:male] << m if m
      pair_groups[group_numbers.pop][:female] << f if f
    end
  end

end

