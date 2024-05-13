-- JOIN tables 
CREATE OR REPLACE TABLE `hopeful-text-419519.uber_data_engineering.analytics_table` AS(
  SELECT 
  f. VendorID, 
  d.tpep_dropoff_datetime,
  d.tpep_pickup_datetime, 
  p.passenger_count, 
  t.trip_distance, 
  r.rate_code_name,
  pu.pickup_latitude, 
  pu.pickup_longitude,
  drp.dropoff_latitude,
  drp.dropoff_longitude, 
  pt.payment_type_name, 
  f.fare_amount, 
  f.extra, 
  f.tip_amount, 
  f.improvement_surcharge, 
  f.tolls_amount

  FROM

  `hopeful-text-419519.uber_data_engineering.fact_table` f
  JOIN 
  `hopeful-text-419519.uber_data_engineering.datetime_dim` d
  ON (f.datetime_id = d.datetime_id)

  JOIN 
  `hopeful-text-419519.uber_data_engineering.passenger_count_dim` p
  ON (f.passenger_count_id = p.passenger_count_id)

  JOIN 
  `hopeful-text-419519.uber_data_engineering.trip_distance_dim` t
  ON (t.trip_distance_id = f.trip_distance_id)

  JOIN 
  `hopeful-text-419519.uber_data_engineering.pickup_location_dim` pu
  ON (f.pickup_location_id = pu.pickup_location_id)

  JOIN 
  `hopeful-text-419519.uber_data_engineering.dropoff_location_dim` drp
  ON (drp.dropoff_location_id = f.dropoff_location_id)

  JOIN 
  `hopeful-text-419519.uber_data_engineering.rate_code_dim` r
  ON (r.rate_code_id = f.rate_code_id)

  JOIN `hopeful-text-419519.uber_data_engineering.payment_type_dim` pt
  ON (pt.payment_type_id = f.payment_type_id)

);
