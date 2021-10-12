module TermsHelper
  
  def term_show_shift_ture_false
    @term = Term.find_by(nurse_id: params[:id])
    term_show_shift_ture_false_array = []
      #三項演算子　条件式 ? 「真(true)」となった場合に実行したい処理 : 「偽(false)」となった場合に実行したい処理
      @term.present? && @term.day_shift == true ? term_show_shift_ture_false_array << "可" : term_show_shift_ture_false_array << "否"
      @term.present? && @term.night_shift == true ? term_show_shift_ture_false_array << "可" : term_show_shift_ture_false_array << "否"
      @term.present? && @term.after_night_shift == true ? term_show_shift_ture_false_array << "可" : term_show_shift_ture_false_array << "否"
      return term_show_shift_ture_false_array
  end
  
end
