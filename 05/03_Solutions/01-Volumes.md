### Aufgabe 1: Ein Volume erzeugen und testen
#### Pre-requisits
Sie besitzen bereits ein ubuntu Image, um damit einen Container zu starten.

#### Aufgabenstellung
1. Starten Sie einen Container con_<IhrKürzel> mit Volume vol-<IhrKürzel>. Den Volume mounten Sie auf /var/log.
2. Testen Sie, ob der Container und das Volume erzeugt wurden.
3. Überprüfen Sie die Log-Dateien im Container.
4. Geben Sie den Mountpoint des Volumes in einem Kommando aus
5. Stoppen und löschen Sie alle erzeugten Ressourcen, um Seiteneffekte für neue Übungen zu vermeiden

#### Lösungsvorschlag
1. docker run -itd --rm --name con_muha --volume vol-muha:/var/log ubuntu:latest
2. docker ps -a; docker volume ls
3. 
```
$ docker exec -it con_muha bash
root@ce8814c76880:/#
root@ce8814c76880:/# cd /var/log
root@ce8814c76880:/var/log# ls
alternatives.log  apt  bootstrap.log  btmp  dpkg.log  faillog  lastlog  wtmp
```
4. Exit and stop the container
```
root@ce8814c76880:/var/log# exit
docker volume inspect --format '{{ .Mountpoint }}' vol-muha
```
4. Exit and stop the container
```
root@ce8814c76880:/var/log# exit
exit
$ docker stop con_muha
con_muha
```
