openssl genrsa -out stretch.roguedesigns.us.server.key 2048
openssl rsa -in stretch.roguedesigns.us.server.key -out stretch.roguedesigns.us.server.key
openssl req -sha256 -new -key stretch.roguedesigns.us.server.key -out stretch.roguedesigns.us.server.csr -subj '/CN=stretch.roguedesigns.us'
openssl x509 -req -sha256 -days 730 -in stretch.roguedesigns.us.server.csr -signkey stretch.roguedesigns.us.server.key -out stretch.roguedesigns.us.server.crt
