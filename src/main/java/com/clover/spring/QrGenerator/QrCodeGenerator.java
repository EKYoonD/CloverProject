package com.clover.spring.QrGenerator;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QrCodeGenerator {




		public static void generateQRCodeImage(String text, int width, int height, String filePath)
	            throws WriterException, IOException {
			String path = "C:\\qr\\QRCode.png";
	       // QRCodeWriter qrCodeWriter = new QRCodeWriter();
	        BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height);
	        MatrixToImageConfig imageConfig = new MatrixToImageConfig(MatrixToImageConfig.BLACK, MatrixToImageConfig.WHITE);
	        BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix, imageConfig);
            // Getting logo image
            BufferedImage logoImage = ImageIO.read(new File("src/main/resources/static/img/cloverlogo.png"));
            int finalImageHeight = qrImage.getHeight() - logoImage.getHeight();
            int finalImageWidth = qrImage.getWidth() - logoImage.getWidth();
            //Merging both images 
            BufferedImage finalImage = new BufferedImage(qrImage.getHeight(), qrImage.getWidth(), BufferedImage.TYPE_INT_ARGB);
            Graphics2D graphics = (Graphics2D) finalImage.getGraphics();
            graphics.drawImage(qrImage, 0, 0, null);
            graphics.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1f));
            graphics.drawImage(logoImage, (int) Math.round(finalImageWidth / 2), (int) Math.round(finalImageHeight / 2), null);
           // Path path = FileSystems.getDefault().getPath(filePath);
            ImageIO.write(finalImage, "png",  new File(path));
         
	       
	    }
		
		

		
		
		public static byte[] getQRCodeImage(String text, int width, int height) throws WriterException, IOException {
		   // QRCodeWriter qrCodeWriter = new QRCodeWriter();
		    BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height);
	        MatrixToImageConfig imageConfig = new MatrixToImageConfig(MatrixToImageConfig.BLACK, MatrixToImageConfig.WHITE);
	        BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix, imageConfig);
            // Getting logo image
            BufferedImage logoImage = ImageIO.read( new File("src/main/resources/static/img/cloverlogo.png"));
            int finalImageHeight = qrImage.getHeight() - logoImage.getHeight();
            int finalImageWidth = qrImage.getWidth() - logoImage.getWidth();
            //Merging both images 
            BufferedImage finalImage = new BufferedImage(qrImage.getHeight(), qrImage.getWidth(), BufferedImage.TYPE_INT_ARGB);
            Graphics2D graphics = (Graphics2D) finalImage.getGraphics();
            graphics.drawImage(qrImage, 0, 0, null);
            graphics.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1f));
            graphics.drawImage(logoImage, (int) Math.round(finalImageWidth / 2), (int) Math.round(finalImageHeight / 2), null);
            ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
            ImageIO.write(finalImage, "png",  pngOutputStream);
		    byte[] pngData = pngOutputStream.toByteArray(); 
		    return pngData;
		}
		
		

}