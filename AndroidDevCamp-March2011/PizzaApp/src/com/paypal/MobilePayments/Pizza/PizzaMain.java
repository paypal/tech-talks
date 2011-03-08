package com.paypal.MobilePayments.Pizza;


import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnMultiChoiceClickListener;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;


public class PizzaMain extends Activity implements OnClickListener, OnItemSelectedListener, OnMultiChoiceClickListener, OnDismissListener {
    /** Called when the activity is first created. */
	
	//So we can easily reference the different sizes and delivery methods
	final static public int SIZE_SMALL = 0;
	final static public int SIZE_MEDIUM = 1;
	final static public int SIZE_LARGE = 2;
	
	final static public int METHOD_PICKUP = 0;
	final static public int METHOD_DELIVERY = 1;
	
	private int _size = SIZE_SMALL;
	private int _number = 1;
	private int _method = METHOD_PICKUP;
	
	//Local references to our amounts and description
	private double _theSubtotal;
	private double _taxAmount;
	private String _pizzaDescription;
	
	//All the booleans we will use for toppings
	private boolean _cheese = false;
	private boolean _pepperoni = false;
	private boolean _mushrooms = false;
	private boolean _onions = false;
	
	//Reference to our number formatter (used for to format the amounts)
	private NumberFormat _df;
	

	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        loadMainPage();
    }
    
    public void loadMainPage() {
        setContentView(R.layout.main);
        
        //do the setup for the Home page -- add the Pay button
        findViewById(R.id.Buy).setOnClickListener(this);
    }

    public void loadCustomizePage() {
    	setContentView(R.layout.customize);
    	//set up the spinner for the Pizza sizes
    	
    	Spinner sizeSpinner = (Spinner) findViewById(R.id.Spinner01);
    	sizeSpinner.setPrompt("Select a size");
        ArrayAdapter <CharSequence> sizeAdapter;
		sizeAdapter = new ArrayAdapter <CharSequence> (this, android.R.layout.simple_spinner_item);
        sizeAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		sizeAdapter.add("Small ($7.99)");
		sizeAdapter.add("Medium ($9.99)");
		sizeAdapter.add("Large ($11.99)");
		sizeSpinner.setAdapter(sizeAdapter);
		sizeSpinner.setOnItemSelectedListener(this);
		sizeSpinner.setSelection(_size);
	
		//Set up the click listeners for the buttons
		findViewById(R.id.Button03).setOnClickListener(this);
		findViewById(R.id.Continue).setOnClickListener(this);
		
	}
    
    public void loadFinalizePage() {
    	setContentView(R.layout.finalize);
    	
    	//Set up the finalize page
       	Spinner numberSpinner = (Spinner) findViewById(R.id.Spinner02);
       	numberSpinner.setPrompt("Select number of pizzas");
        ArrayAdapter <CharSequence> numberAdapter;
        numberAdapter = new ArrayAdapter <CharSequence> (this, android.R.layout.simple_spinner_item);
        numberAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        numberAdapter.add("One");
        numberAdapter.add("Two");
        numberAdapter.add("Three");
		numberSpinner.setAdapter(numberAdapter);
		numberSpinner.setOnItemSelectedListener(this);
		numberSpinner.setSelection(_number - 1);
		
      	Spinner methodSpinner = (Spinner) findViewById(R.id.Spinner03);
      	methodSpinner.setPrompt("Select method");
        ArrayAdapter <CharSequence> methodAdapter;
        methodAdapter = new ArrayAdapter <CharSequence> (this, android.R.layout.simple_spinner_item);
        methodAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        methodAdapter.add("Pickup");
        methodAdapter.add("Delivery");
        methodSpinner.setAdapter(methodAdapter);
        methodSpinner.setOnItemSelectedListener(this);
        methodSpinner.setSelection(_method);
		
    	findViewById(R.id.ReviewOrder).setOnClickListener(this);
    }
    
    public void loadReviewPage() {
    	setContentView(R.layout.review);
    	
    	//Do all our setup of the Review page
    	
    	//Set up our DecimalFormatter for our amounts
    	_df = (DecimalFormat)DecimalFormat.getCurrencyInstance(Locale.ENGLISH);
    	_df.setCurrency(Currency.getInstance("USD"));
    	String size = "Small";
    	switch (_size) {
    	case SIZE_SMALL: size = "Small"; break;
    	case SIZE_MEDIUM: size = "Medium"; break;
    	case SIZE_LARGE: size = "Large"; break;
    	}
    	
    	//Set up all the Pizza-related strings
    	_pizzaDescription = _number + " " + size + " Pizzas";
    	if (_number == 1) {
    		_pizzaDescription = _number + " " + size + " Pizza";
    	}
    	
    	((TextView) findViewById(R.id.NumberOfPizzas)).setText(_pizzaDescription);
    	double priceAmount = 7.99;
    	String price = "7.99";
    	if (_number == 1) {
    		if (_size == SIZE_SMALL) {
    			price = "7.99";
    			priceAmount = 7.99;
    		} else if (_size == SIZE_MEDIUM) {
    			price = "9.99";
    			priceAmount = 9.99;
    		} else {
    			price = "11.99";
    			priceAmount = 11.99;
    		}
    	}
    	if (_number == 2) {
    		if (_size == SIZE_SMALL) {
    			price = "9.99";
    			priceAmount = 9.99;
    		} else if (_size == SIZE_MEDIUM) {
    			price = "15.99";
    			priceAmount = 15.99;
    		} else {
    			price = "19.99";
    			priceAmount = 19.99;
    		}
    	}
    	else if (_number == 3) {
    		if (_size == SIZE_SMALL) {
    			price = "11.99";
    			priceAmount = 11.99;
    		} else if (_size == SIZE_MEDIUM) {
    			price = "20.99";
    			priceAmount = 20.99;
    		} else {
    			price = "25.99";
    			priceAmount = 25.99;
    		}
    	}
    	
    	((TextView) findViewById(R.id.Price)).setText("$" + price);
    	
    	//hide toppings, if they're not used
    	if (!_cheese) {
    		((TextView) findViewById(R.id.ExtraCheesePrice)).setText("$0.00");
    	}
    	if (!_pepperoni) {
    		((TextView) findViewById(R.id.PepperoniPrice)).setText("$0.00");
    	}
    	if (!_mushrooms) {
    		((TextView) findViewById(R.id.MushroomsPrice)).setText("$0.00");
    	}
    	if (!_onions) {
    		((TextView) findViewById(R.id.OnionsPrice)).setText("$0.00");
    	}
    	
    	if (_cheese) {
    		priceAmount += 2.00;
    	}
    	if (_pepperoni) {
    		priceAmount += 2.00;
    	}
    	if (_mushrooms) {
    		priceAmount += 2.00;
    	}
    	if (_onions) {
    		priceAmount += 2.00;
    	}
    	
    	_theSubtotal = priceAmount;//saving this here so we can access it later
    	((TextView) findViewById(R.id.SubtotalPrice)).setText(_df.format(priceAmount));
    	if (_method == METHOD_PICKUP) {
    		((TextView) findViewById(R.id.DeliveryFeePrice)).setText("$0.00");
    		((TextView) findViewById(R.id.MethodType)).setText("Pick Up");
    	}
    	else {
    		priceAmount += 2.00;
    	}
    	//to account for tax
    	_taxAmount = priceAmount * .08;
    	priceAmount += _taxAmount;
    	((TextView) findViewById(R.id.TaxPrice)).setText(_df.format(_taxAmount));
    	((TextView) findViewById(R.id.TotalPrice)).setText(_df.format(priceAmount));
    }
    
    public void loadResultsPage() {
    	setContentView(R.layout.results);
    	
		//Set up the click listeners for the buttons
		findViewById(R.id.BuyMore).setOnClickListener(this);
		findViewById(R.id.Done).setOnClickListener(this);
    }
    
    
    
	@Override
	public void onClick(View arg0) {
		if (arg0 == (Button)findViewById(R.id.Buy)) {
			//load the Customize page when the Buy button is clicked
			loadCustomizePage();
		}
		else if (arg0 == (Button)findViewById(R.id.Button03)) {
			//Shows the pop-up where the user can select toppings
			((Button)findViewById(R.id.Continue)).setVisibility(View.GONE);
			final CharSequence[] items = {"Extra Cheese", "Pepperoni", "Mushrooms", "Onions"};

			AlertDialog.Builder builder = new AlertDialog.Builder(this);
			builder.setTitle("Choose your toppings");
			boolean[] myBools = {_cheese, _pepperoni, _mushrooms, _onions};
			builder.setMultiChoiceItems(items, myBools, this);
			builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
				@Override
				public void onClick(DialogInterface dialog, int which) {
					dialog.dismiss();
				}
			});
			AlertDialog alert = builder.create();
			alert.setOnDismissListener(this);
			alert.show();
		}
		else if (arg0 == (Button)findViewById(R.id.Continue)) {
			loadFinalizePage();
		}
		else if (arg0 == (Button)findViewById(R.id.ReviewOrder)) {
			loadReviewPage();
		}
		else if (arg0 == (Button)findViewById(R.id.BuyMore)) {
			loadMainPage();
		}
		else if (arg0 == (Button)findViewById(R.id.Done)) {
			finish();
		}
		
	}

	@Override
	public void onItemSelected(AdapterView<?> arg0, View arg1, int arg2,
			long arg3) {
		//Lets us track the spinner view 
		if (arg0 == findViewById(R.id.Spinner01)) {
			_size = arg2;//0 is small, 1 is medium, 2 is large
		} else if (arg0 == findViewById(R.id.Spinner02)) {
			_number = arg2 + 1;
		} else if (arg0 == findViewById(R.id.Spinner03)) {
			_method = arg2;
		}
		
	}

	@Override
	public void onNothingSelected(AdapterView<?> arg0) {
		// TODO Auto-generated method stub
	}

	@Override
	public void onClick(DialogInterface arg0, int arg1, boolean arg2) {
		//this is the topping selector
		if (arg1 == 0) {
			_cheese = arg2;
		} else if (arg1 == 1) {
			_pepperoni = arg2;
		} else if (arg1 == 2) {
			_mushrooms = arg2;
		} else {
			_onions = arg2;
		}
	}
	
	
    public void paymentSucceeded(String transactionID){
    	//We could show the transactionID to the user
		loadResultsPage();
		((TextView)findViewById(R.id.ResultsTitle)).setText("Success!");
		if(_method == METHOD_PICKUP) {
			((TextView)findViewById(R.id.ResultsText1)).setText("Your order is being prepared!");
		} else if(_method == METHOD_DELIVERY) {
			((TextView)findViewById(R.id.ResultsText1)).setText("Your order is on its way!");
		}
		((TextView)findViewById(R.id.ResultsText2)).setText("Estimated time: 30 minutes.");
		((TextView)findViewById(R.id.ResultsText3)).setText("Transaction ID: " + transactionID);
    }	
	
	public void paymentFailed(String errorID, String errorMessage){
		//We could let the user know the payment failed here
		loadResultsPage();
		((TextView)findViewById(R.id.ResultsTitle)).setText("Failure!");
		((TextView)findViewById(R.id.ResultsText1)).setText("We're sorry, but your payment failed.");
		((TextView)findViewById(R.id.ResultsText2)).setText("Error: " + errorMessage);
		((TextView)findViewById(R.id.ResultsText3)).setText("Error ID: " + errorID);
    }
	    
    public void paymentCanceled(){
    	//We could tell the user that the payment was canceled
		loadResultsPage();
		((TextView)findViewById(R.id.ResultsTitle)).setText("Canceled.");
		((TextView)findViewById(R.id.ResultsText1)).setText("Your payment has been canceled.");
		((TextView)findViewById(R.id.ResultsText2)).setText("Your account was not charged.");
		((TextView)findViewById(R.id.ResultsText3)).setText("");
    }
    
	    
	@Override
	public void onDismiss(DialogInterface arg0) {
		findViewById(R.id.Continue).setVisibility(View.VISIBLE);	
	}
	
}