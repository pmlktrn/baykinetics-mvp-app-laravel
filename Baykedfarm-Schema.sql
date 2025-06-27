-- public."cache" definition

-- Drop table

-- DROP TABLE public."cache";

CREATE TABLE public."cache" (
	"key" varchar(255) NOT NULL,
	value text NOT NULL,
	expiration int4 NOT NULL,
	CONSTRAINT cache_pkey PRIMARY KEY (key)
);


-- public.cache_locks definition

-- Drop table

-- DROP TABLE public.cache_locks;

CREATE TABLE public.cache_locks (
	"key" varchar(255) NOT NULL,
	"owner" varchar(255) NOT NULL,
	expiration int4 NOT NULL,
	CONSTRAINT cache_locks_pkey PRIMARY KEY (key)
);


-- public.delivery_packages definition

-- Drop table

-- DROP TABLE public.delivery_packages;

CREATE TABLE public.delivery_packages (
	id bigserial NOT NULL,
	transfer_id int8 NOT NULL,
	"PackageId" int8 NULL,
	"PackageLabel" varchar(255) NULL,
	"PackageType" varchar(255) NULL,
	"SourceHarvestNames" varchar(255) NULL,
	"SourcePackageLabels" varchar(255) NULL,
	"ItemId" int8 NULL,
	"ItemName" varchar(255) NULL,
	"ItemCategoryName" varchar(255) NULL,
	"ItemStrainName" varchar(255) NULL,
	"ItemBrandName" varchar(255) NULL,
	"ItemUnitCbdPercent" numeric(8, 2) NULL,
	"ItemUnitCbdContent" numeric(8, 2) NULL,
	"ItemUnitCbdContentUnitOfMeasureName" varchar(255) NULL,
	"ItemUnitCbdContentDose" numeric(8, 2) NULL,
	"ItemUnitCbdContentDoseUnitOfMeasureName" varchar(255) NULL,
	"ItemUnitThcPercent" numeric(8, 2) NULL,
	"ItemUnitThcContent" numeric(8, 2) NULL,
	"ItemUnitThcContentUnitOfMeasureName" varchar(255) NULL,
	"ItemUnitThcContentDose" numeric(8, 2) NULL,
	"ItemUnitThcContentDoseUnitOfMeasureName" varchar(255) NULL,
	"ItemUnitVolume" numeric(8, 2) NULL,
	"ItemUnitVolumeUnitOfMeasureName" varchar(255) NULL,
	"ItemUnitWeight" numeric(8, 2) NULL,
	"ItemUnitWeightUnitOfMeasureName" varchar(255) NULL,
	"ItemServingSize" numeric(8, 2) DEFAULT '0'::numeric NOT NULL,
	"ItemSupplyDurationDays" int4 NULL,
	"ItemUnitQuantity" numeric(8, 2) NULL,
	"ItemUnitQuantityUnitOfMeasureName" varchar(255) NULL,
	"LabTestingState" varchar(255) NOT NULL,
	"ProductionBatchNumber" varchar(255) NULL,
	"IsTradeSample" bool DEFAULT false NOT NULL,
	"IsTradeSamplePersistent" bool DEFAULT false NOT NULL,
	"SourcePackageIsTradeSample" bool DEFAULT false NOT NULL,
	"IsDonation" bool DEFAULT false NOT NULL,
	"SourcePackageIsDonation" bool DEFAULT false NOT NULL,
	"IsTestingSample" bool DEFAULT false NOT NULL,
	"ProductRequiresRemediation" bool DEFAULT false NOT NULL,
	"ContainsRemediatedProduct" bool DEFAULT false NOT NULL,
	"RemediationDate" date NULL,
	"ShipmentPackageState" varchar(255) NULL,
	"ShippedQuantity" numeric(8, 2) NULL,
	"ShippedUnitOfMeasureName" varchar(255) NULL,
	"PackagedDate" date NULL,
	"ExpirationDate" date NULL,
	"SellByDate" date NULL,
	"UseByDate" date NULL,
	"GrossUnitOfWeightName" varchar(255) NULL,
	"ReceivedQuantity" numeric(8, 2) NULL,
	"ReceivedUnitOfMeasureName" varchar(255) NULL,
	"SourceProductionBatchNumbers" varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT delivery_packages_pkey PRIMARY KEY (id)
);
CREATE INDEX delivery_packages_transfer_id_index ON public.delivery_packages USING btree (transfer_id);


-- public.device_logs definition

-- Drop table

-- DROP TABLE public.device_logs;

CREATE TABLE public.device_logs (
	id bigserial NOT NULL,
	"type" varchar(255) NOT NULL,
	description text NULL,
	payload json NOT NULL,
	response json NULL,
	error_message text NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT device_logs_pkey PRIMARY KEY (id)
);


-- public.drivers definition

-- Drop table

-- DROP TABLE public.drivers;

CREATE TABLE public.drivers (
	id bigserial NOT NULL,
	metrc_id int8 NULL,
	"FacilityId" int8 NULL,
	"Name" varchar(255) NOT NULL,
	"DriversLicenseNumber" varchar(255) NOT NULL,
	"EmployeeId" varchar(255) NOT NULL,
	"IsArchived" bool DEFAULT false NOT NULL,
	"LastModified" timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT drivers_pkey PRIMARY KEY (id)
);


-- public.employees definition

-- Drop table

-- DROP TABLE public.employees;

CREATE TABLE public.employees (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"FullName" varchar(255) NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT employees_pkey PRIMARY KEY (id)
);
CREATE INDEX employees_facility_id_index ON public.employees USING btree (facility_id);
CREATE INDEX employees_metrc_id_index ON public.employees USING btree (metrc_id);


-- public.failed_jobs definition

-- Drop table

-- DROP TABLE public.failed_jobs;

CREATE TABLE public.failed_jobs (
	id bigserial NOT NULL,
	"uuid" varchar(255) NOT NULL,
	"connection" text NOT NULL,
	queue text NOT NULL,
	payload text NOT NULL,
	"exception" text NOT NULL,
	failed_at timestamp(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT failed_jobs_pkey PRIMARY KEY (id),
	CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid)
);


-- public.gateway_logs definition

-- Drop table

-- DROP TABLE public.gateway_logs;

CREATE TABLE public.gateway_logs (
	id bigserial NOT NULL,
	"type" varchar(255) NOT NULL,
	description text NULL,
	payload json NOT NULL,
	response json NULL,
	error_message text NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT gateway_logs_pkey PRIMARY KEY (id)
);


-- public.harvests definition

-- Drop table

-- DROP TABLE public.harvests;

CREATE TABLE public.harvests (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"type" varchar(255) NULL,
	"Name" varchar(255) NOT NULL,
	"HarvestType" varchar(255) NOT NULL,
	"SourceStrainCount" int4 NOT NULL,
	"SourceStrainNames" varchar(255) NULL,
	"Strains" json NULL,
	"DryingLocationId" int4 NOT NULL,
	"DryingLocationName" varchar(255) NOT NULL,
	"DryingLocationTypeName" varchar(255) NOT NULL,
	"PatientLicenseNumber" varchar(255) NULL,
	"CurrentWeight" float8 NOT NULL,
	"TotalWasteWeight" float8 NOT NULL,
	"PlantCount" int4 NOT NULL,
	"TotalWetWeight" float8 NOT NULL,
	"TotalRestoredWeight" float8 NOT NULL,
	"PackageCount" int4 NOT NULL,
	"TotalPackagedWeight" float8 NOT NULL,
	"UnitOfWeightName" varchar(255) NOT NULL,
	"LabTestingState" varchar(255) NOT NULL,
	"LabTestingStateDate" date NULL,
	"IsOnHold" bool DEFAULT false NOT NULL,
	"HarvestStartDate" date NULL,
	"FinishedDate" date NULL,
	"ArchivedDate" date NULL,
	"IsOnTrip" bool DEFAULT false NOT NULL,
	"LastModified" timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	package_tag_id varchar(255) NULL,
	license_id varchar(255) NULL,
	CONSTRAINT harvests_pkey PRIMARY KEY (id)
);
CREATE INDEX harvests_facility_id_index ON public.harvests USING btree (facility_id);
CREATE INDEX harvests_metrc_id_index ON public.harvests USING btree (metrc_id);


