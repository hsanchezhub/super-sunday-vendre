#!/bin/bash
# Lance la présentation « Vendre · Super Sunday Lyon » sur http://localhost:8765
# Double-clic possible à tout moment : coupe l'ancien serveur et en démarre un neuf sur ce dossier.

PORT=8765
cd "$(dirname "$0")" || exit 1
printf '\033]0;Super Sunday · localhost:%s\007' "$PORT"

# 1. coupe l'ancien serveur, quel qu'il soit
OLD=$(lsof -ti tcp:$PORT -sTCP:LISTEN 2>/dev/null)
if [ -n "$OLD" ]; then
  kill $OLD 2>/dev/null
  for i in 1 2 3 4 5 6 7 8 9 10; do
    lsof -ti tcp:$PORT -sTCP:LISTEN >/dev/null 2>&1 || break
    sleep 0.3
  done
  lsof -ti tcp:$PORT -sTCP:LISTEN 2>/dev/null | xargs kill -9 2>/dev/null
fi

# 2. démarre un serveur neuf sur le dossier de la présentation,
#    sans cache : un simple rafraîchissement affiche toujours la dernière version
PY=$(command -v python3 || echo /usr/bin/python3)
"$PY" -c 'import sys, http.server
class H(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()
    def log_message(self, *a):
        pass
http.server.ThreadingHTTPServer(("127.0.0.1", int(sys.argv[1])), H).serve_forever()' "$PORT" >/dev/null 2>&1 &
SERVER=$!

# 3. vérifie qu'il répond vraiment
OK=0
for i in $(seq 1 30); do
  CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$PORT/")
  if [ "$CODE" = "200" ]; then OK=1; break; fi
  sleep 0.3
done

clear
if [ "$OK" = "1" ]; then
  echo "Super Sunday : http://localhost:$PORT   (serveur lancé à $(date +%H:%M))"
  echo
  echo "F : plein écran · P : notes présentateur · ? : aide"
  echo "Laisse cette fenêtre ouverte pendant l'intervention. Ferme-la après pour arrêter le serveur."
  [ -z "$NO_OPEN" ] && open "http://localhost:$PORT/"
else
  echo "Le serveur ne répond pas sur le port $PORT."
  echo "Relance ce fichier par double-clic : Lancer le localhost.command"
fi
wait $SERVER
