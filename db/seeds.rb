Company.create(
    company_name: "Parque-Ecologico", ticket_value: 100, cashback_value: 0.02, id: 01
)
Company.create(
    company_name: "Rio-da-Prata", ticket_value: 200, cashback_value: 0.03, id: 02
)
Company.create(
    company_name: "Lagoa-Misteriosa", ticket_value: 150, cashback_value: 0, id: 03
)
Company.create(
    company_name: "Binamik", ticket_value: 0, cashback_value: 0.01, id: 04
)

Customer.create(
    customer_name: "Turista-1", numbers_of_ticket: 2, id: 01
)
Customer.create(
    customer_name: "Turista-2", numbers_of_ticket: 3, id: 02
)

Balance.create(
	{ customer_id: 01, cashback_balance: 25.00}
)
Balance.create(
	{ customer_id: 02, cashback_balance: 13.50}
)


Assignment.create(
	{ customer_id:01, company_id:01, id:01 }
)
Assignment.create(
	{ customer_id:01, company_id:02, id:02 }
)
Assignment.create(
	{ customer_id:01, company_id:03, id:03 }
)
Assignment.create(
	{ customer_id:01, company_id:04, id:04 }
)
Assignment.create(
	{ customer_id:02, company_id:01, id:05}
)
Assignment.create(
    { customer_id:02, company_id:03, id:06 }
)
Assignment.create(
    { customer_id:02, company_id:04, id:07 }
)