-- public.items definition

-- Drop table

-- DROP TABLE public.items;

CREATE TABLE public.items (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"Name" varchar(255) NULL,
	"ProductCategoryName" varchar(255) NULL,
	"ProductCategoryType" varchar(255) NULL,
	"IsExpirationDateRequired" bool DEFAULT false NOT NULL,
	"IsSellByDateRequired" bool DEFAULT false NOT NULL,
	"IsUseByDateRequired" bool DEFAULT false NOT NULL,
	"QuantityType" varchar(255) NULL,
	"DefaultLabTestingState" varchar(255) NULL,
	"UnitOfMeasureName" varchar(255) NULL,
	"ApprovalStatus" varchar(255) NULL,
	"ApprovalStatusDateTime" timestamp(0) NULL,
	"StrainId" int8 NULL,
	"StrainName" varchar(255) NULL,
	"ItemBrandId" int8 NULL,
	"ItemBrandName" varchar(255) NULL,
	"AdministrationMethod" varchar(255) NULL,
	"UnitCbdPercent" float8 NULL,
	"UnitCbdContent" varchar(255) NULL,
	"UnitCbdContentUnitOfMeasureName" varchar(255) NULL,
	"UnitCbdContentDose" varchar(255) NULL,
	"UnitCbdContentDoseUnitOfMeasureName" varchar(255) NULL,
	"UnitThcPercent" float8 NULL,
	"UnitThcContent" varchar(255) NULL,
	"UnitThcContentUnitOfMeasureName" varchar(255) NULL,
	"UnitThcContentDose" varchar(255) NULL,
	"UnitThcContentDoseUnitOfMeasureName" varchar(255) NULL,
	"UnitVolume" float8 NULL,
	"UnitVolumeUnitOfMeasureName" varchar(255) NULL,
	"UnitWeight" float8 NULL,
	"UnitWeightUnitOfMeasureName" varchar(255) NULL,
	"ServingSize" varchar(255) NULL,
	"SupplyDurationDays" varchar(255) NULL,
	"NumberOfDoses" varchar(255) NULL,
	"UnitQuantity" varchar(255) NULL,
	"UnitQuantityUnitOfMeasureName" varchar(255) NULL,
	"PublicIngredients" varchar(255) NULL,
	"Description" text NULL,
	"ProductImages" json NULL,
	"LabelImages" json NULL,
	"PackagingImages" json NULL,
	"IsUsed" bool DEFAULT false NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	"ProductImageFileSystemIds" json NULL,
	"LabelImageFileSystemIds" json NULL,
	"PackagingImageFileSystemIds" json NULL,
	"ProductPDFFileSystemIds" json NULL,
	CONSTRAINT items_pkey PRIMARY KEY (id)
);
CREATE INDEX items_facility_id_index ON public.items USING btree (facility_id);
CREATE INDEX items_metrc_id_index ON public.items USING btree (metrc_id);


-- public.job_batches definition

-- Drop table

-- DROP TABLE public.job_batches;

CREATE TABLE public.job_batches (
	id varchar(255) NOT NULL,
	"name" varchar(255) NOT NULL,
	total_jobs int4 NOT NULL,
	pending_jobs int4 NOT NULL,
	failed_jobs int4 NOT NULL,
	failed_job_ids text NOT NULL,
	"options" text NULL,
	cancelled_at int4 NULL,
	created_at int4 NOT NULL,
	finished_at int4 NULL,
	CONSTRAINT job_batches_pkey PRIMARY KEY (id)
);


-- public.jobs definition

-- Drop table

-- DROP TABLE public.jobs;

CREATE TABLE public.jobs (
	id bigserial NOT NULL,
	queue varchar(255) NOT NULL,
	payload text NOT NULL,
	attempts int2 NOT NULL,
	reserved_at int4 NULL,
	available_at int4 NOT NULL,
	created_at int4 NOT NULL,
	CONSTRAINT jobs_pkey PRIMARY KEY (id)
);
CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


-- public.license_types definition

-- Drop table

-- DROP TABLE public.license_types;

CREATE TABLE public.license_types (
	id bigserial NOT NULL,
	"name" varchar(255) NOT NULL,
	"type" varchar(255) NULL,
	start_date date NULL,
	end_date date NULL,
	application_fee numeric(8, 2) NULL,
	annual_fee numeric(8, 2) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT license_types_pkey PRIMARY KEY (id)
);


-- public.metrc_api_request_logs definition

-- Drop table

-- DROP TABLE public.metrc_api_request_logs;

CREATE TABLE public.metrc_api_request_logs (
	id bigserial NOT NULL,
	user_id int8 NULL,
	base_uri varchar(255) NULL,
	request_url varchar(255) NULL,
	api_user_key varchar(255) NULL,
	api_vendor_key varchar(255) NULL,
	payload json NULL,
	response json NULL,
	license_id varchar(255) NULL,
	harvest_batch_id varchar(255) NULL,
	event_name varchar(255) NULL,
	headers json NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	CONSTRAINT metrc_api_request_logs_pkey PRIMARY KEY (id)
);
CREATE INDEX metrc_api_request_logs_user_id_api_user_key_api_vendor_key_lice ON public.metrc_api_request_logs USING btree (user_id, api_user_key, api_vendor_key, license_id, harvest_batch_id, event_name);


-- public.migrations definition

-- Drop table

-- DROP TABLE public.migrations;

CREATE TABLE public.migrations (
	id serial4 NOT NULL,
	migration varchar(255) NOT NULL,
	batch int4 NOT NULL,
	CONSTRAINT migrations_pkey PRIMARY KEY (id)
);


-- public.oauth_access_tokens definition

-- Drop table

-- DROP TABLE public.oauth_access_tokens;

CREATE TABLE public.oauth_access_tokens (
	id varchar(100) NOT NULL,
	user_id int8 NULL,
	client_id int8 NOT NULL,
	"name" varchar(255) NULL,
	scopes text NULL,
	revoked bool NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	expires_at timestamp(0) NULL,
	CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id)
);
CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


-- public.oauth_auth_codes definition

-- Drop table

-- DROP TABLE public.oauth_auth_codes;

CREATE TABLE public.oauth_auth_codes (
	id varchar(100) NOT NULL,
	user_id int8 NOT NULL,
	client_id int8 NOT NULL,
	scopes text NULL,
	revoked bool NOT NULL,
	expires_at timestamp(0) NULL,
	CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id)
);
CREATE INDEX oauth_auth_codes_user_id_index ON public.oauth_auth_codes USING btree (user_id);


-- public.oauth_clients definition

-- Drop table

-- DROP TABLE public.oauth_clients;

CREATE TABLE public.oauth_clients (
	id bigserial NOT NULL,
	user_id int8 NULL,
	"name" varchar(255) NOT NULL,
	secret varchar(100) NULL,
	provider varchar(255) NULL,
	redirect text NOT NULL,
	personal_access_client bool NOT NULL,
	password_client bool NOT NULL,
	revoked bool NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT oauth_clients_pkey PRIMARY KEY (id)
);
CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


-- public.oauth_personal_access_clients definition

-- Drop table

-- DROP TABLE public.oauth_personal_access_clients;

CREATE TABLE public.oauth_personal_access_clients (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id)
);


-- public.oauth_refresh_tokens definition

-- Drop table

-- DROP TABLE public.oauth_refresh_tokens;

CREATE TABLE public.oauth_refresh_tokens (
	id varchar(100) NOT NULL,
	access_token_id varchar(100) NOT NULL,
	revoked bool NOT NULL,
	expires_at timestamp(0) NULL,
	CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id)
);
CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


