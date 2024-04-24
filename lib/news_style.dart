import 'package:flutter/material.dart';

// This styles the article page.
class NewsStyle extends StatelessWidget {
  const NewsStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Article Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE46D86),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView( // Makes the whole column scrollable
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildArticleTile(context, 'What is Postpartum Depression? An Introduction', const ArticleOne()),
            const SizedBox(height: 20),
            _buildArticleTile(context, 'Next Steps: A Postpartum Guide', const ArticleTwo()),
            const SizedBox(height: 20),
            _buildArticleTile(context, 'Breaking The Bias: Common Stereotypes', const ArticleThree(), icon: true),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleTile(BuildContext context, String title, Widget destination, {bool icon = false}) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
        },
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Limits the row to only needed width
              children: [
                if (icon) Icon(Icons.favorite, color: Color(0xFFE46D86)),
                const SizedBox(width: 10),
                Expanded( // Makes the text widget flexible
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis, // Prevents text from overflowing
                    maxLines: 2, // Allows text up to two lines
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}










  // const ArticleOne({super.key});

class ArticleOne extends StatelessWidget {
  const ArticleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  ',
          style: TextStyle(fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFE46D86),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'What is Postpartum? An Introduction',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'As a beginner’s guide, this article serves to teach you about the basics of Postpartum. Before continuing, it is essential to understand that Postpartum is a highly researched yet not fully understood phenomenon that occurs to mothers after birth. Our group has done our best to understand it, but we are still not medical experts. In that regard, you should always reach out to a trusted medical psychologist. However, we are here to help you understand the basics.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Feeling sad, teary, overwhelmed, restless, or even tense is an entirely normal response to having a baby. After all, your entire life has changed overnight. Typically, these feelings get better in a couple weeks. This is done through taking care of your emotional health, taking breaks, getting a good amount of sleep every night, talking to those around you, and especially asking for help. This is referred to as Baby Blues.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'When these symptoms exceed this, increasing in severity or lasting longer, you may be experiencing Postpartum Depression. It is crucial to acknowledge that the symptoms of Postpartum vary with each individual, and that you’re valid in what you are feeling regardless of how it differs in others. When this happens, getting medical help is the most important thing you can do to help yourself feel better.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Generally, you will be at a higher risk of getting postpartum if you: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• Are naturally sensitive to hormonal changes', style: TextStyle(fontSize: 16)),
                          Text('• Are sensitive to the lack of sleep accompanying taking care of a newborn', style: TextStyle(fontSize: 16)),
                          Text('• Have another family member with addiction or mental health issues', style: TextStyle(fontSize: 16)),
                          Text('• Have little emotional, practical, or social support', style: TextStyle(fontSize: 16)),
                          Text('• Have gone through an extreme experience (having a traumatic birth experience, domestic violence, etc.)', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Postpartum depression begins before or during pregnancy, or after birth. It can become obvious in weeks, months, and sometimes years. Furthermore, it can occur after a miscarriage or stillbirth, be mistaken for Baby Blues, and make you feel extreme emotional changes such as hopelessness, sadness, and inability to cope.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Postpartum anxiety is something that can accompany postpartum depression, but can also occur on its own. It is often related to the baby and their well-being, and can include panic attacks or very high anxiety. You may start to feel intrusive thoughts that occur out of the blue, and make you feel very afraid.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'If you see yourself reflected here, there are some steps that you can take. ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ArticleTwo extends StatelessWidget {
  const ArticleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' ',
          style: TextStyle(fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFE46D86),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Next Steps: A Postpartum Guide',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'If you suspect Postpartum, you should go to a doctor or to a specialized health expert. They will ask you about your symptoms (which this app will help you keep a log of to easily show them), and ask that you complete an exam. They’ll order some tests to determine if an outside factor is causing you to feel as you are. You should be honest about how you are feeling with them, and they will discuss your treatment options in depth.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'It is especially vital that you contact a healthcare provider when your symptoms are: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• Not fading after two weeks', style: TextStyle(fontSize: 16)),
                          Text('• Getting worse', style: TextStyle(fontSize: 16)),
                          Text('• Making it hard for you to care for your baby', style: TextStyle(fontSize: 16)),
                          Text('• Making it hard to complete everyday tasks', style: TextStyle(fontSize: 16)),
                          Text('• Include thoughts of harming yourself or your baby)', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'For treatment, they may recommend antidepressants or other medication if your symptoms are excessive (with consideration of breastfeeding and other health complications), or offer support or referrals for taking care of the baby – giving you time to sleep and for self-care – or show you to the nurse-led or peer-led support groups that are online or in person if your symptoms are more mild. You may be hesitant about the medication, but it is best to talk through it with your doctor to see the benefits and risks for finding the best option.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Many mothers feel embarrassed and ashamed at their feelings, therefore being hesitant to speak up. However, it is important to understand that postpartum is a natural response that many mothers around the world experience. If you experience symptoms, you should call a healthcare provider and schedule an appointment immediately to receive help.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Many times, mothers will find that all that they needed was a helping hand when taking care of the baby to get more sleep, and taking care of themself. All of this can be discussed with your healthcare provider.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),

                  ],
                ),
              ),
              

            ],
        ),
      ),
    ));
  }
}


