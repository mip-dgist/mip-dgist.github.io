---
title: Contact
date: 2024-01-01
type: landing

design:
  spacing: "6rem"

sections:
  - block: features
    id: contact-info
    content:
      title: Contact Information
      text: |
        MIP 랩에서는 열정적으로 연구하실 학생들을 (석사과정, 박사과정 및 학부 연구생) 모집하고 있습니다. 로봇, 의료, 자율주행 시스템 등의 기반이 되는 Multimodal (Vision-Language) AI 를 연구하고 싶으시다면 언제든 편하게 shyoon@dgist.ac.kr 로 메일 주시기 바랍니다. 이메일에는 간단히 관심있는 연구분야, CV, 성적표를 첨부주시면 됩니다 :)
        
        <br>
        
        The MIP Lab is seeking passionate and motivated students (M.S./Ph.D. students and undergraduate interns) to join our research team. If you are interested in developing and advancing multimodal AI for robotics, medicine, and autonomous systems, please feel free to contact me at shyoon@dgist.ac.kr. When emailing, please include a brief description of your research interests, your CV, and your transcript.
      items:
        - name: Email
          icon: at-symbol
          description: |
            [shyoon@dgist.ac.kr](mailto:shyoon@dgist.ac.kr)
        - name: Address
          icon: map-pin
          description: |
            DGIST, 333 Techno Jungang-daero, Hyeonpung-eup, Dalseong-gun, Daegu, Republic of Korea
        - name: Phone
          icon: phone
          description: |
            PI Office: [+82-53-785-6347](tel:+82-53-785-6347)
        - name: PI Office
          icon: building-office
          description: |
            E7 Bldg - L11
        - name: Lab Office
          icon: building-office
          description: |
            R3 Bldg - 805/806
    design:
      spacing:
        padding: ["2rem", 0, "2rem", 0]
      css_class: "bg-gray-100 dark:bg-gray-900"
  
  - block: markdown
    id: social-links
    content:
      title: Connect with Us
      text: |
        {{< contact-social >}}
    design:
      spacing:
        padding: ["2rem", 0, "2rem", 0]
      css_class: "bg-white dark:bg-gray-800"
      container: false
  
  - block: markdown
    id: map
    content:
      title: Our Location
      text: |
        <style>
          #map .container,
          #map .prose,
          section[id="map"] .container,
          section[id="map"] .prose,
          section[id="map"] > *,
          section[id="map"] > * > * {
            max-width: 200% !important;
            width: 200% !important;
            margin-left: -50% !important;
            margin-right: -50% !important;
          }
        </style>
        <div class="w-full" style="height: 400px; border-radius: 8px; overflow: hidden;">
          <iframe 
            src="https://www.google.com/maps?q=35.70631,128.4540&hl=ko&z=15&output=embed"
            width="100%" 
            height="100%" 
            style="border:0;" 
            allowfullscreen="" 
            loading="lazy" 
            referrerpolicy="no-referrer-when-downgrade">
          </iframe>
        </div>
    design:
      spacing:
        padding: ["2rem", 0, "2rem", 0]
      css_class: "bg-gray-100 dark:bg-gray-900"
      container: false
  
---
