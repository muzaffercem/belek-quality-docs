# Sistem Genel Bakış (System Overview)

## Proje Adı
Belek Üniversitesi Web Tabanlı Kalite ve Anket Yönetim Sistemi

## Amaç
Bu sistem, Belek Üniversitesi bünyesinde yürütülen kalite güvence
süreçlerini desteklemek amacıyla geliştirilmiştir. Sistem; öğrenci,
akademik personel, idari personel, mezunlar ve dış paydaşlardan alınan
geri bildirimlerin dijital ortamda toplanmasını, analiz edilmesini ve
raporlanmasını hedeflemektedir.

Ayrıca sistem, açık uçlu anket cevaplarının yapay zeka destekli analizini
yaparak yöneticilere özet ve içgörü sunmayı amaçlamaktadır.

---

## Sistem Kapsamı

Sistem aşağıdaki temel işlevleri kapsamaktadır:

- Kullanıcı ve rol yönetimi
- Anket oluşturma, yayınlama ve yönetme
- Soru ve seçenek yönetimi
- Anket cevaplarının toplanması
- Raporlama ve analiz işlemleri
- Yapay zeka destekli duygu analizi ve özetleme
- Web, mobil ve yönetici paneli üzerinden erişim

---

## Kullanıcı Türleri

Sistem, farklı yetkilere sahip kullanıcı türlerini desteklemektedir:

- **Öğrenciler** – Anketlere katılım sağlar
- **Akademik Personel** – Anketlere katılım sağlar
- **İdari Personel** – Anketlere katılım sağlar
- **Mezunlar / Dış Paydaşlar** – Yetki verilmesi durumunda anketlere katılım sağlar
- **Yöneticiler (Admin)** – Anket, kullanıcı ve rapor yönetimini gerçekleştirir

---

## Yüksek Seviyeli Mimari

Sistem, çok katmanlı bir mimari yaklaşımı ile tasarlanmıştır:

- **İstemci Katmanı**
  - Web Uygulaması
  - Mobil Uygulama
  - Yönetici Paneli

- **Sunucu Katmanı**
  - RESTful API
  - Kimlik doğrulama ve yetkilendirme
  - İş mantığı katmanı
  - Yapay zeka analiz servisleri

- **Veri Katmanı**
  - PostgreSQL ilişkisel veritabanı
  - Normalize edilmiş tablo yapısı
  - Performans için indeksler
  - Raporlama için oluşturulmuş görünümler (View)

Katmanlar birbirinden bağımsız olacak şekilde tasarlanmış olup, sistemin
ölçeklenebilirliği ve sürdürülebilirliği hedeflenmiştir.

---

## Veri Yönetimi Yaklaşımı

- İlişkisel veritabanı modeli kullanılmıştır
- Tablolar arasında bütünlük foreign key kısıtları i

