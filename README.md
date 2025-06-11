# 💼 Accounts Payable Flow Automation

**This project automates and analyzes the Accounts Payable (AP) workflow using MySQL and MongoDB. It implements a robust three-way match system across Purchase Orders (PO), Goods Received Notices (GRN), and Invoices, helping detect mismatches and streamline payments.**

---

## 📄 Overview
Managing vendor payments manually is time-consuming and error-prone. This project models and automates a database-driven AP workflow. It supports full matching between orders, receipts, and invoices while enabling analytics and reporting through SQL, NoSQL, and Python visualizations.

---

## 🎯 Objectives
- Model real-world AP flow with EER and UML diagrams
- Perform three-way matching: PO ↔ GRN ↔ Invoice
- Identify mismatches in quantity, price, and description
- Enable analytical queries using SQL and MongoDB
- Visualize results using Python (pandas + matplotlib)

---

## 🧰 Tech Stack
- **Databases**: MySQL (Relational), MongoDB (NoSQL)
- **Languages**: SQL, Python
- **Tools**: ERD tools, UML tools, MySQL Workbench
- **Libraries**: `mysql-connector`, `pandas`, `matplotlib`

---

## 🗃️ Schema Overview
Relational model includes:
- `Company`, `Supplier`, `ProductDetails`
- `PurchaseOrder`, `GRN`, `Invoice`, `Payment`, `Cash`, `Cheque`
- Relationships with foreign keys to ensure data consistency

---

## 🧪 SQL Functionality
Includes advanced queries such as:
- Mismatch detection (quantity, price, description)
- High-value orders, single-invoice multi-delivery checks
- Combined “happy path” match validation
- Payment tracking via cash and cheque modes

---

## 🧾 NoSQL Functionality (MongoDB)
- Aggregations to compute total order values
- Year-based product sales analysis
- GRN filtering by received status

---

## 📈 Python Integration
- Connected to MySQL via `mysql.connector`
- Used `pandas` for DataFrame conversion
- Visualized key insights with `matplotlib`

---

## 📊 Visual Output Examples
- Max purchase per company
- Mismatched unit prices
- Total price per order
- GRNs with missing acknowledgements

---

## 📌 Future Enhancements
- Improve MongoDB implementation and query structure
- Integrate fraud detection based on historical mismatches
- Extend system with API endpoints for real-time usage
- Enable multi-language and global compliance support

---

## 👥 Contributors
- Rohith Adhitya Chinnannan Rajkumar  
- Uma Maheshwari Deivasigamani

---

## 📜 License
This project is for educational use only and utilizes synthetic or anonymized data for demonstration.
