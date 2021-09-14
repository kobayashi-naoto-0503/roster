module NurseWorkSchedulesHelper
  
  def nurse_select(nurse)
    Term.find_by(nurse_id: nurse.id)
  end
  
  
  def select_condition(nurse)
    term = Term.find_by(nurse_id: nurse.id)
    hash = {}
    #array << ["day_shift",{:day=>t, :value=>0}] if term.day_shift  day=tで日付を持たせるかどうか
    hash["日"] = 0 if term.day_shift
    hash["夜"] = 1 if term.night_shift
    hash["明"] = 2 if term.after_night_shift
    hash["公"] = 3
    hash["有"] = 4
    hash["リ"] = 5
    return hash
  end  
  
end

