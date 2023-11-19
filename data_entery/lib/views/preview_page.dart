import '../models/model.dart';

List<Medical> medicals = [
  Medical(
    title: 'Emergency medicine',
    sections: [
      MedicalBranch(title: 'Pédfatric emergency.', sections: []),
      MedicalBranch(
        title: 'Internal medicine emergency',
        sections: [
          MedicalContent(
            title: 'Stroke',
            sections: [
              MedicalSection(
                title: 'History',
                data:
                    "1. Check **Risk Factors:**\n   - Diabetic or hypertensive (Is there hypertension or diabetes?)\n   - Heavy smoker (Are you currently smoking? Since when? How many cigarettes per day?)\n\n2. Check **Hemiplegia:**\n   - Is there weakness on your right or left side?\n\n3. Check **Aphasia or Dysarthria:**\n   - If any patient complains about suddenly being unable to speak, consider stroke.\n\n4. Check **Headache:**\n   - Inquire about any recent or persistent headaches, and note the severity and duration.\n\n5. Check **Ataxia or Amnesia:**\n   - Inquire about difficulties with coordination or any memory-related issues.\n\n6. Check **Coma, Convulsion, or Confusion:**\n   - Ask if the patient has experienced a state of unconsciousness, seizures, or mental confusion.",
              ),
              MedicalSection(
                title: 'Examination',
                data:
                    "#### General\n\n1. **Respiratory Rate (RR):**\n   - Count the number of breaths per minute. Tachypnea (abnormally rapid breathing) may be an indication of certain respiratory issues.\n\n2. **Pulse:**\n   - Assess the pulse rate. An abnormal pulse may suggest cardiovascular or other systemic issues.\n\n3. **Blood Pressure:**\n   - Measure blood pressure. Note that caution should be taken not to decrease blood pressure before a CT scan, as it might affect the results.\n\n4. **Temperature:**\n   - Check the patient's body temperature. Elevated temperatures may indicate an infection or other underlying issues.\n\n#### Head Examination\n\n1. **Facial Asymmetry:**\n   - Examine the face for any signs of asymmetry, which may include:\n     - Drop in the angle of the mouth.\n     - Mouth deviated to one side.\n     - Inability to blow out a cheek.![Facial Asymmetry](https://www.iracdubai.com/wp-content/uploads/2022/12/Best-Neuromuscular-Physiotherapist.jpg)",
              ),
              MedicalSection(
                  title: 'Local Examination',
                  data:
                      "#### Chest and Heart\n\n1. **Lung Sounds:**\n   - Use a stethoscope to listen to lung sounds in different areas of the chest. Note any abnormal sounds such as crackles, wheezes, or diminished breath sounds.\n\n2. **Heart Sounds:**\n   - Listen to the heart sounds at different auscultatory areas (e.g., mitral, tricuspid, aortic, pulmonary). Identify and document any abnormalities, such as murmurs, irregular rhythms, or extra heart sounds.\n\n3. **Palpation of the Chest:**\n   - Palpate the chest for tenderness, masses, or deformities.\n\n4. **Palpation of the Heart:**\n   - Palpate the precordium to assess for any tenderness, thrills, or abnormal pulsations.\n\n5. **Chest Expansion:**\n   - Assess chest expansion by placing hands on the chest and observe for symmetrical movement during breathing.\n\n6. **Fremitus:**\n   - Evaluate tactile fremitus by placing hands on the chest and asking the patient to repeat a phrase. Check for symmetry and intensity of vibrations."),
              MedicalSection(
                  title:
                      "Neurological Examination (First Stage - 2 to 6 weeks)",
                  data:
                      "1. **Glasgow Coma Scale (GCS):**\n   - Assess the patient's level of consciousness using the GCS.\n\n2. **Muscle Tone:**\n   - Note any loss of muscle tone.\n\n3. **Muscle Power:**\n   - Instruct the patient to move their hand and leg. Observe for:\n     - Lack of movement.\n     - Variation in the ability to move one area compared to another.\n\n4. **Deep Reflexes:**\n   - Test deep reflexes (e.g., patellar reflex). Note any loss.\n\n5. **Plantar Reflex:**\n   - Assess the plantar reflex (Babinski sign).\n     - If positive: Big toe moves upward (extension).\n     - If normal: Big toe moves downward or does not move. ![Babinski Sign](https://pbs.twimg.com/media/E9ldNKSWUAIq3Pi.jpg)"),
              MedicalSection(
                  title: "Investigations",
                  data:
                      "1. **Arterial Blood Gas (ABG):**\n   - Perform ABG if SpO2 (Oxygen Saturation) is less than 94%.\n\n2. **Serum Creatinine:**\n   - Check serum creatinine levels to assess kidney function.\n\n3. **Random Blood Sugar (RBS):**\n   - Perform RBS to exclude hypoglycemia.\n\n4. **CT Scan:**\n   - Consider CT scan, particularly in cases of suspected hemorrhage. CT is useful for providing detailed imaging of the brain.\n     ![CT Scan](https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/MCA_Territory_Infarct.svg/654px-MCA_Territory_Infarct.svg.png)\n\n5. **MRI (Magnetic Resonance Imaging):**\n   - Consider MRI, especially when a more sensitive imaging modality is required. MRI is valuable for detailed evaluation of soft tissues and is often used for neurological assessments.\n\n6. **ECG (Electrocardiogram):**\n   - Conduct an ECG to assess the heart's electrical activity.\n\n7. **Chest X-ray:**\n   - Perform a chest X-ray to assess the condition of the lungs and surrounding structures."),
              MedicalSection(
                  title: "Cases Requiring Urgent CT",
                  data:
                      "- Patient with a sudden, severe headache.\n- Patient on anticoagulant therapy or with a bleeding disorder.\n- GCS < 13.\n- Patient with progressive symptoms.\n- Patient with papilledema, fever, and neck stiffness."),
            ],
          ),
        ],
      ),
    ],
  ),
  Medical(
    title: 'Emergency Surgery',
    sections: [
      MedicalBranch(
        title: 'Internal medicine emergency',
        sections: [
          MedicalContent(
            title: 'Stroke',
            sections: [
              MedicalSection(
                title: 'History',
                data:
                    "1. Check **Risk Factors:**\n   - Diabetic or hypertensive (Is there hypertension or diabetes?)\n   - Heavy smoker (Are you currently smoking? Since when? How many cigarettes per day?)\n\n2. Check **Hemiplegia:**\n   - Is there weakness on your right or left side?\n\n3. Check **Aphasia or Dysarthria:**\n   - If any patient complains about suddenly being unable to speak, consider stroke.\n\n4. Check **Headache:**\n   - Inquire about any recent or persistent headaches, and note the severity and duration.\n\n5. Check **Ataxia or Amnesia:**\n   - Inquire about difficulties with coordination or any memory-related issues.\n\n6. Check **Coma, Convulsion, or Confusion:**\n   - Ask if the patient has experienced a state of unconsciousness, seizures, or mental confusion.",
              ),
              MedicalSection(
                title: 'Examination',
                data:
                    "#### General\n\n1. **Respiratory Rate (RR):**\n   - Count the number of breaths per minute. Tachypnea (abnormally rapid breathing) may be an indication of certain respiratory issues.\n\n2. **Pulse:**\n   - Assess the pulse rate. An abnormal pulse may suggest cardiovascular or other systemic issues.\n\n3. **Blood Pressure:**\n   - Measure blood pressure. Note that caution should be taken not to decrease blood pressure before a CT scan, as it might affect the results.\n\n4. **Temperature:**\n   - Check the patient's body temperature. Elevated temperatures may indicate an infection or other underlying issues.\n\n#### Head Examination\n\n1. **Facial Asymmetry:**\n   - Examine the face for any signs of asymmetry, which may include:\n     - Drop in the angle of the mouth.\n     - Mouth deviated to one side.\n     - Inability to blow out a cheek.",
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
const data = r'''{
  "title": "Stroke",
  "sections": [
    {
      "title": "History",
      "data": "1. Check **Risk Factors:**\n   - Diabetic or hypertensive (Is there hypertension or diabetes?)\n   - Heavy smoker (Are you currently smoking? Since when? How many cigarettes per day?)\n\n2. Check **Hemiplegia:**\n   - Is there weakness on your right or left side?\n\n3. Check **Aphasia or Dysarthria:**\n   - If any patient complains about suddenly being unable to speak, consider stroke.\n\n4. Check **Headache:**\n   - Inquire about any recent or persistent headaches, and note the severity and duration.\n\n5. Check **Ataxia or Amnesia:**\n   - Inquire about difficulties with coordination or any memory-related issues.\n\n6. Check **Coma, Convulsion, or Confusion:**\n   - Ask if the patient has experienced a state of unconsciousness, seizures, or mental confusion."
    },
    {
      "title": "Examination",
      "data": "#### General\n\n1. **Respiratory Rate (RR):**\n   - Count the number of breaths per minute. Tachypnea (abnormally rapid breathing) may be an indication of certain respiratory issues.\n\n2. **Pulse:**\n   - Assess the pulse rate. An abnormal pulse may suggest cardiovascular or other systemic issues.\n\n3. **Blood Pressure:**\n   - Measure blood pressure. Note that caution should be taken not to decrease blood pressure before a CT scan, as it might affect the results.\n\n4. **Temperature:**\n   - Check the patient's body temperature. Elevated temperatures may indicate an infection or other underlying issues.\n\n#### Head Examination\n\n1. **Facial Asymmetry:**\n   - Examine the face for any signs of asymmetry, which may include:\n     - Drop in the angle of the mouth.\n     - Mouth deviated to one side.\n     - Inability to blow out a cheek."
    },
    {
      "title": "Local Examination",
      "data": "#### Chest and Heart\n\n1. **Lung Sounds:**\n   - Use a stethoscope to listen to lung sounds in different areas of the chest. Note any abnormal sounds such as crackles, wheezes, or diminished breath sounds.\n\n2. **Heart Sounds:**\n   - Listen to the heart sounds at different auscultatory areas (e.g., mitral, tricuspid, aortic, pulmonary). Identify and document any abnormalities, such as murmurs, irregular rhythms, or extra heart sounds.\n\n3. **Palpation of the Chest:**\n   - Palpate the chest for tenderness, masses, or deformities.\n\n4. **Palpation of the Heart:**\n   - Palpate the precordium to assess for any tenderness, thrills, or abnormal pulsations.\n\n5. **Chest Expansion:**\n   - Assess chest expansion by placing hands on the chest and observe for symmetrical movement during breathing.\n\n6. **Fremitus:**\n   - Evaluate tactile fremitus by placing hands on the chest and asking the patient to repeat a phrase. Check for symmetry and intensity of vibrations."
    },
    {
      "title": "Neurological Examination (First Stage - 2 to 6 weeks)",
      "data": 
    },
    {
      "title": "Investigations",
      "data": "1. **Arterial Blood Gas (ABG):**\n   - Perform ABG if SpO2 (Oxygen Saturation) is less than 94%.\n\n2. **Serum Creatinine:**\n   - Check serum creatinine levels to assess kidney function.\n\n3. **Random Blood Sugar (RBS):**\n   - Perform RBS to exclude hypoglycemia.\n\n4. **CT Scan:**\n   - Consider CT scan, particularly in cases of suspected hemorrhage. CT is useful for providing detailed imaging of the brain.\n     ![CT Scan](https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/MCA_Territory_Infarct.svg/654px-MCA_Territory_Infarct.svg.png)\n\n5. **MRI (Magnetic Resonance Imaging):**\n   - Consider MRI, especially when a more sensitive imaging modality is required. MRI is valuable for detailed evaluation of soft tissues and is often used for neurological assessments.\n\n6. **ECG (Electrocardiogram):**\n   - Conduct an ECG to assess the heart's electrical activity.\n\n7. **Chest X-ray:**\n   - Perform a chest X-ray to assess the condition of the lungs and surrounding structures."
    },
    {
      "title": "Cases Requiring Urgent CT",
      "data": 
    }
  ]
}
''';

// import 'dart:developer';

// import 'package:flutter/material.dart';

// class PreviewPage extends StatelessWidget {
//   const PreviewPage({super.key, required this.data});
//   final String data;
//   @override
//   Widget build(BuildContext context) {
//     // return MarkdownParse(
//     //   physics: const NeverScrollableScrollPhysics(),
//     //   shrinkWrap: false,
//     //   imageBuilder: (uri, url, ur) {
//     //     return Padding(
//     //       padding: const EdgeInsets.all(10.0),
//     //       child: Image.network(
//     //         uri.toString(),
//     //       ),
//     //     );
//     //   },
//     //   bulletBuilder: (index, style) {
//     //     log(style.name);
//     //     return style.name == 'unorderedList'
//     //         ? const Text('🔸')
//     //         : Text('${index + 1}-');
//     //   },
// //           data: r'''

// // > ## History

// // 1. Check **Risk Factors:**
// //    - Diabetic or hypertensive (Is there hypertension or diabetes?)
// //    - Heavy smoker (Are you currently smoking? Since when? How many cigarettes per day?)

// // 2. Check **Hemiplegia:**
// //    - Is there weakness on your right or left side?

// // 3. Check **Aphasia or Dysarthria:**
// //    - If any patient complains about suddenly being unable to speak, consider stroke.

// // 4. Check **Headache:**
// //    - Inquire about any recent or persistent headaches, and note the severity and duration.

// // 5. Check **Ataxia or Amnesia:**
// //    - Inquire about difficulties with coordination or any memory-related issues.

// // 6. Check **Coma, Convulsion, or Confusion:**
// //    - Ask if the patient has experienced a state of unconsciousness, seizures, or mental confusion.

// // > ## Examination

// // #### General

// // 1. **Respiratory Rate (RR):**
// //    - Count the number of breaths per minute. Tachypnea (abnormally rapid breathing) may be an indication of certain respiratory issues.

// // 2. **Pulse:**
// //    - Assess the pulse rate. An abnormal pulse may suggest cardiovascular or other systemic issues.

// // 3. **Blood Pressure:**
// //    - Measure blood pressure. Note that caution should be taken not to decrease blood pressure before a CT scan, as it might affect the results.

// // 4. **Temperature:**
// //    - Check the patient's body temperature. Elevated temperatures may indicate an infection or other underlying issues.

// // #### Head Examination

// // 1. **Facial Asymmetry:**
// //    - Examine the face for any signs of asymmetry, which may include:
// //      - Drop in the angle of the mouth.
// //      - Mouth deviated to one side.
// //      - Inability to blow out a cheek.
// //      ![Facial Asymmetry](https://www.iracdubai.com/wp-content/uploads/2022/12/Best-Neuromuscular-Physiotherapist.jpg)

// // #### Local Examination

// // #### Chest and Heart

// // 1. **Lung Sounds:**
// //    - Use a stethoscope to listen to lung sounds in different areas of the chest. Note any abnormal sounds such as crackles, wheezes, or diminished breath sounds.

// // 2. **Heart Sounds:**
// //    - Listen to the heart sounds at different auscultatory areas (e.g., mitral, tricuspid, aortic, pulmonary). Identify and document any abnormalities, such as murmurs, irregular rhythms, or extra heart sounds.

// // 3. **Palpation of the Chest:**
// //    - Palpate the chest for tenderness, masses, or deformities.

// // 4. **Palpation of the Heart:**
// //    - Palpate the precordium to assess for any tenderness, thrills, or abnormal pulsations.

// // 5. **Chest Expansion:**
// //    - Assess chest expansion by placing hands on the chest and observe for symmetrical movement during breathing.

// // 6. **Fremitus:**
// //    - Evaluate tactile fremitus by placing hands on the chest and asking the patient to repeat a phrase. Check for symmetry and intensity of vibrations.

// // #### Neurological Examination (First Stage - 2 to 6 weeks)

// // 1. **Glasgow Coma Scale (GCS):**
// //    - Assess the patient's level of consciousness using the GCS.

// // 2. **Muscle Tone:**
// //    - Note any loss of muscle tone.

// // 3. **Muscle Power:**
// //    - Instruct the patient to move their hand and leg. Observe for:
// //      - Lack of movement.
// //      - Variation in the ability to move one area compared to another.

// // 4. **Deep Reflexes:**
// //    - Test deep reflexes (e.g., patellar reflex). Note any loss.

// // 5. **Plantar Reflex:**
// //    - Assess the plantar reflex (Babinski sign).
// //      - If positive: Big toe moves upward (extension).
// //      - If normal: Big toe moves downward or does not move.
// //      ![Babinski Sign](https://pbs.twimg.com/media/E9ldNKSWUAIq3Pi.jpg)

// // > ## Investigations

// // 1. **Arterial Blood Gas (ABG):**
// //    - Perform ABG if SpO2 (Oxygen Saturation) is less than 94%.

// // 2. **Serum Creatinine:**
// //    - Check serum creatinine levels to assess kidney function.

// // 3. **Random Blood Sugar (RBS):**
// //    - Perform RBS to exclude hypoglycemia.

// // 4. **CT Scan:**
// //    - Consider CT scan, particularly in cases of suspected hemorrhage. CT is useful for providing detailed imaging of the brain.
// //      ![CT Scan](https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/MCA_Territory_Infarct.svg/654px-MCA_Territory_Infarct.svg.png)

// // 5. **MRI (Magnetic Resonance Imaging):**
// //    - Consider MRI, especially when a more sensitive imaging modality is required. MRI is valuable for detailed evaluation of soft tissues and is often used for neurological assessments.

// // 6. **ECG (Electrocardiogram):**
// //    - Conduct an ECG to assess the heart's electrical activity.

// // 7. **Chest X-ray:**
// //    - Perform a chest X-ray to assess the condition of the lungs and surrounding structures.

// // > ## Cases Requiring Urgent CT

// // - Patient with a sudden, severe headache.
// // - Patient on anticoagulant therapy or with a bleeding disorder.
// // - GCS < 13.
// // - Patient with progressive symptoms.
// // - Patient with papilledema, fever, and neck stiffness.

// // '''),
//       data: data,
//     );
//   }
// }







