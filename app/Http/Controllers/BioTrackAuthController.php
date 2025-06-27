<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BioTrackAuthController extends Controller
{
    public function redirect()
    {
        $query = http_build_query([
            'response_type' => 'code',
            'client_id' => config('services.biotrack.client_id'),
            'redirect_uri' => route('biotrack.callback'),
        ]);

        return redirect("https://licensee-api.sandbox-ny.biotr.ac/oauth?$query");
    }

    public function callback(Request $request)
    {
        $code = $request->query('code');

        $response = \Http::asForm()->post(config('services.biotrack.token_url'), [
            'grant_type' => 'authorization_code',
            'client_id' => config('services.biotrack.client_id'),
            'client_secret' => config('services.biotrack.client_secret'),
            'code' => $code,
            'redirect_uri' => route('biotrack.callback'),
        ]);

        if ($response->successful()) {
            $accessToken = $response->json()['access_token'];
            // Optionally store this
            return response()->json(['access_token' => $accessToken]);
        }

        return response()->json([
            'error' => $response->json(),
            'status' => $response->status()
        ], 403);
    }
}
