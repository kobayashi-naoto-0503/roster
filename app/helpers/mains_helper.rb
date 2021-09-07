module MainsHelper
  
  def select_condition(term)
    array = []
    array << ["day_shift",{:day=>t, :value=>0}] if term.day_shift
    array << ["night_shift",1] if term.night_shift
    array << ["after_night_shift",2] if term.after_night_shift
    return array
  end  
end
