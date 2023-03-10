-- Add patients table

CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE
);

-- Add medical histories table

CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    FOREIGN KEY patient_id REFERENCES patients(id),
    status VARCHAR(100)
);


-- Add invoices table

CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY medical_history_id REFERENCES medical_histories(id)
 );


-- Create treatments table

CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(100)
 );

-- create join table

CREATE TABLE treatment_history (
    medical_history_id INT,
    treatment_id INT,
    FOREIGN KEY medical_history_id REFERENCES medical_histories(id),
    FOREIGN KEY treatment_id REFERENCES treatments(id)
);

-- create invoice items table

CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price INT,
    invoice_id INT,
    FOREIGN KEY invoice_id REFERENCES invoices(id),
    treatment_id INT,
    FOREIGN KEY treatment_id REFERENCES treatments(id)
)

CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);
CREATE INDEX medical_history_id_asc ON treatment_historiy(medical_history_id ASC);
CREATE INDEX treatment_id_asc ON treatment_historiy(treatment_id ASC);
CREATE INDEX invoice_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_id_asc ON invoice_items(treatment_id ASC);
