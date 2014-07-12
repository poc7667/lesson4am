# encoding: utf-8
desc "Import ma reasons"
# http://robots.thoughtbot.com/post/18070048430/anonymizing-customer-company-and-location-data-using
namespace :ma_reason_slot_machine do
    task :import => :environment do
      subjects=[
      "馬總統表示",
      "馬區長認為",
      "馬小九解釋",
      "馬統指出",
      "騜上宣稱",
      "領導人馬先生說",
      "馬主席強調",
      ]

      actions=[
      "馬上漸漸",
      "如造成民眾不快",
      "如黨籍議員買票",
      "如過程不合規定",
      "如活動舉辦虧錢",
      "如北市政績出包",
      "如承諾沒有做到",
      "如提到選舉支票",
      "如提到救中職",
      "疑似",
      "633",
      ]

      reasons=[
      "感到相當痛心",
      "願找時間道歉",
      "會請下屬檢討",
      "以後將試著改進",
      "將看出經濟復甦",
      "其實前朝就這樣",
      "願秀小腹肌道歉",
      "是前政府少撥錢",
      "自己深感不安",
      "還是要依法行政",
      "一切還是照規定",
      "其實是口誤",
      "是協調上的問題",
      "是一時疏失",
      "無損個人魅力",
      "是塑造清廉形象",
      "一定有利有弊",
      ]


      [:subjects, :actions, :reasons].each do |act_type|
        eval(act_type.to_s).each do |item|
          reason = MaReasonSlot.create(
            position: act_type.to_s,
            description: item
          )
          
        end
      end
    end
  end
#encoding: utf-8

