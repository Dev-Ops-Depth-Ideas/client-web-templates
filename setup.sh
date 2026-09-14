#!/data/data/com.termux/files/usr/bin/bash

ITEMS=(
  "01-developer-terminal|DevOS Terminal|Developer portfolio με dark CLI ύφος|emerald"
  "02-modern-saas|NextGen Cloud|Landing page για tech επιχειρήσεις & SaaS|indigo"
  "03-creative-agency|Studio Mono|Showcase για διαφημιστικά & creative agencies|violet"
  "04-bistro-restaurant|Le Bistrot|Κομψό μενού, κρατήσεις & ώρες λειτουργίας|amber"
  "05-real-estate|Prime Estates|Προβολή ακινήτων, βιλών & χαρακτηριστικών|cyan"
  "06-editorial-blog|The Journal|Μίνιμαλ blog/newsletter για άρθρα & ειδήσεις|rose"
  "07-product-launch|AeroPods Audio|Landing page παρουσίασης μονού προϊόντος|blue"
  "08-fitness-trainer|Forge Fitness|Προγράμματα γυμναστηρίου, personal training & τιμές|orange"
  "09-photography|Lumina Works|Gallery portfolio για φωτογράφους & visual artists|teal"
  "10-consulting-booking|StratEdge Advisory|Επαγγελματικό booking & business consulting|sky"
)

cat << 'HTML' > index.html
<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Client Web Templates Showcase</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-950 text-slate-100 min-h-screen py-12 px-6 font-sans">
  <div class="max-w-5xl mx-auto">
    <header class="text-center mb-16">
      <span class="text-xs uppercase tracking-widest text-emerald-400 border border-emerald-500/30 px-3 py-1 rounded-full bg-emerald-950/40">
        Demo Showcase
      </span>
      <h1 class="text-4xl md:text-5xl font-extrabold mt-4 mb-3 tracking-tight">
        Επιλέξτε Σχέδιο Ιστοσελίδας
      </h1>
      <p class="text-slate-400 text-lg max-w-xl mx-auto">
        Ζωντανά παραδείγματα έτοιμων σχεδίων ιστοσελίδων για την επιχείρησή σας.
      </p>
    </header>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
HTML

for item in "${ITEMS[@]}"; do
  IFS="|" read -r SLUG TITLE DESC ACCENT <<< "$item"

  cat << HTML >> index.html
      <div class="bg-slate-900 border border-slate-800 rounded-xl p-6 hover:border-${ACCENT}-500/50 transition duration-200 flex flex-col justify-between">
        <div>
          <div class="text-${ACCENT}-400 text-xs font-mono mb-2 uppercase tracking-wider">${SLUG}</div>
          <h3 class="text-xl font-bold text-white mb-2">${TITLE}</h3>
          <p class="text-slate-400 text-sm mb-6">${DESC}</p>
        </div>
        <a href="./${SLUG}/" class="inline-flex items-center justify-center w-full py-2.5 px-4 rounded-lg bg-slate-800 hover:bg-${ACCENT}-600 text-white text-sm font-medium transition duration-150">
          Προεπισκόπηση Demo &rarr;
        </a>
      </div>
HTML

  mkdir -p "$SLUG"
  cat << HTML > "$SLUG/index.html"
<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${TITLE} - Live Demo</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-950 text-slate-100 min-h-screen flex flex-col justify-between font-sans">
  <header class="border-b border-slate-800 px-6 py-4 flex justify-between items-center max-w-6xl mx-auto w-full">
    <a href="../" class="text-xs text-slate-400 hover:text-white transition">&larr; Πίσω στον Κατάλογο</a>
    <div class="font-bold text-${ACCENT}-400">${TITLE}</div>
    <a href="#contact" class="text-xs bg-${ACCENT}-500 text-slate-950 px-3 py-1.5 rounded font-semibold hover:opacity-90 transition">Επικοινωνία</a>
  </header>
  <main class="max-w-4xl mx-auto px-6 py-24 text-center flex-1 flex flex-col justify-center items-center">
    <span class="text-xs uppercase tracking-widest text-${ACCENT}-400 border border-${ACCENT}-500/30 px-3 py-1 rounded-full mb-6 bg-${ACCENT}-950/40">
      ${SLUG}
    </span>
    <h1 class="text-4xl md:text-6xl font-extrabold tracking-tight mb-6">
      ${TITLE}
    </h1>
    <p class="text-lg md:text-xl text-slate-400 max-w-2xl mb-8">
      ${DESC}. Πλήρως προσαρμόσιμο σε γραφικά, κείμενα και λειτουργίες για τις ανάγκες σας.
    </p>
    <div class="flex flex-wrap justify-center gap-4">
      <a href="#contact" class="bg-${ACCENT}-500 text-slate-950 font-semibold px-6 py-3 rounded-lg shadow-lg hover:opacity-95 transition">
        Ζητήστε Προσφορά
      </a>
      <a href="../" class="border border-slate-800 hover:bg-slate-900 text-slate-300 font-semibold px-6 py-3 rounded-lg transition">
        Άλλα Πρότυπα
      </a>
    </div>
  </main>
  <footer class="border-t border-slate-900 py-6 text-center text-xs text-slate-600">
    <p>&copy; $(date +%Y) ${TITLE} &bull; Web Design & Development</p>
  </footer>
</body>
</html>
HTML
done

cat << 'HTML' >> index.html
    </div>
    <footer class="mt-16 text-center text-xs text-slate-600 border-t border-slate-900 pt-8">
      &copy; $(date +%Y) Web Solutions Portfolio.
    </footer>
  </div>
</body>
</html>
HTML

cat << 'MD' > README.md
# Client Web Templates
Live catalog with 10 production-ready static website templates for clients.
MD

git init -b main
git add .
git commit -m "feat: initial commit with 10 templates and client catalog"
gh repo create client-web-templates --public --source=. --remote=origin --push
gh api -X POST repos/Dev-Ops-Depth-Ideas/client-web-templates/pages -f source='{"branch":"main","path":"/"}'
