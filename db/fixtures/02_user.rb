require "digest"

users = [
  {
    login_id: "akagi",
    kanji_name: "赤城一郎",
    kana_name: "あかぎいちろう",
    hashed_password: Digest::MD5.hexdigest("1234"),
    email: "akagi@moneta.com",
    yubin: "100",
    jusho: "東京都目黒区目黒１−１−１",
  },
  {
    login_id: "aoki",
    kanji_name: "青木次郎",
    kana_name: "あおきじろう",
    hashed_password: Digest::MD5.hexdigest("5678"),
    email: "aoki@moneta.com",
    yubin: "200",
    jusho: "東京都目黒区目黒２−２−２",
  },
]

users.each_with_index do |user, id|
  User.seed do |s|
    s.id = id + 1
    s.bank_id = 1
    s.login_id = user[:login_id]
    s.kanji_name = user[:kanji_name]
    s.kana_name = user[:kana_name]
    s.hashed_password = user[:hashed_password]
    s.email = user[:email]
    s.yubin = user[:yubin]
    s.jusho = user[:jusho]
  end
end