-- public.packages definition

-- Drop table

-- DROP TABLE public.packages;

CREATE TABLE public.packages (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"Label" varchar(255) NULL,
	"PackageType" varchar(255) NULL,
	"SourceHarvestCount" int4 NULL,
	"SourcePackageCount" int4 NULL,
	"SourceProcessingJobCount" int4 NULL,
	"SourceHarvestNames" varchar(255) NULL,
	"SourcePackageLabels" varchar(255) NULL,
	"LocationId" int4 NULL,
	"LocationName" varchar(255) NULL,
	"LocationTypeName" varchar(255) NULL,
	"Quantity" float8 NULL,
	"UnitOfMeasureName" varchar(255) NULL,
	"UnitOfMeasureAbbreviation" varchar(255) NULL,
	"PatientLicenseNumber" varchar(255) NULL,
	"ItemFromFacilityLicenseNumber" varchar(255) NULL,
	"ItemFromFacilityName" varchar(255) NULL,
	"Note" text NULL,
	"PackagedDate" date NULL,
	"ExpirationDate" date NULL,
	"SellByDate" date NULL,
	"UseByDate" date NULL,
	"InitialLabTestingState" varchar(255) NULL,
	"LabTestingState" varchar(255) NULL,
	"LabTestingStateDate" date NULL,
	"IsProductionBatch" bool DEFAULT false NOT NULL,
	"ProductionBatchNumber" varchar(255) NULL,
	"SourceProductionBatchNumbers" varchar(255) NULL,
	"IsTradeSample" bool DEFAULT false NOT NULL,
	"IsTradeSamplePersistent" bool DEFAULT false NOT NULL,
	"SourcePackageIsTradeSample" bool DEFAULT false NOT NULL,
	"IsDonation" bool DEFAULT false NOT NULL,
	"IsDonationPersistent" bool DEFAULT false NOT NULL,
	"SourcePackageIsDonation" bool DEFAULT false NOT NULL,
	"IsTestingSample" bool DEFAULT false NOT NULL,
	"IsProcessValidationTestingSample" bool DEFAULT false NOT NULL,
	"ProductRequiresRemediation" bool DEFAULT false NOT NULL,
	"ContainsRemediatedProduct" bool DEFAULT false NOT NULL,
	"RemediationDate" date NULL,
	"ReceivedDateTime" timestamp(0) NULL,
	"ReceivedFromManifestNumber" varchar(255) NULL,
	"ReceivedFromFacilityLicenseNumber" varchar(255) NULL,
	"ReceivedFromFacilityName" varchar(255) NULL,
	"IsOnHold" bool DEFAULT false NOT NULL,
	"ArchivedDate" date NULL,
	"FinishedDate" date NULL,
	"IsOnTrip" bool DEFAULT false NOT NULL,
	"IsOnRetailerDelivery" bool DEFAULT false NOT NULL,
	"PackageForProductDestruction" varchar(255) NULL,
	"LastModified" timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	transfer_id int8 NULL,
	CONSTRAINT packages_pkey PRIMARY KEY (id)
);
CREATE INDEX packages_facility_id_index ON public.packages USING btree (facility_id);
CREATE INDEX packages_metrc_id_index ON public.packages USING btree (metrc_id);


-- public.password_reset_tokens definition

-- Drop table

-- DROP TABLE public.password_reset_tokens;

CREATE TABLE public.password_reset_tokens (
	email varchar(255) NOT NULL,
	"token" varchar(255) NOT NULL,
	created_at timestamp(0) NULL,
	CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email)
);


-- public.personal_access_tokens definition

-- Drop table

-- DROP TABLE public.personal_access_tokens;

CREATE TABLE public.personal_access_tokens (
	id bigserial NOT NULL,
	tokenable_type varchar(255) NOT NULL,
	tokenable_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	"token" varchar(64) NOT NULL,
	abilities text NULL,
	last_used_at timestamp(0) NULL,
	expires_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id),
	CONSTRAINT personal_access_tokens_token_unique UNIQUE (token)
);
CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


-- public.plant_waste_methods definition

-- Drop table

-- DROP TABLE public.plant_waste_methods;

CREATE TABLE public.plant_waste_methods (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"Name" varchar(255) NOT NULL,
	"ForPlants" bool DEFAULT false NOT NULL,
	"ForProductDestruction" bool DEFAULT false NOT NULL,
	"LastModified" timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT plant_waste_methods_pkey PRIMARY KEY (id)
);
CREATE INDEX plant_waste_methods_facility_id_index ON public.plant_waste_methods USING btree (facility_id);
CREATE INDEX plant_waste_methods_metrc_id_index ON public.plant_waste_methods USING btree (metrc_id);


-- public.plant_waste_reasons definition

-- Drop table

-- DROP TABLE public.plant_waste_reasons;

CREATE TABLE public.plant_waste_reasons (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"Name" varchar(255) NOT NULL,
	"RequiresNote" bool DEFAULT false NOT NULL,
	"RequiresWasteWeight" bool DEFAULT false NOT NULL,
	"RequiresImmatureWasteWeight" bool DEFAULT false NOT NULL,
	"RequiresMatureWasteWeight" bool DEFAULT false NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT plant_waste_reasons_pkey PRIMARY KEY (id)
);
CREATE INDEX plant_waste_reasons_facility_id_index ON public.plant_waste_reasons USING btree (facility_id);
CREATE INDEX plant_waste_reasons_metrc_id_index ON public.plant_waste_reasons USING btree (metrc_id);


-- public.processing_weight_record_package_tags definition

-- Drop table

-- DROP TABLE public.processing_weight_record_package_tags;

CREATE TABLE public.processing_weight_record_package_tags (
	id bigserial NOT NULL,
	processing_weight_record_id int8 NOT NULL,
	package_id int8 NOT NULL,
	"type" varchar(255) NOT NULL,
	"label" varchar(255) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT processing_weight_record_package_tags_pkey PRIMARY KEY (id)
);


-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
	id bigserial NOT NULL,
	"name" varchar(255) NOT NULL,
	system_name varchar(255) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT roles_name_unique UNIQUE (name),
	CONSTRAINT roles_pkey PRIMARY KEY (id)
);


-- public.sessions definition

-- Drop table

-- DROP TABLE public.sessions;

CREATE TABLE public.sessions (
	id varchar(255) NOT NULL,
	user_id int8 NULL,
	ip_address varchar(45) NULL,
	user_agent text NULL,
	payload text NOT NULL,
	last_activity int4 NOT NULL,
	CONSTRAINT sessions_pkey PRIMARY KEY (id)
);
CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


-- public.statuses definition

-- Drop table

-- DROP TABLE public.statuses;

CREATE TABLE public.statuses (
	id bigserial NOT NULL,
	"name" varchar(255) NOT NULL,
	system_name varchar(255) NOT NULL,
	"type" varchar(255) NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT statuses_pkey PRIMARY KEY (id)
);


-- public.tags definition

-- Drop table

-- DROP TABLE public.tags;

CREATE TABLE public.tags (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"type" varchar(255) NOT NULL,
	"TagTypeName" varchar(255) NOT NULL,
	"GroupTagTypeId" varchar(255) NULL,
	"GroupTagTypeName" varchar(255) NULL,
	"MaxGroupSize" int4 NULL,
	"FacilityId" int4 NULL,
	"Label" varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT tags_pkey PRIMARY KEY (id)
);
CREATE INDEX tags_facility_id_index ON public.tags USING btree (facility_id);
CREATE INDEX tags_label_index ON public.tags USING btree ("Label");
CREATE INDEX tags_metrc_id_index ON public.tags USING btree (metrc_id);


-- public.telescope_entries definition

-- Drop table

-- DROP TABLE public.telescope_entries;

