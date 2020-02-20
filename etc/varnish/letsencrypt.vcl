# /etc/varnish/letsencrypt.vcl

vcl 4.0;

backend certbot {
    .host = "127.0.0.1";
    .port = "8081";
}

sub vcl_recv {
    if (req.url ~ "^/\.well-known/acme-challenge/") {
        set req.backend_hint = certbot;
        return(pipe);
    }
}

sub vcl_pipe {
    if (req.backend_hint == certbot) {
        set req.http.Connection = "close";
        return(pipe);
    }
}