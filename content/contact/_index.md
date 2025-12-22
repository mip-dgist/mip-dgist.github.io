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
      text: Get in touch with us
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
