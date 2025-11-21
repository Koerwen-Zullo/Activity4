CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);


CREATE TABLE invoices (
    invoiceid INT NOT NULL,
    appointid INT, 
    totalamount NUMERIC(10, 2),
    paymentdate TIME,
    PRIMARY KEY (invoiceid),
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medical_records (
    recordid SERIAL PRIMARY KEY,
    animalid INTEGER, 
    recorddate TIMESTAMP WITH TIME ZONE, 
    doctorid INTEGER, 
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals_table(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors_table(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email) VALUES 
(1, 'Alice', 'Johnson', '45 Meadow Lane, Anytown', '555-0101', 'alice.j@email.com'),
(2, 'Robert', 'Garcia', '12 Oak Street, Someton', '555-0102', 'robertg@email.com'),
(3, 'Emily', 'Davis', '789 Pine Ave, Vetville', '555-0103', 'emilyd@email.com'),
(4, 'Michael', 'Smith', '101 Elm Rd, Petburg', '555-0104', 'm.smith@email.com'),
(5, 'Jessica', 'Wong', '22 River View, Metro City', '555-0105', 'jessicaw@email.com'),
(6, 'Daniel', 'Brown', '303 Hillside Dr, Suburbia', '555-0106', 'daniel.b@email.com'),
(7, 'Sarah', 'Miller', '90 Park Place, Downtown', '555-0107', 's.miller@email.com'),
(8, 'David', 'Wilson', '5 Lakefront Way, Lakeside', '555-0108', 'davidw@email.com'),
(9, 'Laura', 'Moore', '606 Maple St, Farmstead', '555-0109', 'laura.m@email.com'),
(10, 'James', 'Taylor', '88 Schoolhouse Ln, Old Town', '555-0110', 'jamest@email.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid) VALUES
(1, 'Max', 'Dog', 'German Shepherd', '2020-05-15', 'Male', 'Black and Tan', 101),
(2, 'Luna', 'Cat', 'Siamese', '2022-01-20', 'Female', 'Cream and Seal Point', 102),
(3, 'Charlie', 'Dog', 'Golden Retriever', '2019-11-01', 'Male', 'Gold', 103),
(4, 'Bella', 'Cat', 'Maine Coon', '2021-07-25', 'Female', 'Brown Tabby', 101),
(5, 'Rocky', 'Dog', 'Beagle', '2023-03-10', 'Male', 'Tri-color', 104),
(6, 'Lucy', 'Cat', 'Domestic Shorthair', '2202-09-05', 'Female', 'Calico', 105),
(7, 'Milo', 'Rabbit', 'Netherland Dwarf', '2024-01-01', 'Male', 'Grey', 102),
(8, 'Sophie', 'Dog', 'Poodle (Toy)', '2021-04-12', 'Female', 'White', 103),
(9, 'Oliver', 'Bird', 'Cockatiel', '2023-06-30', 'Male', 'Yellow and Grey', 104),
(10, 'Daisy', 'Dog', 'Labrador Retriever', '2020-10-22', 'Female', 'Yellow', 105);

INSERT INTO appointments (appointid, animalid, appointdate, reason) VALUES 
(1, 1, '2025-11-25', 'Annual wellness exam and vaccines'),
(2, 5, '2025-11-25', 'Check up for persistent coughing'),
(3, 3, '2025-11-26', 'Routine dental cleaning'),
(4, 8, '2025-11-26', 'Follow-up for skin rash'),
(5, 2, '2025-11-27', 'Emergency visit: broken leg'),
(6, 7, '2025-11-27', 'Microchip implantation and registration'),
(7, 4, '2025-11-28', 'Nail trim and grooming consultation'),
(8, 10, '2025-11-28', 'Initial consultation for senior pet care'),
(9, 6, '2025-11-29', 'Behavioral assessment for anxiety'),
(10, 9, '2025-11-29', 'Blood work and general health panel');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM animals
WHERE animalid = 7;
