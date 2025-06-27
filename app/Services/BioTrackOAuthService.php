<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;

class BioTrackOAuthService
{
    public function getAccessToken(): ?string
    {


        $response = Http::asForm()->post(config('services.biotrack.token_url'), [
            'grant_type' => 'authorization_code',
            'client_id' => config('services.biotrack.client_id'),
            'client_secret' => config('services.biotrack.client_secret'),
            'code' => 'dummy',
            'redirect_uri' => 'https://your-redirect-uri.test/callback'
        ]);

        // Explicitly log everything for debugging
        logger()->error('BioTrack OAuth Response', [
            'status' => $response->status(),
            'body' => $response->body(),
        ]);

        dump($response->status(), $response->json());

        if ($response->successful()) {
            return $response->json()['access_token'] ?? null;
        }

        return null;
    }

}