CREATE TABLE public.telescope_entries (
	"sequence" bigserial NOT NULL,
	"uuid" uuid NOT NULL,
	batch_id uuid NOT NULL,
	family_hash varchar(255) NULL,
	should_display_on_index bool DEFAULT true NOT NULL,
	"type" varchar(20) NOT NULL,
	"content" text NOT NULL,
	created_at timestamp(0) NULL,
	CONSTRAINT telescope_entries_pkey PRIMARY KEY (sequence),
	CONSTRAINT telescope_entries_uuid_unique UNIQUE (uuid)
);
CREATE INDEX telescope_entries_batch_id_index ON public.telescope_entries USING btree (batch_id);
CREATE INDEX telescope_entries_created_at_index ON public.telescope_entries USING btree (created_at);
CREATE INDEX telescope_entries_family_hash_index ON public.telescope_entries USING btree (family_hash);
CREATE INDEX telescope_entries_type_should_display_on_index_index ON public.telescope_entries USING btree (type, should_display_on_index);


-- public.telescope_monitoring definition

-- Drop table

-- DROP TABLE public.telescope_monitoring;

CREATE TABLE public.telescope_monitoring (
	tag varchar(255) NOT NULL
);


-- public.transfers definition

-- Drop table

-- DROP TABLE public.transfers;

CREATE TABLE public.transfers (
	id bigserial NOT NULL,
	status_id int8 NULL,
	facility_id int8 NULL,
	metrc_id int8 NULL,
	"ManifestNumber" varchar(255) NULL,
	"ShipmentLicenseType" varchar(255) NULL,
	"ShipperFacilityLicenseNumber" varchar(255) NULL,
	"ShipperFacilityName" varchar(255) NULL,
	"Name" varchar(255) NULL,
	"TransporterFacilityLicenseNumber" varchar(255) NULL,
	"TransporterFacilityName" varchar(255) NULL,
	"DriverName" varchar(255) NULL,
	"DriverOccupationalLicenseNumber" varchar(255) NULL,
	"DriverVehicleLicenseNumber" varchar(255) NULL,
	"VehicleMake" varchar(255) NULL,
	"VehicleModel" varchar(255) NULL,
	"VehicleLicensePlateNumber" varchar(255) NULL,
	"CreatedByUserName" varchar(255) NULL,
	"RecipientFacilityLicenseNumber" varchar(255) NULL,
	"RecipientFacilityName" varchar(255) NULL,
	"ShipmentTypeName" varchar(255) NULL,
	"ShipmentTransactionType" varchar(255) NULL,
	"DeliveryId" int4 NULL,
	"DeliveryCount" int4 NULL,
	"ReceivedDeliveryCount" int4 NULL,
	"PackageCount" int4 NULL,
	"ReceivedPackageCount" int4 NULL,
	"DeliveryPackageCount" int4 NULL,
	"DeliveryReceivedPackageCount" int4 NULL,
	"ContainsPlantPackage" bool DEFAULT false NOT NULL,
	"ContainsProductPackage" bool DEFAULT false NOT NULL,
	"ContainsTradeSample" bool DEFAULT false NOT NULL,
	"ContainsDonation" bool DEFAULT false NOT NULL,
	"ContainsTestingSample" bool DEFAULT false NOT NULL,
	"ContainsProductRequiresRemediation" bool DEFAULT false NOT NULL,
	"ContainsRemediatedProductPackage" bool DEFAULT false NOT NULL,
	"CreatedDateTime" timestamp(0) NULL,
	"LastModified" timestamp(0) NULL,
	"EstimatedDepartureDateTime" timestamp(0) NULL,
	"ActualDepartureDateTime" timestamp(0) NULL,
	"EstimatedArrivalDateTime" timestamp(0) NULL,
	"ActualArrivalDateTime" timestamp(0) NULL,
	"ReceivedDateTime" timestamp(0) NULL,
	"EstimatedReturnDepartureDateTime" timestamp(0) NULL,
	"ActualReturnDepartureDateTime" timestamp(0) NULL,
	"EstimatedReturnArrivalDateTime" timestamp(0) NULL,
	"ActualReturnArrivalDateTime" timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT transfers_pkey PRIMARY KEY (id)
);
CREATE INDEX transfers_facility_id_index ON public.transfers USING btree (facility_id);
CREATE INDEX transfers_metrc_id_index ON public.transfers USING btree (metrc_id);
CREATE INDEX transfers_status_id_index ON public.transfers USING btree (status_id);


-- public.unassigned_facilities definition

-- Drop table

-- DROP TABLE public.unassigned_facilities;

CREATE TABLE public.unassigned_facilities (
	id bigserial NOT NULL,
	record_id int8 NOT NULL,
	"licenseNumber" varchar(255) NOT NULL,
	"licenseStatus" varchar(255) NOT NULL,
	"licenseStatusDate" date NULL,
	"licenseTerm" varchar(255) NOT NULL,
	"licenseType" varchar(255) NOT NULL,
	"licenseDesignation" varchar(255) NOT NULL,
	"issueDate" date NOT NULL,
	"expirationDate" date NOT NULL,
	"licensingAuthorityId" varchar(255) NOT NULL,
	"licensingAuthority" varchar(255) NOT NULL,
	"businessLegalName" varchar(255) NOT NULL,
	"businessDbaName" varchar(255) NOT NULL,
	"businessOwnerName" text NOT NULL,
	"businessStructure" varchar(255) NOT NULL,
	activity varchar(255) NOT NULL,
	"premiseStreetAddress" varchar(255) NOT NULL,
	"premiseCity" varchar(255) NOT NULL,
	"premiseState" varchar(255) NOT NULL,
	"premiseCounty" varchar(255) NOT NULL,
	"premiseZipCode" varchar(255) NOT NULL,
	"businessEmail" varchar(255) NOT NULL,
	"businessPhone" varchar(255) NOT NULL,
	"parcelNumber" varchar(255) NOT NULL,
	"premiseLatitude" float8 NULL,
	"premiseLongitude" float8 NULL,
	"dataRefreshedDate" timestamp(0) NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT unassigned_facilities_licensenumber_unique UNIQUE ("licenseNumber"),
	CONSTRAINT unassigned_facilities_pkey PRIMARY KEY (id)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	id bigserial NOT NULL,
	"name" varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	email_verified_at timestamp(0) NULL,
	"password" varchar(255) NOT NULL,
	metrc_user_key varchar(255) NULL,
	weight_display varchar(255) NULL,
	last_chosen_facility varchar(255) NULL,
	remember_token varchar(100) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT users_email_unique UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (id)
);


-- public.vehicles definition

-- Drop table

-- DROP TABLE public.vehicles;

CREATE TABLE public.vehicles (
	id bigserial NOT NULL,
	metrc_id int8 NULL,
	"FacilityId" int8 NULL,
	"Make" varchar(255) NOT NULL,
	"Model" varchar(255) NOT NULL,
	"LicensePlateNumber" varchar(255) NOT NULL,
	"IsArchived" bool DEFAULT false NOT NULL,
	"LastModified" timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT vehicles_pkey PRIMARY KEY (id)
);


-- public.weight_record_batches definition

-- Drop table

-- DROP TABLE public.weight_record_batches;

