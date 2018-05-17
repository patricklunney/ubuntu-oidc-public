# Apache Web Server with mod_auth_oidc

I made this as a proof of concept that we can run an SSO enabled web server using Open ID Connect with an Apache2 web server inside a container(s)

It has PHP installed on it, but you could easily change that or add support for reverse proxies for other types of apps.

It was tested while on Internet network.

`docker build . -t ubuntu-oidc`

### To Run:

Make sure you add your client id, secret, and redirect uri. I would advise setting the redirect URI to port 80 for simplicity.

```
sudo docker run --rm \
-p 80:80 \ 
-e METADATA=<metadata> \
-e CLIENT_ID=<your client id> \
-e CLIENT_SECRET=<your client secret> \
-e REDIRECT_URI=<your app redirect uri> \
<your-name>/ubuntu-oidc
```
