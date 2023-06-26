sudo -S -u postgres psql -f install.sql -U postgres
PGPASSWORD=freego psql -d example -f structure.sql -U freego
PGPASSWORD=freego psql -d example -f data.sql -U freego
