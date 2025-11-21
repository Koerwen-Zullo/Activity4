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
