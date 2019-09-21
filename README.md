# docker-alpine-asterisk16
Alpine Linux + Asterisk 16/PJSIP [Semi-stable, needs testing]

Based on https://github.com/andrius/asterisk/alpine-latest

This is a really bare container, with the bare minimum config to get asterisk running with PJSIP and extensions.conf.

I am using this as the base for a callcenter project, building onto the image as required.
Originally i built the base image using Ubuntu18, but the image size came up to nearly 2.18 GB compared to the < 40 MB Alpine image this generates.
Ref -> Original Ubuntu18 Repo...


# Notes
ARI + HTTP are ENABLED. Update http.conf and ari.conf if you do NOT want this to be enabled.

# Build Performance
Alpine was considerably quicker, however this is due to it having Asterisk16 in the package repo -> Whereas Ubuntu18, i had to download and do a source based installation.
So these figures are not a great comparison point - as Ubuntu would perform better if Asterisk16 was available in the APT repo.


Successfully tagged alpine-asterisk16-test:latest

real	0m40.954s
user	0m0.065s
sys	0m0.093s

as compared to the ubuntu18 image... 24 Minutes!!!

Successfully tagged ubuntu-asterisk16:latest

real	24m11.403s
user	0m0.731s
sys	0m0.548s



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
