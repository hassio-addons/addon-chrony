#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: chrony
# This file configures the conf file from the options set
# ==============================================================================
readonly CHRONY_CONF='/etc/chrony/chrony.conf'
declare mode
declare -a serverlist

mode=$(bashio::config 'mode')
bashio::log.debug "Running in NTP mode: ${mode}"

for server in $(bashio::config "ntp_${mode}"); do
    bashio::log.debug "Adding server ${server}"
    echo "${mode} ${server} iburst" >> ${CHRONY_CONF}
    serverlist+=("${server}")
done

echo "initstepslew 10 ${serverlist[*]}" >> ${CHRONY_CONF}
