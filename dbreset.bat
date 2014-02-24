cd db
echo loesche
del *.sqlite3
echo geloescht
echo aufsetzen
rake drails:db:setup
echo fertig
pause
cd ..