CREATE TABLE public.weight_record_batches (
	id bigserial NOT NULL,
	client varchar(255) NOT NULL,
	plant_tags json NOT NULL,
	harvest_batch_id varchar(255) NOT NULL,
	item_type varchar(255) NOT NULL,
	license_id varchar(255) NOT NULL,
	max_tote int4 NOT NULL,
	metrc_manifest varchar(255) NULL,
	min_tote int4 NOT NULL,
	package_tag_id varchar(255) NOT NULL,
	plant_average numeric(15, 4) NOT NULL,
	plant_count_total int4 NOT NULL,
	record_date date NOT NULL,
	scale_id varchar(255) NOT NULL,
	strain_name varchar(255) NOT NULL,
	tote_count int4 NOT NULL,
	unit_of_measure varchar(255) NOT NULL,
	weight_total numeric(15, 2) NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	client_id int8 NULL,
	CONSTRAINT weight_record_batches_pkey PRIMARY KEY (id)
);
CREATE INDEX weight_record_batches_client_index ON public.weight_record_batches USING btree (client);
CREATE INDEX weight_record_batches_harvest_batch_id_index ON public.weight_record_batches USING btree (harvest_batch_id);
CREATE INDEX weight_record_batches_license_id_index ON public.weight_record_batches USING btree (license_id);
CREATE INDEX weight_record_batches_package_tag_id_index ON public.weight_record_batches USING btree (package_tag_id);
CREATE INDEX weight_record_batches_scale_id_index ON public.weight_record_batches USING btree (scale_id);
CREATE INDEX weight_record_batches_strain_name_index ON public.weight_record_batches USING btree (strain_name);


-- public.chain_of_custodies definition

-- Drop table

-- DROP TABLE public.chain_of_custodies;

CREATE TABLE public.chain_of_custodies (
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	"action" varchar(255) NOT NULL,
	description text NULL,
	payload json NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	metrc_id int8 NULL,
	"type" varchar(255) NULL,
	exception_message text NULL,
	CONSTRAINT chain_of_custodies_pkey PRIMARY KEY (id),
	CONSTRAINT chain_of_custodies_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE
);
CREATE INDEX chain_of_custodies_metrc_id_index ON public.chain_of_custodies USING btree (metrc_id);
CREATE INDEX chain_of_custodies_type_index ON public.chain_of_custodies USING btree (type);


-- public.clients definition

-- Drop table

-- DROP TABLE public.clients;

CREATE TABLE public.clients (
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	mailing_address varchar(255) NULL,
	email_address varchar(255) NULL,
	billing_address varchar(255) NULL,
	phone_number varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT clients_name_unique UNIQUE (name),
	CONSTRAINT clients_pkey PRIMARY KEY (id),
	CONSTRAINT clients_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE
);


-- public.companies definition

-- Drop table

-- DROP TABLE public.companies;

CREATE TABLE public.companies (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	business_legal_name varchar(255) NOT NULL,
	mailing_address varchar(255) NULL,
	billing_address varchar(255) NULL,
	contact_person varchar(255) NULL,
	phone_number varchar(255) NULL,
	email_address varchar(255) NULL,
	business_dba_name varchar(255) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	metrc_api_vendor_key varchar(255) NULL,
	CONSTRAINT companies_business_legal_name_unique UNIQUE (business_legal_name),
	CONSTRAINT companies_pkey PRIMARY KEY (id),
	CONSTRAINT companies_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE CASCADE
);


-- public.employee_licenses definition

-- Drop table

-- DROP TABLE public.employee_licenses;

CREATE TABLE public.employee_licenses (
	id bigserial NOT NULL,
	employee_id int8 NOT NULL,
	"Number" varchar(255) NOT NULL,
	"StartDate" timestamp(0) NULL,
	"EndDate" timestamp(0) NULL,
	"LicenseType" varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT employee_licenses_pkey PRIMARY KEY (id),
	CONSTRAINT employee_licenses_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE SET NULL
);


-- public.operations definition

-- Drop table

-- DROP TABLE public.operations;

CREATE TABLE public.operations (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	abbreviation varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT operations_name_unique UNIQUE (name),
	CONSTRAINT operations_pkey PRIMARY KEY (id),
	CONSTRAINT operations_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE CASCADE
);


-- public.package_items definition

-- Drop table

-- DROP TABLE public.package_items;

CREATE TABLE public.package_items (
	id bigserial NOT NULL,
	package_id int8 NOT NULL,
	metrc_id int8 NULL,
	"Name" varchar(255) NOT NULL,
	"ProductCategoryName" varchar(255) NULL,
	"ProductCategoryType" varchar(255) NULL,
	"IsExpirationDateRequired" bool DEFAULT false NOT NULL,
	"IsSellByDateRequired" bool DEFAULT false NOT NULL,
	"IsUseByDateRequired" bool DEFAULT false NOT NULL,
	"QuantityType" varchar(255) NULL,
	"DefaultLabTestingState" varchar(255) NULL,
	"UnitOfMeasureName" varchar(255) NULL,
	"ApprovalStatus" varchar(255) NULL,
	"ApprovalStatusDateTime" timestamp(0) NULL,
	"StrainId" int4 NULL,
	"StrainName" varchar(255) NULL,
	"ItemBrandId" int4 NULL,
	"ItemBrandName" varchar(255) NULL,
	"AdministrationMethod" varchar(255) NULL,
	"UnitCbdPercent" varchar(255) NULL,
	"UnitCbdContent" varchar(255) NULL,
	"UnitCbdContentUnitOfMeasureName" varchar(255) NULL,
	"UnitCbdContentDose" varchar(255) NULL,
	"UnitCbdContentDoseUnitOfMeasureName" varchar(255) NULL,
	"UnitThcPercent" varchar(255) NULL,
	"UnitThcContent" varchar(255) NULL,
	"UnitThcContentUnitOfMeasureName" varchar(255) NULL,
	"UnitThcContentDose" varchar(255) NULL,
	"UnitThcContentDoseUnitOfMeasureName" varchar(255) NULL,
	"UnitVolume" varchar(255) NULL,
	"UnitVolumeUnitOfMeasureName" varchar(255) NULL,
	"UnitWeight" varchar(255) NULL,
	"UnitWeightUnitOfMeasureName" varchar(255) NULL,
	"ServingSize" varchar(255) NULL,
	"SupplyDurationDays" varchar(255) NULL,
	"NumberOfDoses" varchar(255) NULL,
	"UnitQuantity" varchar(255) NULL,
	"UnitQuantityUnitOfMeasureName" varchar(255) NULL,
	"PublicIngredients" varchar(255) NULL,
	"Description" text NULL,
	"ProductImages" json NULL,
	"LabelImages" json NULL,
	"PackagingImages" json NULL,
	"IsUsed" bool DEFAULT false NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT package_items_pkey PRIMARY KEY (id),
	CONSTRAINT package_items_package_id_foreign FOREIGN KEY (package_id) REFERENCES public.packages(id)
);
CREATE INDEX package_items_metrc_id_index ON public.package_items USING btree (metrc_id);


-- public.people definition

-- Drop table

-- DROP TABLE public.people;

CREATE TABLE public.people (
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	first_name varchar(255) NULL,
	last_name varchar(255) NULL,
	phone_number varchar(255) NULL,
	mobile_number varchar(255) NULL,
	mailing_street_address varchar(255) NULL,
	mailing_street_address_2 varchar(255) NULL,
	mailing_city varchar(255) NULL,
	email_address varchar(255) NULL,
	notes text NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT people_pkey PRIMARY KEY (id),
	CONSTRAINT people_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE
);


-- public.telescope_entries_tags definition

-- Drop table

-- DROP TABLE public.telescope_entries_tags;

CREATE TABLE public.telescope_entries_tags (
	entry_uuid uuid NOT NULL,
	tag varchar(255) NOT NULL,
	CONSTRAINT telescope_entries_tags_entry_uuid_foreign FOREIGN KEY (entry_uuid) REFERENCES public.telescope_entries("uuid") ON DELETE CASCADE
);
CREATE INDEX telescope_entries_tags_entry_uuid_tag_index ON public.telescope_entries_tags USING btree (entry_uuid, tag);
CREATE INDEX telescope_entries_tags_tag_index ON public.telescope_entries_tags USING btree (tag);


-- public.user_actions definition

-- Drop table

-- DROP TABLE public.user_actions;

CREATE TABLE public.user_actions (
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	"action" varchar(255) NOT NULL,
	description varchar(255) NULL,
	table_name varchar(255) NOT NULL,
	table_id int8 NULL,
	payload json NOT NULL,
	response json NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT user_actions_pkey PRIMARY KEY (id),
	CONSTRAINT user_actions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id)
);
CREATE INDEX user_actions_action_index ON public.user_actions USING btree (action);


