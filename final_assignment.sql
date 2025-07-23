DROP TABLE IF EXISTS FileSystem;

CREATE TABLE FileSystem (
    NodeID INT PRIMARY KEY,
    NodeName VARCHAR(100) NOT NULL,
    ParentID INT,
    SizeBytes INT,
    FOREIGN KEY (ParentID) REFERENCES FileSystem(NodeID)
);

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

WITH RECURSIVE FileHierarchy AS (
    SELECT 
        NodeID,
        ParentID,
        SizeBytes,
        NodeID AS LeafNodeID
    FROM FileSystem
    WHERE SizeBytes IS NOT NULL

    UNION ALL

    SELECT 
        fs.NodeID,
        fs.ParentID,
        fh.SizeBytes,
        fh.LeafNodeID
    FROM FileSystem fs
    JOIN FileHierarchy fh
        ON fh.ParentID = fs.NodeID
)

SELECT 
    fs.NodeID,
    fs.NodeName,
    COALESCE(SUM(fh.SizeBytes), 0) AS sizeBytes
FROM FileSystem fs
LEFT JOIN FileHierarchy fh ON fs.NodeID = fh.NodeID
GROUP BY fs.NodeID, fs.NodeName
ORDER BY fs.NodeID;

