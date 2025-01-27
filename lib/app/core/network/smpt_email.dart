import 'package:email_otp/email_otp.dart';

class EmailVerification {
  void emailSetup(String host, String username, String password) =>
      EmailOTP.setSMTP(
        host: host,
        emailPort: EmailPort.port465,
        secureType: SecureType.ssl,
        username: username,
        password: password,
      );

  void emailConfig(String emailName) => EmailOTP.config(
      appName: 'MAHATI',
      appEmail: emailName,
      otpType: OTPType.numeric,
      otpLength: 5,
      expiry: 180000
      );

  void emailTemplate(String userName) => EmailOTP.setTemplate(
        template: '''
    <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 0; margin: 0;">  
      <table width="100%" cellpadding="0" cellspacing="0" border="0">  
      <tr>  
        <td align="center" style="padding: 20px;">  
          <table style="background-color: #ffffff; border-radius: 8px; padding: 20px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); max-width: 600px; margin: auto;" cellpadding="0" cellspacing="0" border="0">  
            <tr>  
              <td align="center">  
                <div style="font-size: 80px; color: #333;">🔒</div>  
                <div style="background: #40D99E; padding: 30px; border-radius: 4px; color: #fff; font-size: 20px; margin: 20px 0px;">  
                  <div style="font-size: 30px; font-weight: 800; margin: 7px 0px;">--- {{appName}} ---</div>  
                  <div>Thanks for signing up!</div>  
                  <div style="margin-top: 25px; font-size: 25px; letter-spacing: 3px;">Please Verify Your Email Address</div>  
                  <div style="font-size: 35px; color: #ffffff;">📧</div>  
                </div>  
                <h2 style="margin: 0;">Hello, $userName</h2>  
                <p>Your One-Time Password (OTP) for verification is:</p>  
                <div style="font-size: 24px; font-weight: bold; background-color: #f8f9fa; padding: 15px; text-align: center; border-radius: 8px; border: 1px dashed #40D99E; color: #40D99E;">{{otp}}</div>  
                <p style="margin-top: 20px;">Please use this OTP to complete your verification. The OTP is valid for the next 3 minutes.</p>  
              </td>  
            </tr>  
            <tr>  
              <td>  
                <div style="color: #6c757d; font-size: 14px; text-align: center; margin-top: 20px;">  
                  <p>If you did not request this OTP, please <a href="https://wa.me/+6281334611144" style="color: #40D99E; text-decoration: underline;">contact us</a> immediately.</p>  
                  <p>Thank you,<br>The {{appName}} Team</p>  
                </div>  
              </td>  
            </tr>  
          </table>  
        </td>  
      </tr>  
      </table>  
    </body>
    ''',
      );
}