-- public.user_roles definition

-- Drop table

-- DROP TABLE public.user_roles;

CREATE TABLE public.user_roles (
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	role_id int8 NOT NULL,
	client_id int8 NULL,
	operation_id int8 NULL,
	facility_id int8 NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT user_roles_pkey PRIMARY KEY (id),
	CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE SET NULL,
	CONSTRAINT user_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE
);
CREATE INDEX user_roles_client_id_index ON public.user_roles USING btree (client_id);
CREATE INDEX user_roles_facility_id_index ON public.user_roles USING btree (facility_id);
CREATE INDEX user_roles_operation_id_index ON public.user_roles USING btree (operation_id);


-- public.client_operation_devices definition

-- Drop table

-- DROP TABLE public.client_operation_devices;

CREATE TABLE public.client_operation_devices (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	operation_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	system_name varchar(255) NOT NULL,
	status bool DEFAULT false NOT NULL,
	ca text NULL,
	"key" text NULL,
	cert text NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	user_id int8 NULL,
	access_generated bool DEFAULT false NOT NULL,
	CONSTRAINT client_operation_devices_name_unique UNIQUE (name),
	CONSTRAINT client_operation_devices_pkey PRIMARY KEY (id),
	CONSTRAINT client_operation_devices_system_name_unique UNIQUE (system_name),
	CONSTRAINT client_operation_devices_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE CASCADE,
	CONSTRAINT client_operation_devices_operation_id_foreign FOREIGN KEY (operation_id) REFERENCES public.operations(id) ON DELETE CASCADE
);
CREATE INDEX client_operation_devices_user_id_index ON public.client_operation_devices USING btree (user_id);


-- public.facilities definition

-- Drop table

-- DROP TABLE public.facilities;

CREATE TABLE public.facilities (
	id bigserial NOT NULL,
	company_id int8 NOT NULL,
	operation_id int8 NOT NULL,
	license_type_id int8 NULL,
	"name" varchar(255) NOT NULL,
	license_status_date timestamp(0) NULL,
	facility_area_json json NULL,
	issued_date timestamp(0) NULL,
	expiration_date timestamp(0) NULL,
	premises_latitude varchar(255) NULL,
	premises_longitude varchar(255) NULL,
	parcel_number varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	active bool DEFAULT false NOT NULL,
	expired bool DEFAULT false NOT NULL,
	CONSTRAINT facilities_name_unique UNIQUE (name),
	CONSTRAINT facilities_pkey PRIMARY KEY (id),
	CONSTRAINT facilities_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id) ON DELETE CASCADE,
	CONSTRAINT facilities_operation_id_foreign FOREIGN KEY (operation_id) REFERENCES public.operations(id) ON DELETE CASCADE
);
CREATE INDEX facilities_license_type_id_index ON public.facilities USING btree (license_type_id);


-- public.facility_types definition

-- Drop table

-- DROP TABLE public.facility_types;

CREATE TABLE public.facility_types (
	id bigserial NOT NULL,
	facility_id int8 NOT NULL,
	is_medical bool DEFAULT false NOT NULL,
	is_retail bool DEFAULT false NOT NULL,
	is_hemp bool DEFAULT false NOT NULL,
	can_take_plant_batches_on_trip bool DEFAULT false NOT NULL,
	can_take_plants_on_trip bool DEFAULT false NOT NULL,
	can_take_harvests_on_trip bool DEFAULT false NOT NULL,
	can_take_packages_on_trip bool DEFAULT false NOT NULL,
	can_sell_from_packages_on_trip bool DEFAULT false NOT NULL,
	advanced_sales bool DEFAULT false NOT NULL,
	sales_require_patient_number bool DEFAULT false NOT NULL,
	sales_require_external_patient_number bool DEFAULT false NOT NULL,
	sales_require_external_patient_identification_method bool DEFAULT false NOT NULL,
	sales_require_caregiver_number bool DEFAULT false NOT NULL,
	sales_require_caregiver_patient_number bool DEFAULT false NOT NULL,
	can_deliver_sales_to_consumers bool DEFAULT false NOT NULL,
	sales_delivery_allow_planned_route bool DEFAULT false NOT NULL,
	sales_delivery_allow_address bool DEFAULT false NOT NULL,
	sales_delivery_allow_city bool DEFAULT false NOT NULL,
	sales_delivery_allow_state bool DEFAULT false NOT NULL,
	sales_delivery_allow_county bool DEFAULT false NOT NULL,
	sales_delivery_allow_zip bool DEFAULT false NOT NULL,
	sales_delivery_require_consumer_id bool DEFAULT false NOT NULL,
	can_deliver_sales_to_patients bool DEFAULT false NOT NULL,
	sales_delivery_require_patient_number bool DEFAULT false NOT NULL,
	sales_delivery_require_recipient_name bool DEFAULT false NOT NULL,
	is_sales_delivery_hub bool DEFAULT false NOT NULL,
	can_have_member_patients bool DEFAULT false NOT NULL,
	can_report_patient_check_ins bool DEFAULT false NOT NULL,
	can_specify_patient_sales_limit_exemption bool DEFAULT false NOT NULL,
	can_report_patients_adverse_responses bool DEFAULT false NOT NULL,
	retailer_delivery bool DEFAULT false NOT NULL,
	retailer_delivery_allow_trade_samples bool DEFAULT false NOT NULL,
	retailer_delivery_allow_donations bool DEFAULT false NOT NULL,
	retailer_delivery_require_price bool DEFAULT false NOT NULL,
	retailer_delivery_allow_partial_packages bool DEFAULT false NOT NULL,
	can_create_partial_packages bool DEFAULT false NOT NULL,
	can_adjust_source_packages_with_partials bool DEFAULT false NOT NULL,
	can_report_operational_exceptions bool DEFAULT false NOT NULL,
	can_report_adulteration bool DEFAULT false NOT NULL,
	can_grow_plants bool DEFAULT false NOT NULL,
	can_create_opening_balance_plant_batches bool DEFAULT false NOT NULL,
	can_clone_plant_batches bool DEFAULT false NOT NULL,
	can_assign_locations_to_plant_batches bool DEFAULT false NOT NULL,
	plants_require_patient_affiliation bool DEFAULT false NOT NULL,
	plant_batches_can_contain_mother_plants bool DEFAULT false NOT NULL,
	can_update_plant_strains bool DEFAULT false NOT NULL,
	can_track_vegetative_plants bool DEFAULT false NOT NULL,
	can_create_immature_plant_packages_from_plants bool DEFAULT false NOT NULL,
	can_package_vegetative_plants bool DEFAULT false NOT NULL,
	can_package_waste bool DEFAULT false NOT NULL,
	can_report_harvest_schedules bool DEFAULT false NOT NULL,
	can_submit_harvests_for_testing bool DEFAULT false NOT NULL,
	can_require_harvest_sample_lab_test_batches bool DEFAULT false NOT NULL,
	can_report_strain_properties bool DEFAULT false NOT NULL,
	can_create_opening_balance_packages bool DEFAULT false NOT NULL,
	can_create_derived_packages bool DEFAULT false NOT NULL,
	can_assign_locations_to_packages bool DEFAULT false NOT NULL,
	can_update_locations_on_packages bool DEFAULT false NOT NULL,
	packages_require_patient_affiliation bool DEFAULT false NOT NULL,
	can_create_trade_sample_packages bool DEFAULT false NOT NULL,
	can_donate_packages bool DEFAULT false NOT NULL,
	can_submit_packages_for_testing bool DEFAULT false NOT NULL,
	can_create_process_validation_packages bool DEFAULT false NOT NULL,
	can_require_package_sample_lab_test_batches bool DEFAULT false NOT NULL,
	can_request_product_remediation bool DEFAULT false NOT NULL,
	can_remediate_packages_with_failed_lab_results bool DEFAULT false NOT NULL,
	can_infuse_products bool DEFAULT false NOT NULL,
	can_record_processing_jobs bool DEFAULT false NOT NULL,
	can_record_product_for_destruction bool DEFAULT false NOT NULL,
	can_destroy_product bool DEFAULT false NOT NULL,
	can_test_packages bool DEFAULT false NOT NULL,
	tests_require_lab_sample bool DEFAULT false NOT NULL,
	can_transfer_from_external_facilities bool DEFAULT false NOT NULL,
	can_sell_to_consumers bool DEFAULT false NOT NULL,
	can_sell_to_patients bool DEFAULT false NOT NULL,
	can_sell_to_external_patients bool DEFAULT false NOT NULL,
	can_sell_to_caregivers bool DEFAULT false NOT NULL,
	restrict_harvest_plant_restore_time_hours int4 NULL,
	total_member_patients_allowed int4 NULL,
	restrict_wholesale_price_edit_days int4 NULL,
	restrict_plant_batch_adjustment_time_hours int4 NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT facility_types_pkey PRIMARY KEY (id),
	CONSTRAINT facility_types_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id) ON DELETE CASCADE
);


