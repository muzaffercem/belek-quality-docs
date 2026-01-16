# Gereksinimler (Requirements)

Bu bölümde, Belek Üniversitesi Web Tabanlı Kalite ve Anket Yönetim Sistemi için
belirlenen fonksiyonel ve fonksiyonel olmayan gereksinimler açıklanmaktadır.

---

## 1. Fonksiyonel Gereksinimler

### 1.1 Kullanıcı Yönetimi
- Sistem, farklı kullanıcı türlerini (öğrenci, akademik personel, idari personel, mezun, dış paydaş, yönetici) desteklemelidir.
- Kullanıcılar sisteme kimlik doğrulama mekanizması ile giriş yapabilmelidir.
- Kullanıcıların yetkileri rol tabanlı olarak yönetilmelidir.

---

### 1.2 Anket Yönetimi
- Yetkili kullanıcılar (admin) yeni anket oluşturabilmelidir.
- Anketler taslak, aktif ve kapalı durumlarında yönetilebilmelidir.
- Anket başlangıç ve bitiş tarihleri tanımlanabilmelidir.
- Anketler anonim veya kimlikli olarak yapılandırılabilmelidir.

---

### 1.3 Soru Yönetimi
- Anketlere birden fazla soru eklenebilmelidir.
- Sistem farklı soru tiplerini desteklemelidir:
  - Likert ölçeği
  - Çoktan seçmeli
  - Sayısal
  - Açık uçlu metin
- Sorular için zorunlu/opsiyonel alan tanımlanabilmelidir.
- Sorular sıralı şekilde görüntülenmelidir.

---

### 1.4 Anket Cevaplama
- Kullanıcılar kendilerine tanımlanan anketleri görüntüleyebilmelidir.
- Kullanıcılar web ve mobil arayüz üzerinden anketlere cevap verebilmelidir.
- Sistem, anket cevaplarını güvenli şekilde saklamalıdır.
- Anket cevaplama süreci tamamlandığında kullanıcı bilgilendirilmelidir.

---

### 1.5 Raporlama ve Analiz
- Yönetici kullanıcılar anket sonuçlarını görüntüleyebilmelidir.
- Anket bazlı, soru bazlı ve genel özet raporlar sunulmalıdır.
- Sistem, raporları grafiksel olarak sunabilmelidir.
- Veritabanı görünümleri (view) kullanılarak raporlama performansı artırılmalıdır.

---

### 1.6 Yapay Zeka Destekli Analiz
- Açık uçlu sorular için metin analizi yapılabilmelidir.
- Anket cevaplarının duygu analizi (pozitif, negatif, nötr) yapılabilmelidir.
- Sistem, anket sonuçları için otomatik özet üretebilmelidir.
- Yapay zeka analiz sonuçları yönetici panelinde görüntülenebilmelidir.

---

## 2. Fonksiyonel Olmayan Gereksinimler

### 2.1 Performans
- Sistem, eş zamanlı çok sayıda kullanıcıyı destekleyebilmelidir.
- Sık sorgulanan alanlar için indeksleme yapılmalıdır.
- Raporlama işlemleri optimize edilmiş sorgular ile gerçekleştirilmelidir.

---

### 2.2 Güvenlik
- Sistem rol tabanlı erişim kontrolü (RBAC) sağlamalıdır.
- Kullanıcı verileri güvenli şekilde saklanmalıdır.
- Yönetici ve kullanıcı arayüzleri birbirinden ayrılmalıdır.
- Yetkisiz erişimler engellenmelidir.

---

### 2.3 Kullanılabilirlik
- Sistem kullanıcı dostu ve sade bir arayüz sunmalıdır.
- Web arayüzü farklı ekran boyutlarına uyumlu olmalıdır.
- Mobil uygulama kullanıcı deneyimi gözetilerek tasarlanmalıdır.

---

### 2.4 Ölçeklenebilirlik
- Sistem modüler ve çoklu repo mimarisine uygun tasarlanmalıdır.
- Gelecekte yeni istemcilerin (mobil, farklı web arayüzleri) eklenmesine uygun olmalıdır.
- Yapay zeka modülleri bağımsız geliştirilebilir yapıda olmalıdır.

---

### 2.5 Bakım ve Sürdürülebilirlik
- Kod yapısı okunabilir ve sürdürülebilir olmalıdır.
- Dokümantasyon güncel tutulmalıdır.
- Veritabanı yapısı genişletilebilir olmalıdır.

---

## 3. Varsayımlar ve Kısıtlar
- Sistem üniversite bilgi sistemlerinden bağımsız çalışacaktır.
- Kimlik doğrulama üniversite dışı sistemlerle entegre edilmeyebilir.
- Mobil uygulama geliştirilmesi opsiyonel kapsamda değerlendirilmektedir.

---

## 4. Sonuç
Bu gereksinimler, sistemin fonksiyonel, güvenli ve sürdürülebilir bir şekilde
geliştirilmesini sağlamak amacıyla belirlenmiştir. Belirlenen gereksinimler,
proje geliştirme sürecinde referans alınacaktır.

