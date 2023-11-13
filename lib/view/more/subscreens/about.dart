import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Our Team",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 1,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 365,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "This Privacy Policy provides information on the privacy practices for the collection, use, disclosure and retention of Personal Information if anyone chooses to use the Alertable software, and any of its features and capabilities, (the “Application”) and services (the “Services”) provided by the developer and owner of the Application, Public Emergency Alerting Services Inc.The Application provides officials the means to broadcast notifications to individuals in the community and workplace for emergencies and day-to-day events.If you choose to use the Application and Services, then you agree to the collection, use, disclosure and retention of personal information as outlined in this policy.We may update our Privacy Policy from time to time and you are advised to review this page periodically for any changes. Changes to our Privacy Policy are effective immediately after they are published on this page. You agree that you will review this Policy periodically.This Privacy Policy has been drawn up in the English language. In case of discrepancies between the English text version of this Privacy Policy and any translation, the English version shall prevail.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "What personal information is collected?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "The personal information we collect may be different depending on whether you are using the Application and Services to receive notification messages, communicating with our customer service team, participating in surveys, or visiting any of our websites. In choosing to use the Application and Services, we may require you to provide us with certain personally identifiable information including email address, phone number, location information, computer equipment information including device information, settings and preference information, and any other information as may be needed to deliver notification messages to you. The Application may collect certain information automatically, including but not limited to, the type of computer equipment you use, your computer equipment's unique mobile device ID, the IP address of your computer equipment, your computer equipment operating system, the type of internet browsers you use, and information about the way you use the Application. You can stop all collection of information by the Application easily by uninstalling the Application and closing your account for any Services that you have signed up for. You may use the standard uninstall and account closure tools and processes as may be available to you via your computer equipment, application marketplaces from where you may have downloaded the Application, websites from where you may have signed up for the Application, or any other means. If you contact us for help, we may request additional information from you, and keep records and copies of that information, to assist us in helping you.We may contact you to participate in surveys from time to time. If you choose to participate, we may request certain personal information from you depending on the nature of the survey. We may also contact you to provide a testimonial for our Application and Services, or you may choose to provide your own testimonial, including rating and review with an independent third party. Suppose you choose to provide a testimonial, rating or review. In that case, we may request certain personal information from you depending on the nature of the testimonial or the independent third-party may request certain personal information, and you would be subjected to the privacy policies of those third-parties",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "How is personal information used?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "In general, we only collect personal information that is the minimum necessary to deliver emergency alerts and general community notifications to subscribers, perform customer service and support, and provide notices of new Application and Services features and capabilities. We may also use personal information to contact you regarding administrative notices, to resolve disputes, troubleshoot problems and enforce the terms and conditions of any agreements. When you use the Application, and if you provide consent when prompted, we may use GPS technology (or other similar technology) to determine your current location or request that you provide access to your device address, or request that you enter a location address. Your location information is used to support and improve the features and services of the Application, including but not limited to: determining notification message information that should be sent to you,displaying your location on a map relative to the area(s) affected by notification messages,describing the area of relevance in notification messages applicable to your locations, and measuring service subscription by geographic location. If you do not want us to use your location for the purposes set forth above, you should turn off the location services for the Application located in your account settings, in your device settings, and/or within the Application. Whenever you use the Application and Services, in the case of an Application error, we may collect data and information from your computer equipment and devices called Log Data. This Log Data may include information such as your Internet Protocol (“IP”) address, computer equipment and device name, operating system version, the configuration of the Application when utilizing the Application and Services, the time and date of your use of the Application and Services, and other statistics. Our websites use cookies to support personal preferences that individuals choose to apply when viewing notification message information. Our websites also use cookies to compile information about the usage of our websites and interaction with emails from us. Cookies are files with a small amount of data that are commonly used as an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your device’s internal memory. If you do not want the website Application to place a cookie on your browser and track your activity, you may leave the site or you may browse the site using privacy mode in your web browser. Any Personal Information we collect from you is used only for the purposes described in this privacy notice, including for purposes that we explain to you at the time we ask to collect such information or to better understand our market and customer needs in order to continue improving the Application and Services. We will not use or share your information with anyone except as described in this Privacy Policy",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Whom can I contact about personal information?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "If you have any questions about this Privacy Policy, please contact us at: \n Public Emergency Alerting Services Inc888 \n 4 Avenue SW #1906 Calgary, Alberta, Canada \n T2P 0V2 Attn: Privacy Officer \n Email: privacy@peasi.com \n Phone: +1-888-400-5661",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 270,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "About Us",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Emergency alerts are how we started.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "We are a homegrown Canadian company that started in 2018 when our co-founders felt they could revolutionize emergency alerting by making current solutions easier to use, more affordable and scalable so that communities and workplaces of all sizes can benefit from solutions previously only available to a few who could afford them.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Meet our founders.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Akshay Murali",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(Icons.facebook),
                                  Icon(Icons.email),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Akshay Raj  ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.facebook),
                                  Icon(Icons.email),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Anver Sadath  ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.facebook),
                                    Icon(Icons.email),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "M A Harikrishnan  ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.facebook),
                                  Icon(Icons.email),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Vinsha Vishwanath  ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.facebook),
                                    Icon(Icons.email),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
