select  t.user_id as 'user_id',
		sum(t.amount-t.discount) as 'total_spend',
		sum(t.amount) as 'total_bill',
		count(t.visit_rank) as 'total_visit',
		min(t.txn_date) as 'first_transaction_date',
		max(t1.bill_date) as 'last_transaction_date',
		min(t.store_name) as 'first_transaction_store',
		max(t.store_name) as 'last_transaction_store',
		max(t.store_name) as 'favourite_store',
		sum(t1.qty) as 'total_quantity_purchased'
from transaction_log_loyalty t inner join transaction_log_loyalty_lineitem t1 on t.user_id=t1.user_id
group by t.user_id order by t.user_id asc