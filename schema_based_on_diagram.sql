-- Add patients table

CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE
);