-- public.item_categories definition

-- Drop table

-- DROP TABLE public.item_categories;

CREATE TABLE public.item_categories (
	id bigserial NOT NULL,
	facility_id int8 NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"Name" varchar(255) NOT NULL,
	"ProductCategoryType" varchar(255) NOT NULL,
	"QuantityType" varchar(255) NOT NULL,
	"RequiresStrain" bool DEFAULT false NOT NULL,
	"RequiresItemBrand" bool DEFAULT false NOT NULL,
	"RequiresAdministrationMethod" bool DEFAULT false NOT NULL,
	"RequiresUnitCbdPercent" bool DEFAULT false NOT NULL,
	"RequiresUnitCbdContent" bool DEFAULT false NOT NULL,
	"RequiresUnitCbdContentDose" bool DEFAULT false NOT NULL,
	"RequiresUnitThcPercent" bool DEFAULT false NOT NULL,
	"RequiresUnitThcContent" bool DEFAULT false NOT NULL,
	"RequiresUnitThcContentDose" bool DEFAULT false NOT NULL,
	"RequiresUnitVolume" bool DEFAULT false NOT NULL,
	"RequiresUnitWeight" bool DEFAULT false NOT NULL,
	"RequiresServingSize" bool DEFAULT false NOT NULL,
	"RequiresSupplyDurationDays" bool DEFAULT false NOT NULL,
	"RequiresNumberOfDoses" bool DEFAULT false NOT NULL,
	"RequiresPublicIngredients" bool DEFAULT false NOT NULL,
	"RequiresDescription" bool DEFAULT false NOT NULL,
	"RequiresProductPhotos" int4 NOT NULL,
	"RequiresLabelPhotos" int4 NOT NULL,
	"RequiresPackagingPhotos" int4 NOT NULL,
	"CanContainSeeds" bool DEFAULT false NOT NULL,
	"CanBeRemediated" bool DEFAULT false NOT NULL,
	"CanBeDestroyed" bool DEFAULT false NOT NULL,
	item_type_abbreviation varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT item_categories_pkey PRIMARY KEY (id),
	CONSTRAINT item_categories_fk FOREIGN KEY (facility_id) REFERENCES public.facilities(id)
);
CREATE INDEX item_categories_facility_id_index ON public.item_categories USING btree (facility_id);
CREATE INDEX item_categories_metrc_id_index ON public.item_categories USING btree (metrc_id);


-- public.locations definition

-- Drop table

-- DROP TABLE public.locations;

CREATE TABLE public.locations (
	id bigserial NOT NULL,
	facility_id int8 NOT NULL,
	client_id int8 NOT NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"name" varchar(255) NOT NULL,
	"LocationTypeId" int8 NULL,
	"LocationTypeName" varchar(255) NULL,
	"ForPlantBatches" bool DEFAULT false NOT NULL,
	"ForPlants" bool DEFAULT false NOT NULL,
	"ForHarvests" bool DEFAULT false NOT NULL,
	"ForPackages" bool DEFAULT false NOT NULL,
	location_abbreviation varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT locations_pkey PRIMARY KEY (id),
	CONSTRAINT locations_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id),
	CONSTRAINT locations_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id)
);
CREATE INDEX locations_name_index ON public.locations USING btree (name);
CREATE INDEX locations_status_id_index ON public.locations USING btree (status_id);


-- public.plants definition

-- Drop table

-- DROP TABLE public.plants;

CREATE TABLE public.plants (
	id bigserial NOT NULL,
	facility_id int8 NOT NULL,
	status_id int8 NOT NULL,
	metrc_id int8 NOT NULL,
	"Label" varchar(255) NULL,
	"State" varchar(255) NULL,
	"GrowthPase" varchar(255) NULL,
	"GroupTagTypeMax" int4 NULL,
	"PlantBatchId" int4 NULL,
	"PlantBatchName" varchar(255) NULL,
	"PlantBatchTypeName" varchar(255) NULL,
	"StrainId" int4 NULL,
	"StrainName" varchar(255) NULL,
	"LocationId" int4 NULL,
	"LocationName" varchar(255) NULL,
	"LocationTypeName" varchar(255) NULL,
	"PatientLicenseNumber" varchar(255) NULL,
	"HarvestId" int4 NULL,
	"HarvestedUnitOfWeightName" varchar(255) NULL,
	"HarvestedUnitOfWeightAbbreviation" varchar(255) NULL,
	"HarvestedWetWeight" varchar(255) NULL,
	"HarvestCount" int4 NULL,
	"IsOnHold" bool DEFAULT false NOT NULL,
	"IsOnTrip" bool DEFAULT false NOT NULL,
	"PlantedDate" date NULL,
	"VegetativeDate" date NULL,
	"FloweringDate" date NULL,
	"HarvestedDate" date NULL,
	"DestroyedDate" date NULL,
	"DestroyedNote" text NULL,
	"DestroyedByUserName" varchar(255) NULL,
	"LastModified" timestamp(0) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT plants_pkey PRIMARY KEY (id),
	CONSTRAINT plants_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id)
);
CREATE INDEX plants_status_id_index ON public.plants USING btree (status_id);


-- public.strains definition

-- Drop table

-- DROP TABLE public.strains;

CREATE TABLE public.strains (
	id bigserial NOT NULL,
	facility_id int8 NOT NULL,
	status_id int8 NULL,
	metrc_id int8 NULL,
	"Name" varchar(255) NULL,
	"TestingStatus" varchar(255) NULL,
	"ThcLevel" varchar(255) NULL,
	"CbdLevel" varchar(255) NULL,
	"IndicaPercentage" float8 NULL,
	"SativaPercentage" float8 NULL,
	"IsUsed" bool DEFAULT false NOT NULL,
	"Genetics" varchar(255) NULL,
	strain_abbreviation varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT strains_facility_id_name_unique UNIQUE (facility_id, "Name"),
	CONSTRAINT strains_pkey PRIMARY KEY (id),
	CONSTRAINT strains_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id)
);
CREATE INDEX strains_metrc_id_index ON public.strains USING btree (metrc_id);
CREATE INDEX strains_status_id_index ON public.strains USING btree (status_id);


-- public.weight_records definition

-- Drop table

-- DROP TABLE public.weight_records;

