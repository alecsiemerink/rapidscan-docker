# Use the latest Kali Linux base image as the starting point
FROM kalilinux/kali-rolling:latest

# Set the environment variable to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND noninteractive

# Update the package index and upgrade installed packages
RUN apt-get update && \
    apt-get -y dist-upgrade && \

    # Install the necessary packages for RapidScan and other tools
    apt-get -yq install \
      python3 \
      host \
      whois \
      sslyze \
      wapiti \
      nmap \
      dmitry \
      dnsenum \
      dnsmap \
      dnsrecon \
      dnswalk \
      dirb \
      wafw00f \
      whatweb \
      nikto \
      lbd \
      xsser \
      fierce \
      theharvester \
      davtest \
      uniscan \
      amass \
      wget && \

    # Remove unnecessary packages and clean up
    apt-get -yq autoremove && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log} && \

    # Download and install RapidScan
    wget --no-check-certificate -q -O /usr/local/bin/rapidscan https://raw.githubusercontent.com/skavngr/rapidscan/master/rapidscan.py && \
    chmod +x /usr/local/bin/rapidscan

# Set the working directory to /app
WORKDIR /app

# Set the default command to run RapidScan
ENTRYPOINT ["/usr/local/bin/rapidscan"]
