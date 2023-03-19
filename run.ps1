
New-Item -ErrorAction Ignore -ItemType directory -Path volumes\\Steam
New-Item -ErrorAction Ignore -ItemType directory -Path volumes\\arma3
docker build . -t arma3server:local
if ($LastExitCode -ne 0) {
    exit 1
}
docker run -it -v "$(pwd)\\volumes\\Steam:/home/steam/Steam" -v "$(pwd)\\volumes\\arma3:/home/steam/Steam/arma3" --env-file=.env  -p 2302:2302/udp -p 2303:2303/udp -p 2304:2304/udp -p 2305:2305/udp -p 2306:2306/udp "docker.io/library/arma3server:local"



#docker run -it -v "$(pwd)/Steam:/home/steam/Steam" -v "$(pwd)/arma3:/home/steam/Steam/arma3" --env-file=.env  -p 2302:2302/udp -p 2303:2303/udp -p 2304:2304/udp -p 2305:2305/udp -p 2306:2306/udp --user root "bdhood/arma3server:master"