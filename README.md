# Nginx Request Origin
This script reads the nginx logs and returns a table with the __number of requests__ and __country__ of each IP.

It is tested with `Ubuntu 21.10`.

# Options
`-o`: Reads old logs ending with .gz

`-r`: Resource to extract

`-l`: Path to nginx log files

# Download
```
git clone https://github.com/LeifHenriksen/nginx_request_origin
cd nginx_request_origin
chmod +x nginx_request_origin.sh
./nginx_request_origin.sh -h
```

# Example
```console
foo@bar:~$ ./nginx_request_origin -r /api/users
Hits  IP               Location
12    103.4.196.212    Singapore
448   106.180.103.167  Japan
2     109.43.179.229   Germany
1     207.194.94.28    Canada
1523  219.74.206.71    Singapore
34    51.68.212.11     United Kingdom
1     87.142.226.193   Germany
13    89.115.153.25    Portugal
2     94.175.136.98    United Kingdom
```
