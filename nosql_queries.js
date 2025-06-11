// Insert multiple products into MongoDB
db.products.insertMany([
  { productId: "S1", name: "Product A", price: 120, quantity: 10, year: 2023 },
  { productId: "S6", name: "Product F", price: 75, quantity: 5, year: 2023 },
  // ... more product documents
]);

// Query 1: Total price of all products with productId 'S1'
db.products.aggregate([
  { $match: { productId: "S1" } },
  { $group: {
      _id: "$productId",
      totalAmount: { $sum: { $multiply: ["$price", "$quantity"] } }
  }}
]);

// Query 2: List of orders with productId 'S6'
db.orders.find({ productId: "S6" });

// Insert multiple GRNs (Goods Received Notices)
db.grn.insertMany([
  { grnId: 1, productId: "S1", receivedNote: "YES", qty: 10 },
  { grnId: 2, productId: "S6", receivedNote: "NO", qty: 5 },
  // ... more GRN documents
]);

// Query 3: Products sold in 2023, listed from highest to lowest quantity
db.products.aggregate([
  { $match: { year: 2023 } },
  { $group: {
      _id: "$productId",
      totalSold: { $sum: "$quantity" }
  }},
  { $sort: { totalSold: -1 } }
]);

// Query 4: Find companies with the highest number of orders
db.orders.aggregate([
  { $group: {
      _id: "$companyId",
      orderCount: { $sum: 1 }
  }},
  { $sort: { orderCount: -1 } },
  { $limit: 1 }
]);

// Query 5: GRNs with receivedNote = 'YES'
db.grn.find({ receivedNote: "YES" });
