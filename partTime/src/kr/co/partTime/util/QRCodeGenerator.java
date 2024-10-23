package kr.co.partTime.util;

import java.awt.image.BufferedImage; // 이미지를 처리하기 위한 클래스
import java.io.ByteArrayOutputStream; // 바이트 배열로 출력하기 위한 클래스
import javax.imageio.ImageIO; // 이미지 입출력 클래스
import com.google.zxing.BarcodeFormat; // 바코드 포맷 클래스
import com.google.zxing.qrcode.QRCodeWriter; // QR 코드 생성기 클래스
import com.google.zxing.common.BitMatrix; // 비트 매트릭스 클래스

public class QRCodeGenerator {
    public static byte[] generateQRCode(String text, int width, int height) throws Exception {
        QRCodeWriter qrCodeWriter = new QRCodeWriter(); // QR 코드 작성기 인스턴스 생성
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height); // QR 코드 인코딩
        
        // 비트 매트릭스를 BufferedImage로 변환
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                // 비트 매트릭스의 값을 이용해 이미지의 픽셀 색상 설정
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF); // 검은색 또는 흰색
            }
        }
        
        // 이미지 데이터를 바이트 배열로 변환
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "png", baos); // PNG 형식으로 이미지 저장
        return baos.toByteArray(); // 바이트 배열 반환
    }
}
