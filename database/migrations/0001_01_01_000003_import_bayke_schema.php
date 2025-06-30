<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $path = database_path('sql/bayke_schema.new.sql');
        $sql = file_get_contents($path);
        $sql = preg_replace_callback(
            '/CREATE TABLE public\.("?[A-Za-z0-9_]+"?)/',
            function ($matches) {
                return 'DROP TABLE IF EXISTS public.'.$matches[1].' CASCADE;' . "\n\n" . $matches[0];
            },
            $sql
        );
        DB::unprepared($sql);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();

        $tables = [
            'chain_of_custodies',
            'client_operation_devices',
            'clients',
            'companies',
            'delivery_packages',
            'device_logs',
            'drivers',
            'employee_licenses',
            'employees',
            'facilities',
            'facility_types',
            'failed_jobs',
            'gateway_logs',
            'harvests',
            'item_categories',
            'items',
            'job_batches',
            'jobs',
            'license_types',
            'locations',
            'metrc_api_request_logs',
            'oauth_access_tokens',
            'oauth_auth_codes',
            'oauth_clients',
            'oauth_personal_access_clients',
            'oauth_refresh_tokens',
            'operations',
            'package_items',
            'packages',
            'password_reset_tokens',
            'people',
            'personal_access_tokens',
            'plant_waste_methods',
            'plant_waste_reasons',
            'plants',
            'processing_weight_record_batches',
            'processing_weight_record_package_tags',
            'processing_weight_records',
            'roles',
            'sessions',
            'statuses',
            'strains',
            'tags',
            'telescope_entries',
            'telescope_entries_tags',
            'telescope_monitoring',
            'transfers',
            'unassigned_facilities',
            'user_actions',
            'user_roles',
            'users',
            'vehicles',
            'weight_record_batches',
            'weight_record_logs',
            'weight_records',
        ];

        foreach ($tables as $table) {
            Schema::dropIfExists($table);
        }

        Schema::enableForeignKeyConstraints();
    }
};