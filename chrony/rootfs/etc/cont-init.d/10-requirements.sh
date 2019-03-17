#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: chrony
# This files check if all user configuration requirements are met
# ==============================================================================

# Check running mode
if bashio::config.equals 'mode' 'pool' \
    && bashio::config.is_empty 'ntp_pool';
then
    bashio::log.fatal
    bashio::log.fatal 'Configuration of this add-on is incomplete.'
    bashio::log.fatal
    bashio::log.fatal 'pool mode is configured but the ntp_pool'
    bashio::log.fatal 'is empty'
    bashio::log.fatal
    bashio::log.fatal 'If using pool mode please set the'
    bashio::log.fatal '"ntp_pool" option in the add-on'
    bashio::log.fatal 'configuration.'
    bashio::log.fatal
    bashio::exit.nok
fi
if bashio::config.equals 'mode' 'server' \
    && bashio::config.is_empty 'ntp_server';
then
    bashio::log.fatal
    bashio::log.fatal 'Configuration of this add-on is incomplete.'
    bashio::log.fatal
    bashio::log.fatal 'server mode is configured but the ntp_server'
    bashio::log.fatal 'is empty'
    bashio::log.fatal
    bashio::log.fatal 'If using server mode please set the'
    bashio::log.fatal '"ntp_server" option in the add-on'
    bashio::log.fatal 'configuration.'
    bashio::log.fatal
    bashio::exit.nok
fi