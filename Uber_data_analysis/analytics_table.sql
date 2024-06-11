-- JOIN tables 
CREATE OR REPLACE TABLE `{project_name}.uber_data_engineering.analytics_table` AS(
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

  `datasetid.dataname.fact_table` f
  JOIN 
  `datasetid.dataname.datetime_dim` d
  ON (f.datetime_id = d.datetime_id)

  JOIN 
  `datasetid.dataname.passenger_count_dim` p
  ON (f.passenger_count_id = p.passenger_count_id)

  JOIN 
  `datasetid.dataname.trip_distance_dim` t
  ON (t.trip_distance_id = f.trip_distance_id)

  JOIN 
  `datasetid.dataname.pickup_location_dim` pu
  ON (f.pickup_location_id = pu.pickup_location_id)

  JOIN 
  `datasetid.dataname.dropoff_location_dim` drp
  ON (drp.dropoff_location_id = f.dropoff_location_id)

  JOIN 
  `datasetid.dataname.rate_code_dim` r
  ON (r.rate_code_id = f.rate_code_id)

  JOIN `datasetid.dataname.payment_type_dim` pt
  ON (pt.payment_type_id = f.payment_type_id)

);
