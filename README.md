# docker-alpine-asterisk16
Alpine Linux + Asterisk 16/PJSIP [Semi-stable, needs testing]

This is a really bare container, with the bare minimum config to get asterisk running with PJSIP and extensions.conf.

I am using this as the base for a callcenter project, building onto the image as required.
Originally i built the base image using Ubuntu18, but the image size came up to nearly 2.18 GB compared to the < 40 MB Alpine image this generates.

# Notes
ARI + HTTP are ENABLED. Update http.conf and ari.conf if you do NOT want this to be enabled.


## Personal details

Web: www.keithro.se

Skype: kariba.keith

Email: me(at)keithro(dot)se

Please feel free to get in touch for any custom projects or help you might need.

# Build
docker build -t alpine-asterisk16 .

# Run
docker run -t alpine-asterisk16


# TODO
 -> Reduce verbosity on entrypoint.sh asterisk script to reduce load. Do not run this in console mode in production lest you want to see considerable CPU consumption!
 -> manager.conf to be added (when required)
