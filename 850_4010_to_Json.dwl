%dw 2.0
output application/json
---
{
	Transaction_Name: payload.TransactionSets.v004010."850".Name[0],
	Sender_ID: payload.TransactionSets.v004010."850".Interchange.ISA06[0],
	Receiver_ID: payload.TransactionSets.v004010."850".Interchange.ISA08[0],
	PO_Type: payload.TransactionSets.v004010."850".Heading."020_BEG".BEG02[0],
	PO_Number: payload.TransactionSets.v004010."850".Heading."020_BEG".BEG03[0],
	PO_Date: payload.TransactionSets.v004010."850".Heading."020_BEG".BEG05[0],
	Total_Transaction_Amount: payload.TransactionSets.v004010."850".Summary."010_CTT_Loop"."020_AMT".AMT02[0],
	Buyer_Information: payload.TransactionSets.v004010."850".Heading."060_PER" map {
		Name: $.PER02[0],
		Communication_Number: $.PER04[0]
	},
	Tax_Information: payload.TransactionSets.v004010."850".Heading."070_TAX" map {
		Tax_Identification_Number: $.TAX01[0],
		Tax_Exempt_Code:  $.TAX12[0]
	},
	Terms_of_Sale: payload.TransactionSets.v004010."850".Heading."130_ITD" map {
		Terms_Type_Code: $.ITD01[0],
		Discount_Percent: $.ITD03[0],
		Discount_Period: $.ITD05[0],
		Net_Days: $.ITD07[0],
		Terms_Description: $.ITD12[0]
	},
	Entity_Identification: payload.TransactionSets.v004010."850".Heading."310_N1_Loop" map {
		Entity_Id_Code: $."310_N1".N101[0],
		Entity_Name: $."310_N1".N102[0],
		Entity_Id_Qualifier_Code: $."310_N1".N103[0],
		Id: $."310_N1".N104[0],
		Address: $."340_N4" map {
			City: $.N401[0],
			State: $.N402[0],
			Postal_Code: $.N403[0],
			Country: $.N404[0]
		}
	},
	Details: payload.TransactionSets.v004010."850".Detail."010_PO1_Loop" map {
		Item_Information: $."010_PO1" map {
			Assigned_Identification: $.PO101[0],
			Ordered_Quantity: $.PO102[0],
			Unit_Code: $.PO103[0],
			Unit_Price: $.PO104[0],
			Buyers_Item_Number: $.PO107[0],
			Vendors_Item_Number: $.PO109[0],
			Product_Qualifier_Id: $.PO110[0],
			Product_Id: $.PO111[0]	
		},
		Item_Measurements: $."049_MEA" map {
			Measurement_Code: $.MEA01[0],
			Measurement_Qualifier: $.MEA02[0],
			Measurement_Value: $.MEA03[0],
			Unit: $.MEA0401[0]
		}
	}
}
