# 📁 File System Size  with SQL

This project demonstrates how to model and analyze a hierarchical file system using SQL. Each node in the system is either a file or a folder. The goal is to compute the **total size** of each node, where folder sizes include the sizes of all nested files.

---

## 🧩 Problem Statement

Given a table `FileSystem` with the following columns:

- `NodeID` (INT): Unique identifier for each file or folder
- `NodeName` (VARCHAR): Name of the file or folder
- `ParentID` (INT): ID of the parent folder (`NULL` for root nodes)
- `SizeBytes` (INT): Size of the file in bytes (`NULL` for folders)


---


📥 Sample Data

INSERT INTO FileSystem (NodeID, NodeName, ParentID, SizeBytes) VALUES
(1, 'Documents', NULL, NULL),
(2, 'Pictures', NULL, NULL),
(3, 'File1.txt', 1, 500),
(4, 'Folder1', 1, NULL),
(5, 'Image.jpg', 2, 1200),
(6, 'Subfolder1', 4, NULL),
(7, 'File2.txt', 4, 750),
(8, 'File3.txt', 6, 300),
(9, 'Folder2', 2, NULL),
(10, 'File4.txt', 9, 250);

✅ Expected Output
<img width="1635" height="324" alt="Screenshot 2025-07-23 151559" src="https://github.com/user-attachments/assets/d8c58230-924b-49bb-857c-4aa11579f915" />

💡 Notes
The recursive CTE traverses bottom-up, collecting all descendant file sizes.

LEFT JOIN ensures folders with no files still appear with a size of 0.

Works in PostgreSQL, MySQL 8.0+, SQL Server, and SQLite (3.8.3+).

📦 How to Run
Paste the entire SQL script (CREATE TABLE, INSERT, and WITH RECURSIVE) into your SQL editor.



📁 File Contents
final_assignment.sql: SQL script for schema, data, and query

README.md: 

🔧 Author
-Kapil Madan
