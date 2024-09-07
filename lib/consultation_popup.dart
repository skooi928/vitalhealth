import 'package:flutter/material.dart';

class ConsultPopUp extends StatelessWidget {
  const ConsultPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(174, 174, 199, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 20.0),

                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage('assets/images/doctorconsultation2.jpg'),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Your upcoming virtual meeting with Dr. Bonebrake has been scheduled',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),

                        const Text(
                          '22nd Wednesday, June 2022 at 11:00AM',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.grey),
                        ),
                        const SizedBox(height: 10.0),
                        
                        const Text(
                          'Booking id: #1234abc',
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.grey),
                          selectionColor: Colors.grey,
                        ),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            const Icon(
                              Icons.videocam, color: Color.fromRGBO(164, 165, 255, 1),
                              size: 30.0,
                            
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Test your device prior to visit',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                  
                                  ),
                                  Text(
                                    'Make sure video, audio and internet are working.',
                                     style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
                                    ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 20.0, 
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0), 
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule, color: Color.fromRGBO(164, 165, 255, 1),
                              size: 30.0,
                              ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Schedule another Appointment',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                    ),
                                  Text(
                                    'Schedule an appointment with available doctors',
                                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () { },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size:20.0, 
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20.0),

                Padding(
                  padding: const EdgeInsets.only(left: 22), // Ensure no left padding is applied
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft, // Ensures the text is aligned to the left within its parent
                        child: Text(
                          'Confirm Payment (Cont.)',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Align(
                        alignment: Alignment.centerLeft, // Ensures the text is aligned to the left within its parent
                        child: Text(
                          'Card Numbers',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 10.0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // Add padding to make space for the icons
                      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.credit_card),
                      ), 
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.help_outline),
                      ), 
                      hintText: '0000-0000-0000-0000',
                      hintStyle: const TextStyle(color: Colors.grey), 
                    ),
                  ),
                ),

                const SizedBox(height: 10.0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Card Expiration'),
                      SizedBox(width: 122.0),
                      Text('CVV'),
                    ],
                  ),
                ),

                const SizedBox(height: 10.0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'MM/YY',
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.help_outline),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'XXX',
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.help_outline),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    elevation: 10.0, 
                    shadowColor: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('Confirm Payment'),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
