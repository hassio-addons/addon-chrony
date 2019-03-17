#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: chrony
# This files configures the conf file from the options set
# ==============================================================================
readonly CHRONY_CONF='/etc/chrony/chrony.conf'
readonly NTPMODE=$(bashio::config 'mode')

declare configline
declare serverlist

if bashio::config.equals 'mode' 'pool'; 
then
    readonly SOURCE=$(bashio::config 'ntp_pool')
elif  bashio::config.equals 'mode' 'server'; 
then
    readonly SOURCE=$(bashio::config 'ntp_server')
fi

for server in ${SOURCE}; do
    configline=${NTPMODE}
    configline+=" "
    configline+=$server
    configline+=" iburst"
    bashio::log.debug "Setting config to ${configline}"
    echo "${configline}" >> ${CHRONY_CONF}
    serverlist+=$server
    serverlist+=" "
done
echo "initstepslew 10 ${serverlist}" >> ${CHRONY_CONF}