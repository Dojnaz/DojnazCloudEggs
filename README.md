# DojnazCloudEggs

## Cloudflared [![Cloudflared Docker](https://github.com/Dojnaz/DojnazCloudEggs/actions/workflows/cloudflared-docker.yml/badge.svg)](https://github.com/Dojnaz/DojnazCloudEggs/actions/workflows/cloudflared-docker.yml)

Cloudflared is a tunneling daemon that proxies traffic from the Cloudflare network to your origins. It creates a direct tunnel to Cloudflare edge servers, which means there are no incomming requests going through your firewalls. Your server can be isolated, while still being able to serve HTTP(S) requests through Cloudflare's servers.

[Get the egg](./eggs/cloudflared.json)

### How to use it

1. Install the egg into your Pterodactyl panel

2. Create a new server. For optimal performance, the server should be hosted on the same node as the service you're trying to proxy, but it's not a requirement. The daemon is very lightweight, and requires very little resources. I've decided to give our instances 10% CPU, 128MB and 1GB storage. These, especially storage, are more than necessary. An active instance is currently using 0.05% CPU, 13.27MB RAM and 2.99kB of storage.

3. Once the server is created, there will be a link in the console. Please open this link and select the domain you'd like the proxy to run on. It is not possible to have multiple domains on a single instance. If you need to sign in, you might need to click the link again after signing in, since it doesn't redirect you to the correct page after login. This is a Cloudflare issue, and it's not something we are able to fix.

4. Once you've selected the domain, the daemon will download the certificate. Once this is done, you will need to configure it. The configuration file is located at `.cloudflared/config.yml`

5. `tunnel` and `credentials-file` are automatically configured, but you will need to change the ingress rules. Change the `hostname` to the domain you'd like to proxy. Ex `subdomain.example.com`. The `service` option defines where your server is located. Ex `http://10.1.0.2:8080`. `10.1.0.2` is an IP in our internal network at Dojnaz Cloud, so your situation will most likely be different from ours. It's possible to have multiple services running on the same instance, as long as the top domain is the same. Ex `page1.example.com` and `page2.example.com` is allowed, while `page1.example.com` and `page2.example.org` is not allowed.

6. Once you've finished configuring, save the file and start the server.

7. On cloudflare, add a `CNAME` record with the same name as you specified in the configuration file. The target should be `{TUNNEL_ID}.cfargotunnel.com`, but replace `{TUNNEL_ID}` with what is provided in the `tunnel` option in the configuration file. Ex `12345678-90ab-cdef-1234-567890abcdef.cfargotunnel.com`

Having issues? Create an issue, or join our [Discord server](https://discord.gg/dcloud)
