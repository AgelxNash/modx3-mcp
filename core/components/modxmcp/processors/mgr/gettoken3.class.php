<?php

use MODX\Revolution\Processors\Processor;

/** Fetch the active token on explicit manager request only. Never embed it in page HTML. */
class ModxmcpGetToken3Processor extends Processor
{
    public function checkPermissions()
    {
        return $this->modx->user && $this->modx->user->isAuthenticated('mgr')
            && $this->modx->hasPermission('settings');
    }

    public function process()
    {
        header('Cache-Control: no-store, private');
        $token = (string) $this->modx->getOption('modxmcp.api_token', null, '');
        if ($token === '') {
            return $this->failure('No API token configured.');
        }
        return $this->success('', array('token' => $token));
    }
}

return 'ModxmcpGetToken3Processor';