CREATE TABLE public.weight_records (
	id bigserial NOT NULL,
	client varchar(255) NOT NULL,
	client_operation_device_id int8 NOT NULL,
	scale_id varchar(255) NOT NULL,
	license int4 NOT NULL,
	license_id varchar(255) NOT NULL,
	facility_id int8 NOT NULL,
	location_id int8 NULL,
	package_tag_id varchar(255) NOT NULL,
	harvest_batch_id varchar(255) NOT NULL,
	strain_name varchar(255) NOT NULL,
	strain_id int8 NULL,
	item_type varchar(255) NOT NULL,
	item_category_id int8 NOT NULL,
	tote_number int4 NULL,
	sync_receipt bool NULL,
	weight_value float8 NOT NULL,
	unit_of_measure varchar(255) NOT NULL,
	entry_timestamp timestamp(0) NOT NULL,
	first_plant_tag varchar(255) NULL,
	last_plant_tag varchar(255) NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	plant_count int4 DEFAULT 1 NOT NULL,
	metrc_manifest varchar(255) NULL,
	plant_tags json NULL,
	weight_record_batch_id int8 NULL,
	CONSTRAINT weight_records_pkey PRIMARY KEY (id),
	CONSTRAINT weight_records_client_operation_device_id_foreign FOREIGN KEY (client_operation_device_id) REFERENCES public.client_operation_devices(id),
	CONSTRAINT weight_records_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id),
	CONSTRAINT weight_records_fk FOREIGN KEY (scale_id) REFERENCES public.client_operation_devices(system_name),
	CONSTRAINT weight_records_item_category_id_foreign FOREIGN KEY (item_category_id) REFERENCES public.item_categories(id),
	CONSTRAINT weight_records_location_id_foreign FOREIGN KEY (location_id) REFERENCES public.locations(id),
	CONSTRAINT weight_records_strain_id_foreign FOREIGN KEY (strain_id) REFERENCES public.strains(id),
	CONSTRAINT weight_records_weight_record_batch_id_foreign FOREIGN KEY (weight_record_batch_id) REFERENCES public.weight_record_batches(id)
);
CREATE INDEX weight_records_client_index ON public.weight_records USING btree (client);
CREATE INDEX weight_records_client_operation_device_id_index ON public.weight_records USING btree (client_operation_device_id);
CREATE INDEX weight_records_first_plant_tag_index ON public.weight_records USING btree (first_plant_tag);
CREATE INDEX weight_records_harvest_batch_id_index ON public.weight_records USING btree (harvest_batch_id);
CREATE INDEX weight_records_last_plant_tag_index ON public.weight_records USING btree (last_plant_tag);
CREATE INDEX weight_records_license_id_index ON public.weight_records USING btree (license_id);
CREATE INDEX weight_records_package_tag_id_index ON public.weight_records USING btree (package_tag_id);
CREATE INDEX weight_records_scale_id_index ON public.weight_records USING btree (scale_id);
CREATE INDEX weight_records_strain_name_index ON public.weight_records USING btree (strain_name);
CREATE INDEX weight_records_weight_record_batch_id_index ON public.weight_records USING btree (weight_record_batch_id);


-- public.processing_weight_record_batches definition

-- Drop table

-- DROP TABLE public.processing_weight_record_batches;

CREATE TABLE public.processing_weight_record_batches (
	id bigserial NOT NULL,
	metrc_manifest varchar(255) NULL,
	client varchar(255) NOT NULL,
	source_package_tag varchar(255) NULL,
	new_package_tag varchar(255) NULL,
	harvest_batch_id varchar(255) NOT NULL,
	scale_id varchar(255) NOT NULL,
	client_operation_device_id int8 NOT NULL,
	strain_name varchar(255) NOT NULL,
	strain_id int8 NULL,
	item_type varchar(255) NOT NULL,
	item_category_id int8 NOT NULL,
	license int4 NOT NULL,
	license_id varchar(255) NOT NULL,
	facility_id int8 NOT NULL,
	location_id int8 NULL,
	tote_count int4 NULL,
	plant_count int4 DEFAULT 1 NOT NULL,
	sync_receipt bool NULL,
	weight_total float8 NOT NULL,
	unit_of_measure varchar(255) NOT NULL,
	record_date date NOT NULL,
	min_tote int4 NOT NULL,
	max_tote int4 NOT NULL,
	plant_average numeric(15, 2) NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT processing_weight_record_batches_pkey PRIMARY KEY (id),
	CONSTRAINT processing_weight_record_batches_client_operation_device_id_for FOREIGN KEY (client_operation_device_id) REFERENCES public.client_operation_devices(id),
	CONSTRAINT processing_weight_record_batches_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id),
	CONSTRAINT processing_weight_record_batches_item_category_id_foreign FOREIGN KEY (item_category_id) REFERENCES public.item_categories(id),
	CONSTRAINT processing_weight_record_batches_location_id_foreign FOREIGN KEY (location_id) REFERENCES public.locations(id),
	CONSTRAINT processing_weight_record_batches_scale_id_foreign FOREIGN KEY (scale_id) REFERENCES public.client_operation_devices(system_name),
	CONSTRAINT processing_weight_record_batches_strain_id_foreign FOREIGN KEY (strain_id) REFERENCES public.strains(id)
);
CREATE INDEX processing_weight_record_batches_harvest_batch_id_index ON public.processing_weight_record_batches USING btree (harvest_batch_id);


-- public.processing_weight_records definition

-- Drop table

-- DROP TABLE public.processing_weight_records;

CREATE TABLE public.processing_weight_records (
	id bigserial NOT NULL,
	metrc_manifest varchar(255) NULL,
	weight_record_id int8 NULL,
	client varchar(255) NOT NULL,
	source_package_tag varchar(255) NULL,
	new_package_tag varchar(255) NULL,
	harvest_batch_id varchar(255) NOT NULL,
	scale_id varchar(255) NOT NULL,
	client_operation_device_id int8 NOT NULL,
	strain_name varchar(255) NOT NULL,
	strain_id int8 NULL,
	item_type varchar(255) NOT NULL,
	item_category_id int8 NOT NULL,
	license int4 NOT NULL,
	license_id varchar(255) NOT NULL,
	facility_id int8 NOT NULL,
	location_id int8 NULL,
	tote_number int4 NULL,
	plant_count int4 DEFAULT 1 NOT NULL,
	sync_receipt bool NULL,
	weight_value float8 NOT NULL,
	unit_of_measure varchar(255) NOT NULL,
	entry_timestamp timestamp(0) NOT NULL,
	deleted_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	processing_weight_record_batch_id int8 NULL,
	CONSTRAINT processing_weight_records_pkey PRIMARY KEY (id),
	CONSTRAINT processing_weight_records_client_operation_device_id_foreign FOREIGN KEY (client_operation_device_id) REFERENCES public.client_operation_devices(id),
	CONSTRAINT processing_weight_records_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id),
	CONSTRAINT processing_weight_records_item_category_id_foreign FOREIGN KEY (item_category_id) REFERENCES public.item_categories(id),
	CONSTRAINT processing_weight_records_location_id_foreign FOREIGN KEY (location_id) REFERENCES public.locations(id),
	CONSTRAINT processing_weight_records_scale_id_foreign FOREIGN KEY (scale_id) REFERENCES public.client_operation_devices(system_name),
	CONSTRAINT processing_weight_records_strain_id_foreign FOREIGN KEY (strain_id) REFERENCES public.strains(id)
);
CREATE INDEX processing_weight_records_harvest_batch_id_index ON public.processing_weight_records USING btree (harvest_batch_id);


-- public.weight_record_logs definition

-- Drop table

-- DROP TABLE public.weight_record_logs;

CREATE TABLE public.weight_record_logs (
	id bigserial NOT NULL,
	weight_record_id int8 NOT NULL,
	user_id int8 NOT NULL,
	"action" varchar(255) NOT NULL,
	description varchar(255) NULL,
	fields json NULL,
	"from" json NULL,
	"to" json NOT NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT weight_record_logs_pkey PRIMARY KEY (id),
	CONSTRAINT weight_record_logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id),
	CONSTRAINT weight_record_logs_weight_record_id_foreign FOREIGN KEY (weight_record_id) REFERENCES public.weight_records(id)
);
CREATE INDEX weight_record_logs_action_index ON public.weight_record_logs USING btree (action);