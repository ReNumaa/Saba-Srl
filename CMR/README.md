# CMR - International Consignment Note System

## 📋 Descrizione

Sistema web per la compilazione e gestione di documenti CMR (Convention relative au contrat de transport International de marchandises par route) - Lettera di Vettura Internazionale. Il sistema permette di creare, compilare e stampare documenti CMR conformi agli standard internazionali per il trasporto di merci su strada.

## ✨ Caratteristiche Principali

### 🚚 Gestione CMR
- **Modulo CMR Completo**: Tutti i 24 campi standard del documento CMR
- **Validazione Automatica**: Controllo campi obbligatori prima della stampa
- **Layout Conforme**: Design fedele al formato standard CMR
- **Stampa Ottimizzata**: Layout specifico per stampa su formato A4

### 👥 Gestione Clienti
- **Database Clienti Locale**: Memorizzazione dati clienti in localStorage
- **Ricerca Intelligente**: Sistema di ricerca dinamica con dropdown
- **CRUD Completo**: Creazione, modifica ed eliminazione clienti
- **Auto-completamento**: Compilazione automatica campi da template cliente

### 💾 Import/Export
- **Backup Template**: Esportazione dati clienti in formato JSON
- **Ripristino Dati**: Importazione template da file JSON
- **Persistenza Locale**: Salvataggio automatico in localStorage

## 🏗️ Struttura del Progetto

```
CMR.html
├── HTML Structure
│   ├── Header CMR (Sezioni 1-16)
│   ├── Goods Table (Sezioni 6-12)
│   ├── Payment Details (Sezione 20)
│   └── Signatures (Sezioni 22-24)
├── CSS Styling
│   ├── Print-specific styles
│   ├── Modal components
│   └── Responsive design
└── JavaScript Features
    ├── Client management
    ├── Form validation
    └── Data persistence
```

## 📖 Sezioni del Documento CMR

### Informazioni Principali
1. **Mittente** (Sezione 1): SABA SRL - Precompilato
2. **Destinatario** (Sezione 2): Nome, indirizzo, paese
3. **Luogo Presa in Consegna** (Sezione 3): Località di ritiro
4. **Luogo Destinazione** (Sezione 4): Località + data consegna
5. **Documenti Allegati** (Sezione 5): Documentazione aggiuntiva

### Dettagli Merci (Sezioni 6-12)
- Contrassegni e numeri
- Numero colli
- Tipo imballaggio
- Descrizione merci
- Numero statistico
- Peso lordo (Kg)
- Volume (m³)

### Informazioni Trasporto
- **Trasportatore** (Sezione 16): Dati vettore principale
- **Trasportatori Successivi** (Sezione 17): Vettori aggiuntivi
- **Riserve Trasportatore** (Sezione 18): Note e osservazioni

### Aspetti Commerciali
- **Convenzioni Particolari** (Sezione 19): Accordi speciali
- **Dettagli Pagamento** (Sezione 20): Tariffe e costi
- **Rimborso** (Sezione 15): Contrassegno
- **Tipo Pagamento** (Sezione 14): Franco/Non franco

### Firme e Validazione
- **Firma Mittente** (Sezione 22)
- **Firma Trasportatore** (Sezione 23)
- **Ricevuta Merce** (Sezione 24)

## 🚀 Come Utilizzare

### Primo Avvio
1. Aprire il file `CMR.html` in un browser web
2. Il sistema caricherà automaticamente i template di default
3. Cliente predefinito: "INO BREZICE D.O.O." già configurato

### Gestione Clienti
1. **Aprire Gestione Clienti**: Cliccare il pulsante 👥 in basso a destra
2. **Cercare Cliente**: Digitare nel campo di ricerca per filtrare
3. **Selezionare Cliente**: Cliccare sul nome dal dropdown
4. **Caricare Dati**: Cliccare "Carica Dati Cliente"

### Aggiungere Nuovo Cliente
1. Nel pannello clienti cliccare "Nuovo Cliente"
2. Compilare i campi obbligatori:
   - Nome Cliente (per il menu)
   - Destinatario: Nome, Indirizzo, Località
   - Luogo di Consegna
3. Cliccare "Salva"

### Compilazione CMR
1. **Caricare Template Cliente**: Utilizzare la gestione clienti
2. **Completare Campi Mancanti**:
   - Data e ora (Sezione 4, 21)
   - Documenti allegati (Sezione 5)
   - Dettagli merci (Sezioni 6-12)
   - Trasportatore se necessario (Sezione 16)
3. **Validare**: Il sistema controllerà i campi obbligatori
4. **Stampare**: Cliccare 🖨️ "Stampa CMR"

### Backup e Ripristino
- **Esportare**: Cliccare "💾 Salva Template" nel pannello clienti
- **Importare**: Cliccare "📂 Carica Template" e selezionare file JSON

## ⚙️ Campi Obbligatori per la Stampa

Il sistema valida automaticamente:
- Sezione 2: Nome, indirizzo, località destinatario
- Sezione 3: Luogo presa in consegna
- Sezione 4: Luogo destinazione + data
- Sezione 5: Documenti allegati
- Sezione 21: Località, data e ora di compilazione

## 🎨 Caratteristiche Tecniche

### Frontend
- **HTML5**: Struttura semantica del documento
- **CSS3**: Layout grid responsive + print styles
- **Vanilla JavaScript**: Gestione interattività senza dipendenze

### Persistenza Dati
- **localStorage**: Memorizzazione template clienti nel browser
- **JSON**: Formato standard per import/export
- **Validazione**: Controllo integrità dati all'importazione

### Stampa
- **Media Queries**: CSS ottimizzato per stampa
- **Formato A4**: Layout specifico per stampanti
- **Rimozione UI**: Nasconde controlli durante stampa

## 📱 Compatibilità

- ✅ Chrome/Chromium
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ✅ Dispositivi mobili (visualizzazione)

## 🔧 Personalizzazione

### Modificare Dati Mittente
I dati SABA SRL sono hardcoded nelle righe 479-481:
```html
<input type="text" value="SABA SRL" placeholder="Nome">
<input type="text" value="LOCALITA' FORNACE 9 - FRAZ. NOZZA" placeholder="Indirizzo">
<input type="text" value="25078 VESTONE - BRESCIA ITALIA" placeholder="Località, Paese">
```

### Aggiungere Template Default
Modificare l'oggetto `clienti` nella funzione `getTemplates()` (righe 984-1000).

## 🐛 Risoluzione Problemi

### Template Non Caricati
- Verificare console browser per errori JavaScript
- Controllare che localStorage sia abilitato
- Riprovare con template di default

### Stampa Non Funziona
- Verificare che tutti i campi obbligatori siano compilati
- Controllare le impostazioni di stampa del browser
- Utilizzare Chrome per migliore compatibilità

### Dati Persi
- I dati sono salvati nel localStorage del browser
- Cancellare cache browser rimuove i template
- Utilizzare regolarmente l'export per backup

## 📄 Licenza

Progetto sviluppato per SABA SRL - Tutti i diritti riservati.

## 🤝 Supporto

Per assistenza tecnica o personalizzazioni, contattare il team di sviluppo.