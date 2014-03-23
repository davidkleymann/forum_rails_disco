cd db
echo loesche
del *.sqlite3
echo geloescht
echo aufsetzen
rake disco:migrate
echo fertig
pause
cd ..