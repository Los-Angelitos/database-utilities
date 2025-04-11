CREATE TABLE roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE owners (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  surname VARCHAR(50),
  phone VARCHAR(15),
  email VARCHAR(50),
  state ENUM('active', 'inactive', 'banned') DEFAULT 'active',
  role_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE owner_credentials (
  owner_id INT PRIMARY KEY,
  code VARCHAR(100),
  FOREIGN KEY (owner_id) REFERENCES owners(id)
);

CREATE TABLE admins (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  surname VARCHAR(100),
  phone VARCHAR(15),
  email VARCHAR(50),
  role_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE admin_credentials (
  admin_id INT PRIMARY KEY,
  code VARCHAR(100),
  FOREIGN KEY (admin_id) REFERENCES admins(id)
);

CREATE TABLE notifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  content VARCHAR(5000),
  sender_type VARCHAR(20),
  sender_id INT,
  receiver_id INT
);

CREATE TABLE subscriptions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  content VARCHAR(200),
  price DECIMAL(10,2),
  status VARCHAR(100)
);

CREATE TABLE contract_owners (
  id INT AUTO_INCREMENT PRIMARY KEY,
  owner_id INT,
  start_date DATE,
  final_date DATE,
  subscription_id INT,
  status VARCHAR(100),
  FOREIGN KEY (owner_id) REFERENCES owners(id),
  FOREIGN KEY (subscription_id) REFERENCES subscriptions(id)
);

CREATE TABLE hotels (
  id INT AUTO_INCREMENT PRIMARY KEY,
  owner_id INT,
  name VARCHAR(50),
  description VARCHAR(100),
  email VARCHAR(50),
  address VARCHAR(500),
  phone VARCHAR(15),
  FOREIGN KEY (owner_id) REFERENCES owners(id)
);

CREATE TABLE type_rooms (
  id INT AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(500),
  price DECIMAL(10,2)
);

CREATE TABLE rooms (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type_room_id INT,
  hotel_id INT,
  state VARCHAR(100),
  FOREIGN KEY (type_room_id) REFERENCES type_rooms(id),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE providers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  phone VARCHAR(15),
  state VARCHAR(100)
);

CREATE TABLE supplies (
  id INT AUTO_INCREMENT PRIMARY KEY,
  provider_id INT,
  hotel_id INT,
  name VARCHAR(50),
  price DECIMAL(10,2),
  stock INT,
  state VARCHAR(100),
  FOREIGN KEY (provider_id) REFERENCES providers(id),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE payment_owners (
  id INT AUTO_INCREMENT PRIMARY KEY,
  owner_id INT,
  description VARCHAR(200),
  final_amount DECIMAL(10,2),
  FOREIGN KEY (owner_id) REFERENCES owners(id)
);

CREATE TABLE supply_requests (
  id INT AUTO_INCREMENT PRIMARY KEY,
  payment_owner_id INT,
  supply_id INT,
  count INT,
  amount DECIMAL(10,2),
  FOREIGN KEY (payment_owner_id) REFERENCES payment_owners(id),
  FOREIGN KEY (supply_id) REFERENCES supplies(id)
);

CREATE TABLE guests (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  surname VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(15),
  state VARCHAR(100)
);

CREATE TABLE guest_credentials (
  guest_id INT PRIMARY KEY,
  code VARCHAR(100),
  FOREIGN KEY (guest_id) REFERENCES guests(id)
);

CREATE TABLE guest_preferences (
  id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT,
  temperature INT,
  FOREIGN KEY (guest_id) REFERENCES guests(id)
);

CREATE TABLE payment_customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT,
  final_amount DECIMAL(10,2),
  FOREIGN KEY (guest_id) REFERENCES guests(id)
);

CREATE TABLE bookings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  payment_customer_id INT,
  room_id INT,
  description VARCHAR(5000),
  start_date DATE,
  final_date DATE,
  price_room DECIMAL(10,2),
  night_count INT,
  amount DECIMAL(10,2),
  state VARCHAR(25),
  preference_id INT,
  FOREIGN KEY (payment_customer_id) REFERENCES payment_customers(id),
  FOREIGN KEY (room_id) REFERENCES rooms(id),
  FOREIGN KEY (preference_id) REFERENCES guest_preferences(id)
);