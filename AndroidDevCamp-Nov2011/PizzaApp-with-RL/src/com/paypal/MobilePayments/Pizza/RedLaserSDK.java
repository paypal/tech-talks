package com.paypal.MobilePayments.Pizza;



import android.os.Bundle;
import android.util.Log;
import android.view.WindowManager;

import com.ebay.redlasersdk.BarcodeResult;
import com.ebay.redlasersdk.scanner.BarcodeScanActivity;
import com.ebay.redlasersdk.scanner.RedLaserSettings;

import com.ebay.redlasersdk.R;

public class RedLaserSDK extends BarcodeScanActivity {
	static String DO_UPCE 		= "do_upce";
	static String DO_EAN8 		= "do_ean8";
	static String DO_EAN13 		= "do_ean13";
	static String DO_STICKY 	= "do_sticky";
	static String DO_QRCODE		= "do_qrcode";
	static String DO_CODE128	= "do_code128";
	static String DO_CODE39		= "do_code39";
	static String DO_CODE93		= "do_code93";
	static String DO_DATAMATRIX	= "do_datamatrix";
	static String DO_RSS14		= "do_rss14";
	static String DO_ITF		= "do_itf";
	
	
	
	  /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle icicle) {
    	/*
    	 * _appCode is your customer SDK code.  "psdk" is for testing
    	 * purposes and has a scanning limit enforced.
    	 * 
    	 * If you are not sure what your SDK code is, it should be in the release e-mail.
    	 * If you still are not sure e-mail support@redlaser.com
    	 */
    	Log.d("RedLaserSDK","Creating a new RedLaserSDK object");
    	
    	RedLaserSettings settings = new RedLaserSettings();
    	settings.setAppCode("qa");
    	settings.setAlignBarcode("Align barcode inside box");
    	settings.setHoldStill("Hold still for scan");

        super.onCreate(icicle,settings);
        
        Bundle bundle = getIntent().getExtras();
        // Here we can set what types of barcode to scan
        
        hints.setUpce(bundle.getBoolean(DO_UPCE));
        hints.setEan8(bundle.getBoolean(DO_EAN8));
        hints.setEan13(bundle.getBoolean(DO_EAN13));
        hints.setQRCode(bundle.getBoolean(DO_QRCODE));
        hints.setCode128(bundle.getBoolean(DO_CODE128));
        hints.setCode39(bundle.getBoolean(DO_CODE39));
        hints.setCode93(bundle.getBoolean(DO_CODE93));
        hints.setDataMatrix(bundle.getBoolean(DO_DATAMATRIX));
        hints.setITF(bundle.getBoolean(DO_ITF));
        hints.setRSS14(bundle.getBoolean(DO_RSS14));
        hints.setSticky(bundle.getBoolean(DO_STICKY));
        
        // Setup the optional scan button names.  To have no buttons pass in 
        setButtons(null,null,null);
        // setButtons("Button", "Button 2", "Button 3");
        
        // To Remove the Title bar from RedLaserSDK Activity, add the NoTitleBar Theme in your Android Manifest.
        
        // Remove the Status Bar from this window.
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
    }
    
    /* Only needed if you want buttons on your overlay. */
	@Override
	protected final void onButton1Click() {
	
	}

    /* Only needed if you want buttons on your overlay. */
	@Override
	protected final void onButton2Click() {
		
		
	}

    /* Only needed if you want buttons on your overlay. */
	@Override
	protected final void onButton3Click() {
		
	}

    /* This is where you get your barcode result. */
	@Override
	protected void onBarcodeScanned(BarcodeResult barcode) {
		// To get barcode type use barcode.getBarcodeType();
		returnResult(barcode);
	}

    protected int getLogoResource(){
    	return R.drawable.overlay_logo;
    }
    protected int getBeepResource(){
    	return R.raw.beep;
    }
    
    // To close the scanner invoke finish()
    // This is taken care of as well by calling returnResult(BarcodeResult result)
}