package everymarket.mailsender;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;

public class MimeMailSender extends AbstractMailSender {

	@Override
	public void sendMail(String to, String from, String subject, String text)
			throws MessagingException {
		MimeMessage msg = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "utf-8");
		helper.setTo(to);
		helper.setFrom(from);
		helper.setSubject(subject);
		helper.setText(text);
		
		sender.send(msg);
	}
	
}
