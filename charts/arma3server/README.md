# charts/arma3server
helm chart for running arma3server

```bash
kubectl create ns arma3
helm upgrade -i arma3server ./charts/arma3server \
    --set secrets.steamCredentials.username="<steam_username>" \
    --set secrets.steamCredentials.password="<steam_password>" \
    --set secrets.serverCredentials.adminPassword="<server_admin_password>" \
    --set secrets.serverCredentials.commandPassword="<server_command_password>"
```
