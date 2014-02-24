cd db
echo leosche
del *.sqlite3
echo geloescht
echo aufsetzen
rake drails:db:setup
echo fertig
pause
cd ..