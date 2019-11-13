#!/usr/bin/python

import sqlite3

#conn = sqlite3.connect('TPCH.db')
#print "Opened database successfullly"

def newTable():
	tcphConnect.execute('''CREATE TABLE IF NOT EXISTS warehouse
				(w_warehousekey decimal(3, 0) NOT NULL,
				w_name char(25) NOT NULL,
				w_supplierkey decimal(2, 0) NOT NULL,
				w_capacity decimal(6, 2) NOT NULL,
				w_address varchar(40) NOT NULL,
				w_nationkey decimal(2, 0) NOT NULL);''')
	print "Table created successfullly"
	conn.commit()

def userInput():
	warehouse = input("Warehouse Number: ")
	name = input("Name: ")
	supp = input("Supplier: ")
	cap = input("Capacity: ")
	add = input("Address: ")
	nat = input("Nation: ")
	query = "INSERT INTO warehouse(w_warehousekey, w_name, w_supplierkey, w_capacity, w_address, w_nationkey) VALUES (?, ?, ?, ?, ?, ?)"
	conn.execute(query, [warehouse, name, supp, cap, add, nat])
	conn.commit()

def findMin():
	conn.execute("SELECT s_name, MIN(wcnt) FROM (SELECT s_name, COUNT(w_name) AS wcnt FROM supplier, warehouse WHERE s_suppkey = w_suppkey GROUP BY s_name)")
	for row in conn.fetchall():
		print(row)

def findMax():
	conn.execute('SELECT MAX(wmax) FROM (SELECT MAX(w_capacity) AS wmax FROM supplier, warehouse WHERE s_suppkey = w_suppkey GROUP BY s_name)')
	for row in conn.fetchall():
		print(row)

def find_euro_ware():
    capacity = input("What capacity are you looking for? ")
    query ="SELECT w_name FROM nation, warehouse WHERE n_nationkey = w_nationkey AND n_name = 'EUROPE' AND w_capacity = ?"
    conn.execute(query, [capacity,])
    for row in conn.fetchall():
        print(row)

def find_supp_quant():
    suppname = input("What suppier name do you want to find? ")
    conn.execute("SELECT s_name, SUM(w_capacity), ps_availqty FROM supplier, warehouse, partsupp WHERE s_suppkey  = w_suppkey AND ps_suppkey = s_suppkey AND s_name = ?",[suppname])
    for row in conn.fetchall():
        print(row)

def find_nation_ware():
    nation = input("what is the nation? ")
    conn.execute("SELECT w_name FROM nation, warehouse WHERE n_nationkey = w_nationkey AND n_name = ? ORDER BY w_capacity DESC",[nation])
    for row in conn.fetchall():
        print(row)

def update_supp():
    supplier1 = input("What is the first supplier?")
    supplier2 = input("what is the second supplier?")
    conn.execute("UPDATE warehouse SET w_suppkey = ? WHERE w_suppkey = ?",[supplier1,supplier2])
    for row in conn.fetchall():
        if row == 0:
            print("NONE")
        else:
            print(row)

def disconnect():
    conn.close()
    conn.close()


key = 1

conn = sqlite3.connect('TPCH.db')
conn = conn.cursor()

while key != "0":


    key = input("Enter 8 to create table or enter 1 to Enter Data or 2 for query one or 3 for query up to query six which is number 7 or 9 to connect, 10 to disconnecy or 0 to exit: ")

    if key == '1':
        userInput()
    elif key == '2':
        findMin()
    elif key == '3':
        findMax()
    elif key == '4':
        find_euro_ware()
    elif key == '5':
        find_supp_quant()
    elif key == '6':
        find_nation_ware()
    elif key == '7':
        update_supp()
    elif key == '8':
        newTable()
        while x < 1000:
            query = "INSERT INTO warehouse(w_warehousekey, w_name, w_suppkey, w_capacity, w_address, w_nationkey) VALUES (?, ?, ?, ?, ?, ?)"
            conn.execute(query, [x, null, null, null, null, null])
            x = x + 1
    elif key == '9':
        #conn = sqlite3.connect('TPCH.db')
        #tcphConnect = conn.cursor()
        null = True
        x = 0

    elif key == '10':
        disconnect()
    else:
        key = '0';


#tcphConnect.close()
conn.close()



#conn.close()

#name = input("Name: ")
#supp = input("Supplier: ")
#cap = input("Capacity: ")
#add = input("Address: ")
#nat = input("Nation: ")