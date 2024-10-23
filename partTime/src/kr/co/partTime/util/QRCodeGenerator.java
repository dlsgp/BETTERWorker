package kr.co.partTime.util;

import java.awt.image.BufferedImage; // �̹����� ó���ϱ� ���� Ŭ����
import java.io.ByteArrayOutputStream; // ����Ʈ �迭�� ����ϱ� ���� Ŭ����
import javax.imageio.ImageIO; // �̹��� ����� Ŭ����
import com.google.zxing.BarcodeFormat; // ���ڵ� ���� Ŭ����
import com.google.zxing.qrcode.QRCodeWriter; // QR �ڵ� ������ Ŭ����
import com.google.zxing.common.BitMatrix; // ��Ʈ ��Ʈ���� Ŭ����

public class QRCodeGenerator {
    public static byte[] generateQRCode(String text, int width, int height) throws Exception {
        QRCodeWriter qrCodeWriter = new QRCodeWriter(); // QR �ڵ� �ۼ��� �ν��Ͻ� ����
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height); // QR �ڵ� ���ڵ�
        
        // ��Ʈ ��Ʈ������ BufferedImage�� ��ȯ
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                // ��Ʈ ��Ʈ������ ���� �̿��� �̹����� �ȼ� ���� ����
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF); // ������ �Ǵ� ���
            }
        }
        
        // �̹��� �����͸� ����Ʈ �迭�� ��ȯ
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "png", baos); // PNG �������� �̹��� ����
        return baos.toByteArray(); // ����Ʈ �迭 ��ȯ
    }
}