class ArticleThree extends StatelessWidget {
  const ArticleThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  ',
          style: TextStyle(fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFE46D86),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Breaking The Bias: Common Stereotypes about Postpartum',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'If you feel alone in your struggle, you should remember that Postpartum Depression affects 1 in 7 mothers and about 1 in 10 fathers after the birth of a baby. It is nothing new, and has been around for many, many years. To speak out about your experience is the first step to destigmatizing. However, many preconceptions about Postpartum can deter a new mother from speaking out. Some stereotypes include:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• Thinking it means you are a bad parent', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Postpartum can result from chemical imbalances in your brain that you can’t control, circumstances surrounding your pregnancy and birth, and much more. You are not responsible, and you didn’t bring these feelings onto yourself. ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• It only happens in Women', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Through studies, it has been found that women are not the only holders of Postpartum Depression and rather, 10% of new fathers get Postpartum Depression. Generally, this happens in the 3 to 6 months after the baby’s born, and a new father is more likely to be depressed if their partner has postpartum depression.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• It starts right after birth', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Text(
                      'Usually, Postpartum Depression becomes prevalent in the first few months after childbirth, but it can also start from when you are pregnant to a year later.',
                      style: TextStyle(fontSize: 16),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• It can be prevented', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Those that get Postpartum Depression do not choose to get Postpartum Depression. Generally, having depression or Postpartum Depression in the past may make your doctor screen you before the next birth or recommend additional checkups, but it isn’t always mitigatable.',
                      style: TextStyle(fontSize: 16),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• You can only have it if you hear voices or have hallucinations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'For Postpartum depression, the symptoms do not include having hallucinations, hearing voices, or feeling manic or paranoid and are generally the symptoms of a very serious and rare condition called Postpartum Psychosis. This is where you may start to feel disoriented, delusional, or confused and may begin to have thoughts of hurting your baby or yourself. If this happens, call your doctor right away or call the National Suicide Prevention Lifeline at 988.',
                      style: TextStyle(fontSize: 16),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('•  It goes away on its own', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'For Postpartum depression, the symptoms do not include having hallucinations, hearing voices, or feeling manic or paranoid and are generally the symptoms of a very serious and rare condition called Postpartum Psychosis. This is where you may start to feel disoriented, delusional, or confused and may begin to have thoughts of hurting your baby or yourself. If this happens, call your doctor right away or call the National Suicide Prevention Lifeline at 988.',
                      style: TextStyle(fontSize: 16),
                    ),


                    Text(
                      'Postpartum Depression can slowly decrease over time as you begin to gain back control of your emotional health, but you won’t just, “get over it.” If your symptoms get worse and it becomes difficult to take care of your baby, you can go to your doctor to understand the next steps. There are many treatment routes they can take, from giving you medicine to allowing you to talk through your feelings.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),

                  ],
                ),
              ),




              Text(
                'Feeling sad, teary, overwhelmed, restless, or even tense is an entirely normal response to having a baby. After all, your entire life has changed overnight. Typically, these feelings get better in a couple weeks. This is done through taking care of your emotional health, taking breaks, getting a good amount of sleep every night, talking to those around you, and especially asking for help. This is referred to as Baby Blues.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'When these symptoms exceed this, increasing in severity or lasting longer, you may be experiencing Postpartum Depression. It is crucial to acknowledge that the symptoms of Postpartum vary with each individual, and that you’re valid in what you are feeling regardless of how it differs in others. When this happens, getting medical help is the most important thing you can do to help yourself feel better.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Generally, you will be at a higher risk of getting postpartum if you: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• Are naturally sensitive to hormonal changes', style: TextStyle(fontSize: 16)),
                          Text('• Are sensitive to the lack of sleep accompanying taking care of a newborn', style: TextStyle(fontSize: 16)),
                          Text('• Have another family member with addiction or mental health issues', style: TextStyle(fontSize: 16)),
                          Text('• Have little emotional, practical, or social support', style: TextStyle(fontSize: 16)),
                          Text('• Have gone through an extreme experience (having a traumatic birth experience, domestic violence, etc.)', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Postpartum depression begins before or during pregnancy, or after birth. It can become obvious in weeks, months, and sometimes years. Furthermore, it can occur after a miscarriage or stillbirth, be mistaken for Baby Blues, and make you feel extreme emotional changes such as hopelessness, sadness, and inability to cope.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Postpartum anxiety is something that can accompany postpartum depression, but can also occur on its own. It is often related to the baby and their well-being, and can include panic attacks or very high anxiety. You may start to feel intrusive thoughts that occur out of the blue, and make you feel very afraid.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'If you see yourself reflected here, there are some steps that you can take. ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


