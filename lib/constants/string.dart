class ConstantStrings {

  // static String kGraphQlToken = 'bb54c2f93d8acc6dc5c043e3730f5c85';

  // APIs
  //static String kGraphQlBaseUrl = 'https://alhafidh-market-test.myshopify.com/api/2023-01/graphql.json';
  //static String kBaseUrl = 'https://alhafidh-market-test.myshopify.com/admin/api/';

  static String kBaseUrl = 'https://alhafidh.myshopify.com/';
  static String kAPIVersion = 'admin/api/2023-01/';
  static String kRecommendation = 'recommendations/';
  static String kCollections = 'collections/';
  static String kLoginAPI = 'graphql.json';
  static String kRegisterAPI = 'customers.json';
  static String kCustomerUpdateAPI = 'customers/';
  static String kForgetPassword = '';
  static String kProductsAPI = 'products.json';
  static String kFilterAPI = 'filter';
  static String kSearchAPI = 'search';
  static String kProductDetailsAPI = 'products/';
  static String kOrderListAPI = 'orders.json?status=any&email=';
  static String kDeliveryAddressesAPI = 'customers/';

  //fonts
  static String kAppRobotoFont = 'Roboto';
  static String kFontFamily = 'Roboto';
  static String kAppRobotoBold = 'Roboto-Bold';
  static String kFontRobotoLight = 'Roboto-light';
  static String kAppFontPoppins = 'Poppins';
  static String kAppFontBarbesNeuekai = 'BerbasNeuekai';

  // error msgs
  static String kWentWrong = 'Something went wrong';
  static String kEmptyFields = 'Please fill all fields';
  static String kValidEmail = 'Please enter a valid email';
  static String kPasswordLength = 'Password must be at least 6 characters';

  //html
  static String kHtmlCateTxt = '''

    "<div id=\"shopify-section-mobile-department\" class=\"shopify-section\"><div class=\"mobile-department d-lg-none\">\n    <div class=\"container\">\n      \n      <ul class=\"mobile-department-list icon-image\">\n        \n          \n          \n          \n          \n\n          <li>\n            <a href=\"/collections/televisions\" class=\"lazyload waiting\">\n              \n                <img class=\"lazyload\" data-src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/files/icons-mobile-department-television-180w180h_180x_8122fd7e-85d6-4eb5-8922-36751c64da0a_46x.webp?v=1660042752\" />\n              \n              <span class=\"text\">التلفزيونات والصوتيات</span>\n            </a>\n          </li>\n        \n        \n          \n          \n          \n          \n\n          <li>\n            <a href=\"/collections/refrigerators\" class=\"lazyload waiting\">\n              \n                <img class=\"lazyload\" data-src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/files/icons-mobile-department-refrigerator-180x180h_180x_aad3c4b9-7019-44d5-abb8-1a3bf3848b86_46x.webp?v=1660042753\" />\n              \n              <span class=\"text\">الثلاجات</span>\n            </a>\n          </li>\n        \n        \n          \n          \n          \n          \n\n          <li>\n            <a href=\"/collections/washing-machines\" class=\"lazyload waiting\">\n              \n                <img class=\"lazyload\" data-src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/files/icons-mobile-department-washing-machines-180w180h_180x_dc5d009e-a544-4406-88d2-209e7bcbc783_46x.webp?v=1660042753\" />\n              \n              <span class=\"text\">غسالات الملابس</span>\n            </a>\n          </li>\n        \n        \n          \n          \n          \n          \n\n          <li>\n            <a href=\"/collections/air-conditioners\" class=\"lazyload waiting\">\n              \n                <img class=\"lazyload\" data-src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/files/icons-mobile-department-air-conditiners-180w180h_180x_0ea8003a-ab2e-45b8-b738-28b5163e06d4_46x.webp?v=1660042752\" />\n              \n              <span class=\"text\">Air Conditioners</span>\n            </a>\n          </li>\n        \n        \n          \n          \n          \n          \n\n          <li>\n            <a href=\"/collections/mobile-phones-and-tablets\" class=\"lazyload waiting\">\n              \n                <img class=\"lazyload\" data-src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/files/icons-mobile-department-smartphones-gadgets-180w-180h_180x_525ec6c5-8533-41c6-a025-10b085270455_46x.webp?v=1660042752\" />\n              \n              <span class=\"text\">الهواتف المحمولة والأجهزة اللوحية</span>\n            </a>\n          </li>\n        \n        \n          \n          \n          \n          \n\n          <li>\n            <a href=\"/collections/personal-care\" class=\"lazyload waiting\">\n              \n                <img class=\"lazyload\" data-src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/files/icons-mobile-department-personal-care-180_180x_c6c50522-2dc1-4965-bfc8-a5a6882a9b2c_46x.webp?v=1660042752\" />\n              \n              <span class=\"text\">أجهزة العناية الشخصية</span>\n            </a>\n          </li>\n        \n        \n      </ul>\n      \n    </div>\n  </div>\n\n</div>"
      ''';
  static String kHtmlPrefix = '''
  <!DOCTYPE html>
    <html>
      <head>
      <style>
      img{
        width:100% !important;
      }
      </style>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      </head>
      <body>
        <div style="margin-left: 15px; margin-right: 15px;">
      ''';
  static String kHtmlPostFix = '''
  </div>
  </body>
  </html>
  ''';

  static String web = """
  <div class=\"page-content\">
   \n
   <ol>
      \n
      <li>The Warranty shall be valid only upon presenting the original invoice of purchase or the selling slip indicating date of purchase, name of seller’s or retailer’s showroom or shop with due seals, and product serial &amp; model numbers. ALHAFIDH Group shall invalidate the Warranty if such information were modified or tinkered with, after the original purchase of the product.</li>
      \n
      <li>The liabilities of ALHAFIDH Group are limited to repaire the appliance or replace any faulty part of it, and not replacing the appliance itself.</li>
      \n
      <li>By virtue of this Warranty, the appliance shall be repaired only at service centers authorized by ALHAFIDH Group, otherwise the product shall be treated as being “not covered by Warranty”. Please call 6686 inside Iraq to find out addresses and locations of the authorized service centers or to request the on-site service.</li>
      \n
      <li>The table below shows the Warranty periods of the appliances, and their compressors/motors, depending on the appliances’ models:</li>
      \n
   </ol>
   \n
   <p> </p>
   \n
</div>
\n<div class=\"warranty-table-container\" >\n
<h3 class=\"text-center text-center pt-2\">ALHAFIDH Products Warranty</h3>
\n
<table class=\"warranty-table\">
   \n
   <thead>
      \n
      <tr>
         \n
         <th class=\"text-black\">Product Type</th>
         \n
         <th class=\"text-black\">Product Warranty</th>
         \n
         <th class=\"text-black\">Warranty Period <br>Compressor / Motor</th>
         \n
      </tr>
      \n
   </thead>
   \n
   <tbody>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Television</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"\"></td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Vacuum Cleaners</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"\"></td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">
            \n
            <p class=\"mb-0\">Room Heaters</p>
            \n
            <p class=\"mb-0\">Water Heaters</p>
            \n
            <p class=\"mb-0\">Water Dispensers</p>
            \n
         </td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"\"></td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">
            \n
            <p class=\"mb-0\">Air Purifiers</p>
            \n
            <p class=\"mb-0\">Air Coolers</p>
            \n
            <p class=\"mb-0\">Exhaust Fans</p>
            \n
         </td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"\"></td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">
            \n
            <p class=\"mb-0\">Standing Fans</p>
            \n
            <p class=\"mb-0\">Wall Fans</p>
            \n
         </td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Motor Warranty\">
            \n
            <p class=\"mb-0\">Fan Motor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">
            \n
            <p class=\"mb-0\">Ceiling Fans</p>
            \n
         </td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Motor Warranty\">
            \n
            <p class=\"mb-0\">Ceiling Fan Motor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Irons</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"\"></td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">
            \n
            <p class=\"mb-0\">Cookers</p>
            \n
            <p class=\"mb-0\">Microwave Ovens</p>
            \n
            <p class=\"mb-0\">Electric Ovens</p>
            \n
            <p class=\"mb-0\">Free Standing Cookers</p>
            \n
            <p class=\"mb-0\">Cooker Hoods</p>
            \n
         </td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"\"></td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Small Kitchen Appliances</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"\"></td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">
            \n
            <p class=\"mb-0\">Twin Tub Washing Machines</p>
            \n
         </td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">1.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(1 year from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Motor Warranty\">
            \n
            <p class=\"mb-0\">Inverter motor: 11 years</p>
            \n
            <p class=\"mb-0\">Standard motor: 1.5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Air Conditioners</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">3.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(3 years from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Compressor Warranty\">
            \n
            <p class=\"mb-0\">Inverter compressor: 11 years</p>
            \n
            <p class=\"mb-0\">Standard compressor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Refrigerators</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">3.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(3 years from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Compressor Warranty\">
            \n
            <p class=\"mb-0\">Inverter compressor: 11 years</p>
            \n
            <p class=\"mb-0\">Standard Compressor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Showcase Refrigerators</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">3.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(3 years from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Compressor Warranty  \">
            \n
            <p class=\"mb-0\">Inverter compressor: 11 years</p>
            \n
            <p class=\"mb-0\">Standard compressor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Freezers</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">3.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(3 years from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Compressor Warranty\">
            \n
            <p class=\"mb-0\">Inverter compressor: 11 years</p>
            \n
            <p class=\"mb-0\">Standard compressor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">Dishwashers</td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">3.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(3 years from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Motor Warranty\">
            \n
            <p class=\"mb-0\">Inverter motor: 11 years</p>
            \n
            <p class=\"mb-0\">Standard compressor/motor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
      <tr>
         \n
         <td data-column=\"Product Type\">
            \n
            <p class=\"mb-0\">Automatic Front Load Washing Machines<br>Top Load Washing Machines<br>Dryers</p>
            \n
         </td>
         \n
         <td data-column=\"Product Warranty\">
            \n
            <p class=\"mb-0\">3.5 years from the date of production</p>
            \n
            <p class=\"mb-0\">(3 years from the date of purchase)</p>
            \n
         </td>
         \n
         <td data-column=\"Motor Warranty\">
            \n
            <p class=\"mb-0\">Inverter motor: 11 years</p>
            \n
            <p class=\"mb-0\">Standard motor: 5 years</p>
            \n
            <p class=\"mb-0\">from the date of production</p>
            \n
         </td>
         \n
      </tr>
      \n
   </tbody>
   \n
</table>
\n</div>\n
<div class=\"warranty-table-container mt-5\" >
   \n
   <h3 class=\"text-center text-center pt-2\">Midea Products Warranty</h3>
   \n
   <table class=\"warranty-table\">
      \n
      <thead>
         \n
         <tr>
            \n
            <th class=\"text-black\">Product Type</th>
            \n
            <th class=\"text-black\">Product Warranty</th>
            \n
            <th class=\"text-black\">Warranty Period <br>Compressor / Motor</th>
            \n
         </tr>
         \n
      </thead>
      \n
      <tbody>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Water Dispensers, Microwave Ovens, Air Coolers, Fans, Air Purifiers, Small Kitchen Appliances, Built-in Appliances, Cooker Hoods, Vacuum Cleaners, Irons, Room Heaters, Electric Ovens</td>
            \n
            <td data-column=\"Product Warranty\">
               \n
               <p class=\"mb-0\">1 year from the date of purchase</p>
               \n
            </td>
            \n
            <td data-column=\"\"></td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Washing Machines</td>
            \n
            <td data-column=\"Product Warranty\">
               \n
               <p class=\"mb-0\">1 year from the date of purchase</p>
               \n
            </td>
            \n
            <td data-column=\"\">10 years  motor warranty</td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Dishwashers</td>
            \n
            <td data-column=\"Product Warranty\">
               \n
               <p class=\"mb-0\">2 years from the date of purchase</p>
               \n
            </td>
            \n
            <td data-column=\"\"><span>2 years  motor warranty</span></td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Refrigerators (Single Door, Showcase)</td>
            \n
            <td data-column=\"Product Warranty\">
               \n
               <p class=\"mb-0\">1 year from the date of purchase</p>
               \n
            </td>
            \n
            <td data-column=\"\"><span>5 years  motor warranty</span></td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Freezers (Chest, Upright, Showcase)</td>
            \n
            <td data-column=\"Product Warranty\">
               \n
               <p class=\"mb-0\">1 year from the date of purchase</p>
               \n
            </td>
            \n
            <td data-column=\"\"><span>5 years  motor warranty</span></td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Refrigerators (Top Mount)</td>
            \n
            <td data-column=\"Product Warranty\">
               \n
               <p class=\"mb-0\">1 year from the date of purchase</p>
               \n
            </td>
            \n
            <td data-column=\"\"><span>10 years  motor warranty</span></td>
            \n
         </tr>
         \n
      </tbody>
      \n
   </table>
   \n
</div>
\n
<div class=\"warranty-table-container mt-5\" >
   \n
   <h3 class=\"text-center text-center pt-2\">Panasonic Products Warranty</h3>
   \n
   <table class=\"warranty-table-2\">
      \n
      <thead>
         \n
         <tr>
            \n
            <th class=\"text-black\">Product Type</th>
            \n
            <th class=\"text-black\">Product Warranty</th>
            \n
            <th class=\"text-black\">Compressor / Motor <br>Warranty Period</th>
            \n
         </tr>
         \n
      </thead>
      \n
      <tbody>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Television</td>
            \n
            <td data-column=\"Product Warranty\">1 year from the date of purchase</td>
            \n
            <td data-column=\"\"></td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Washing Machines</td>
            \n
            <td data-column=\"Product Warranty\">1 year from the date of purchase</td>
            \n
            <td data-column=\"Compressor Warranty\">
               \n
               <p class=\"mb-0\">10 Years <sup class=\"asterisk-warranty-panasonic font-weight-bold\">*</sup></p>
               \n
            </td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Refrigerators</td>
            \n
            <td data-column=\"Product Warranty\">1 year from the date of purchase</td>
            \n
            <td data-column=\"Compressor Warranty\">
               \n
               <p class=\"mb-0\">10 Years <sup class=\"asterisk-warranty-panasonic font-weight-bold\">*</sup></p>
               \n
            </td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Personal Care</td>
            \n
            <td data-column=\"Product Warranty\">1 year from the date of purchase</td>
            \n
            <td data-column=\"\"></td>
            \n
         </tr>
         \n
         <tr>
            \n
            <td data-column=\"Product Type\">Air Conditioners</td>
            \n
            <td data-column=\"Product Warranty\">1 year from the date of purchase</td>
            \n
            <td data-column=\"Compressor Warranty\"></td>
            \n
         </tr>
         \n
      </tbody>
      \n
   </table>
   \n
   <div class=\"container product-registration-panasonic\">
      \n
      <div class=\"col m-auto p-2 text-center\">
         \n<button type=\"button\" class=\"btn btn-product-register btn-sm btn-dark text-white border rounded-pill shadow-sm mb-1\" data-toggle=\"modal\" data-target=\"#registerProductModal\"> Activate your 10 years warranty <i class=\"fa fa-window-maximize pl-2\"></i> </button>\n
         <p class=\"warranty-terms-subtext text-center mb-0\"><sup class=\"asterisk-warranty-panasonic font-weight-bold text-primary\">*</sup>Terms and conditions apply.</p>
         \n
      </div>
      \n
   </div>
   \n
   <div class=\"modal fade\" id=\"registerProductModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"registerProductModal\">
      \n
      <div class=\"modal-dialog modal-dialog-centered modal-lg\" role=\"document\">
         \n
         <div class=\"modal-content\">
            \n
            <div class=\"modal-header\">
               \n
               <h5 class=\"modal-title\">Panasonic Product Registration Guide</h5>
               \n<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"> <span aria-hidden=\"true\">×</span> </button>\n
            </div>
            \n
            <div class=\"modal-body\">
               \n<!-- Carousel markup goes in the modal body -->\n
               <div id=\"productRegistrationCarousel\" class=\"carousel slide\" data-ride=\"carousel\">
                  \n
                  <div class=\"carousel-inner text-center\">
                     \n
                     <div class=\"carousel-item active\">
                        \n
                        <h3>Step 1</h3>
                        \n<img src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/t/339/assets/Step-1-Product_Registration_x500.jpg?v=152966393795700886691617090722\" alt=\"\" data-slide-to=\"0\">\n
                     </div>
                     \n
                     <div class=\"carousel-item\">
                        \n
                        <h3>Step 2</h3>
                        \n<img src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/t/339/assets/Step-2-Product_Registration_x500.jpg?v=122941813809242246181617090722\" alt=\"\" data-slide-to=\"1\">\n
                     </div>
                     \n
                     <div class=\"carousel-item\">
                        \n
                        <h3>Step 3</h3>
                        \n<img src=\"//cdn.shopify.com/s/files/1/0281/4299/3467/t/339/assets/Step-3-Product_Registration_x500.jpg?v=96396276705548023531617090723\" alt=\"\" data-slide-to=\"2\">\n
                     </div>
                     \n
                  </div>
                  \n<a class=\"carousel-control-prev\" href=\"#productRegistrationCarousel\" role=\"button\" data-slide=\"prev\"> <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span> <span class=\"sr-only\">Previous</span> </a> <a class=\"carousel-control-next\" href=\"#productRegistrationCarousel\" role=\"button\" data-slide=\"next\"> <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span> <span class=\"sr-only\">Next</span> </a>\n
               </div>
               \n
            </div>
            \n
            <div class=\"modal-footer\">\n<button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\"> Close </button> <button type=\"button\" class=\"btn btn-modal-product-register text-white\"> <a class=\"text-light\" href=\"https://www.panasonic.com/middleeast/support.html\" target=\"_blank\" rel=\"noopener noreferrer\"> Start Activation Process</a> </button>\n</div>
            \n
         </div>
         \n
      </div>
      \n
   </div>
   \n
</div>
\n
<style>
   <!--\nbutton.btn-modal-product-register,\n      button.btn-product-register{\n          background-color: #ff5000;\n          color: #ffffff;\n      }\n      button.btn-product-register{\n          padding: 10px 30px;\n          line-height: 15px;\n      }\n      .carousel-control-next,\n      .carousel-control-prev{\n          background-image: linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);\n      }\n-->
</style>
\n
<div id=\"col-main\" class=\"page-content\">
   \n
   <div class=\"warranty-table-container mt-5\"></div>
   \n<!-- Samsung warranty info -->\n
   <div class=\"warranty-table-container mt-5 p-2\">
      \n
      <h3 class=\"text-center text-center pt-2\">Samsung Products Warranty</h3>
      \n<p style=\"border-top: 1px solid #fc5000;\">The Samsung products carry a full warranty for the period specified in the Product Warranty Guide and the service is provided Exclusively by Samsung Authorized Service Centers across Iraq. Some Samsung products carry different warranty periods due to the nature of the product's design, manufacture or expected use, the warranty applies from the date of purchase by the first customer.</p>\n<span>For more details,</span> <span>please visit <a class=\"font-weight-bold is-selected\" href=\"https://www.samsung.com/ae_ar/support/\" aria-selected=\"true\" target=\"_blank\" rel=\"noopener noreferrer\">Samsung Warranty and Product Registration page</a>.</span>\n
   </div>
   \n<br>
   <hr>
   \n
   <div class=\"warranty-disclaimer\">
      \n
      <h3>Please be noted that the Warranty shall not cover the following:</h3>
      \n
      <ol>
         \n
         <li>
            \n
            <p>Regular maintenance, improper installation, violating the technical and safety instructions indicated in the appliance users’ manual, damage to the appliance structure, consumables like tubes, buttons, switches, remote controllers, filters, etc., defects due to mishandling or using improper accessories not approved by ALHAFIDH Group, abuse of product, and electric currents’ fluctuations besides any electronic, mechanical or electrical flaws resulting from operating the appliance at lower voltage than recommended.</p>
            \n
         </li>
         \n
         <li>
            \n
            <p>Any damage or mutilation caused by improper transportation or storage of the appliance.</p>
            \n
         </li>
         \n
         <li>Any cause of damage or mutilation considered beyond ALHAFIDH Group’s control or in cases of fires, improper ventilation, lightning, accidents, and soaking or spraying with water.</li>
         \n
      </ol>
      \n<br>\n
      <p class=\"mb-0\">Disclaimer:</p>
      \n<sub>The above terms and conditions are limited to the service of the appliances, and the customer shall be liable to any costs relating to the cases not covered by the Warranty as mentioned above. ALHAFIDH Group reserves its right to take final decisions regarding any problem whatsoever, and Al Hafidh Group shall take the necessary proper action. The terms and conditions of this Warranty are subject to change without any prior notification. Any modifications related to the Warranty information shall be duly published on www.alhafidh.com.</sub>\n
   </div>
   \n
   <hr>
   \n
</div>
  """;

  static List filterItemList = [
    {
      "ALHAFIDH": "الحافظ",
      "Panasonic": "باناسونيك",
      "Samsung": "سامسونج",
      "Midea": "مايديا",
      "Electrolux": "الكترولوكس",
      "Huawei": "هواوي",
      "Apple": "أبل",
      "Soovon": "سوفون",
      "Refrigerator": "الثلاجات",
      "Television": "التلفزيونات",
      "Vacuum Cleaner": "المكانس الكهربائية",
      "Front Load Washing Machine": "غسالات تحميل امامي",
      "Wall Mounted Split AC": "تبريد جداري",
      "Microwave Oven": "أفران الميكروويف",
      "Top Load Washing Machine": "غسالات تعبئة علوية",
      "Steam Iron": "مكاوي بخارية",
      "Water Dispenser": "برادات الماء",
      "Built-in Gas Hob": "طباخات غازية مدمجة",
      "Blender": "Blenders",
      "Chest Freezer": "مجمدات أفقية",
      "Cooker Hood": "شفاطات طباخ",
      "Smartphone": "الهواتف الذكية",
      "Floor Standing AC": "تبريد عمودي",
      "Room Heater": "المدافئ",
      "Built-in Electric Oven": "أفران كهربائية مدمجة",
      "Dishwasher": "غسالات الصحون",
      "Face Shaver & Trimmer": "ماكينات حلاقة وتشذيب لشعر الوجه",
      "Free Standing Cooker": "طباخات قائمة بذاتها",
      "Hair Dryer": "مجففات الشعر",
      "Hair Straightener": "مسّرِح الشعر",
      "Meat Grinder": "فرامات اللحم",
      "Window Type AC": "تبريد شباكي",
      "Air Fryer": "قلايات هوائية",
      "Electric Kettle": "غلايات كهربائية",
      "Air Cooler": "مبردة هواء",
      "Dry Iron": "مكاوي جافة",
      "Twin Tub Washing Machine": "غسالات بحوضين",
      "Built in Microwave Oven": "أفران ميكروويف مدمجة",
      "Garment Steamer": "مكاوي بخارية عمودية ومحمولة",
      "Ceiling Fan": "مروحة سقفية",
      "Hair Styler": "مصفف الشعر",
      "Hand Blender": "خلاطات يدوية",
      "Home Theater System": "سينما منزلية",
      "Juicer": "عصارات",
      "Upright Freezer": "مجمدات عمودية",
      "Huawei Smartband": "هواوي سمارت باند",
      "Rice Cooker": "قدور صنع الرز",
      "Stand Fan": "مروحة عمودية",
      "Water Heater": "سخانات الماء",
      "Air Purifier": "منقيات الهواء",
      "Cassette Type AC": "تبريد كاسيت",
      "Coffee Maker": "صانعة القهوه",
      "Exhaust Fan": "ساحبة هواء",
      "Food Processor": "محضرات الطعام",
      "Hand Mixer": "خلاط يدوي",
      "Mixer Grinder": "خلاطات متعددة الوظائف",
      "Smartwatch": "الساعات الذكية",
      "Wireless Speaker System": "نظام سماعات لاسلكية",
      "Air Curtain": "ستائر هوائية",
      "Built-in Electric Hob": "مسطحات كهربائية مدمجة",
      "Built-in Gas Oven": "أفران غازية مدمجة",
      "Dryer": "مجففات",
      "Epilator": "ماكينة إزالة الشعر",
      "Portable AC": "تبريد متحرك",
      "Pressure Cooker": "قدور الضغط",
      "Stand Mixer": "خلاطات بقاعدة",
      "Toaster": "أجهزة توستر",
      "Body Shaver": "ماكينات حلاقة لشعر الجسم",
      "DVD Stereo System": "مجففات",
      "Electric Oven": "أفران كهربائية",
      "Electric Oven Toaster": "أفران تحميص كهربائية",
      "Mini System": "الأنظمة الصغيرة",
      "Oven Toaster": "أجهزة توستر",
      "Sandwhich Maker": "صانعة سندويشات",
      "Showcase Freezer": "مجمدات عارضة",
      "Wall Fan": "مروحة جدارية",
      "Water Purifier": "منقيات الماء",
      "Canister": "كانستر",
      "Tank": "برميل",
      "8K QLED TVs": "تلفزيونات 8K QLED",
      "4K QLED TVs": "تلفزيونات 4K QLED",
      "4K UHD TVs": "تلفزيونات 4K UHD",
      "4K OLED TVs": "تلفزيونات 4K OLED",
      "4K HDR TVs": "تلفزيونات 4K HDR",
      "FHD TVs": "FHD تلفزيونات",
      "FHD/HD TVs": "تلفزيونات FHD / HD",
      "Mini LED TVs": "تلفزيونات ميني إل إي دي",
      "Women Personal Care": "العناية الشخصية للنساء",
      "Men Personal Care": "العناية الشخصية للرجال",
      "Washer": "غسالات",
      "Dryer": "مجففات",
      "Combo Washer & Dryer": "غسالات كومبو (غسل وتجفيف كامل)",
      "1 Ton": "1 طن",
      "1.5 Ton": "1.5 طن",
      "2 Ton": "2 طن",
      "2.5 Ton": "2.5 طن",
      "3 Ton": "3 طن",
      "4 Ton": "4 طن",
      "5 Ton": "5 طن",
      "Cooling Only": "تبريد فقط",
      "cooling only": "تبريد فقط",
      "Cooling and Heating": "تدفئة وتبريد",
      "cooling and heating": "تدفئة وتبريد",
      "Normal": "عادي",
      "Inverter": "تقنية الانفيرتر",
      "French Door": "باب فرنسي",
      "Multi Door": "متعددة الأبواب",
      "Side-By-Side": "بابين متقابلين",
      "Single Door": "ذات باب واحد",
      "Top Mount": "بمجمدة علوية",
      "3 Burners": "3 مشاعل",
      "4 Burners": "4 مشاعل",
      "5 Burners": "5 مشاعل",
      "3CF": "3 قدم",
      "5CF": "5 قدم",
      "10CF": "10 قدم",
      "11CF": "11 قدم",
      "12CF": "12 قدم",
      "13CF": "13 قدم",
      "14CF": "14 قدم",
      "15CF": "15 قدم",
      "16CF": "16 قدم",
      "17CF": "17 قدم",
      "18CF": "18 قدم",
      "20CF": "20 قدم",
      "21CF": "21 قدم",
      "22CF": "22 قدم",
      "23CF": "23 قدم",
      "24CF": "24 قدم",
      "25CF": "25 قدم",
      "26CF": "26 قدم",
      "27CF": "27 قدم",
      "29CF": "29 قدم",
      "30CF": "30 قدم",
      "31CF": "31 قدم",
      "39CF": "39 قدم",
      "7KG": "7 كجم",
      "8KG": "8 كجم",
      "9KG": "9 كجم",
      "10KG": "10 كجم",
      "11KG": "11 كجم",
      "12KG": "12 كجم",
      "13KG": "13 كجم",
      "13.5KG": "13.5 كجم",
      "14KG": "14 كجم",
      "15KG": "15 كجم",
      "16KG": "16 كجم",
      "17KG": "17 كجم",
      "18KG": "18 كجم",
      "20KG": "20 كجم",
      "21KG": "21 كجم",

      "in-stock": "متوفر",
      "out-of-stock": "نفدت الكمية",
    }
  ];

  static List menuItemList = [{
    "TV & Audio": "التلفزيونات والصوتيات",
    "All TVs": "جميع التلفزيونات",
    "TVs by Type": "التلفزيونات حسب النوع",
    "8K QLED TVs": "تلفزيونات 8K QLED",
    "4K QLED TVs": "4K QLED TVs",
    "4K OLED TVs": "تلفزيونات 4K OLED",
    "4K UHD TVs": "تلفزيونات 4K UHD",
    "4K HDR TVs": "تلفزيونات 4K HDR",
    "FHD TVs": "FHD تلفزيونات",
    "Mini LED TVs": "تلفزيونات ميني إل إي دي",
    "TVs by Size": "التلفزيونات حسب القياس",
    "82\" or bigger TV": "82\" أو أكبر",
    "Audio & Video": "نظمة الصوت والفيديو",
    "Home Theater Systems": "سينما منزلية",
    "Audio & Video Systems": "أنظمة الصوت والفيديو",
    "Wireless Speakers": "سماعات لاسلكية",

    "Home Appliances": "الأجهزة المنزلية",
    "Refrigerators": "الثلاجات",
    "No Frost Refrigerators": "ثلاجات نظام بخاخ",
    "Direct Cool Refrigerators": "ثلاجات نظام تجميد",
    "Showcase Refrigerators": "ثلاجات عارضة",
    "Smart Table": "طاولات ذكية",
    "Washing Machines": "غسالات ومجففات",
    "Top Loading Washing Machines": "غسالات تحميل علوي",
    "Front Loading Washing Machines": "غسالات تحميل جانبي",
    "Twin Tub Washing Machines": "غسالات بحوضين",
    "Combo (Washer & Dryer)": "غسالات كومبو (غسل وتجفيف كامل)",
    "Dryers": "مجففات",
    "Freezers": "مجمدات",
    "Chest Freezers": "مجمدات أفقية",
    "Showcase Freezers": "مجمدات عارضة",
    "Upright Freezers": "مجمدات عمودية",
    "Dishwashers": "غسالات الصحون",
    "Countertop Dishwashers": "غسالات صحون منضدية ",
    "Free Standing Dishwashers": "غسالات صحون قائمة بذاتها ",
    "Cookers & Hobs": "الطباخات",
    "Free Standing Cookers": "طباخات قائمة بذاتها",
    "Built-in Hobs": "طباخات مدمجة",
    "Ovens": "أفران",
    "Table Top Ovens": "أفران منضدية",
    "Built-in Ovens": "أفران مدمجة",
    "Table Top Microwave Ovens": "أجهزة مايكرويف منضدية ",
    "Built-in Microwave Ovens": "أجهزة مايكرويف مدمجة",
    "Built-in Kitchen Appliances": "أجهزة المطبخ المدمجة",
    "Built-in Coffee Makers": "أجهزة صنع القهوة",
    "Built-in Hobs": "طباخات مدمجة",
    "Built-in Microwave Ovens": "أجهزة مايكرويف مدمجة",
    "Built-in Ovens": "أفران مدمجة",
    "Cooker Hoods": "شفاطات طباخ",
    "Small Kitchen Appliances": "أجهزة المطبخ الصغيرة",
    "Air Fryers": "قلايات هوائية",
    "Blenders": "خلاطات",
    "Coffee Makers": "صانعة القهوه",
    "Dough Makers": "عجانات",
    "Electric Kettles": "غلايات كهربائية",
    "Food Processors": "محضرات الطعام",
    "Juicers": "عصارات",
    "Meat Grinders": "فرامات اللحم",
    "Pressure Cookers": "قدور الضغط",
    "Tea Makers": "صانعة الشاي",
    "Water Dispensers": "برادات الماء",
    "Free Standing Water Dispensers": "برادات ماء عمودية",
    "Counter Top Water Dispensers": "برادات ماء منضدية",
    "Water Purifiers": "منقيات الماء",
    "RO Water Purifier": "منظومة تنقية المياه",
    "Water Heaters": "سخانات الماء",
    "Electric Water Heaters": "سخانات الماء الكهربائية",
    "Room Heaters": "المدافئ",
    "Oil Heaters": "مدافىء زيتية",
    "Electric Room Heaters": "مدافئ كهربائية",
    "Irons and Steamers": "المكاوي والبواخر",
    "Dry Irons": "مكاوي جافة",
    "Steam Irons": "مكاوي بخارية",
    "Garment Steamers": "مكاوي بخارية عمودية ومحمولة",
    "Vacuum Cleaners": "المكانس الكهربائية",
    "All Vacuum Cleaners": "جميع المكانس الكهربائية",
    "Tank": "مكانس كهربائية (برميل)",
    "Canister": "مكانس كهربائية (كانستر)",

    "Air Conditioners": "أجهزة التبريد",
    "Wall Mounted Split AC": "تبريد جداري",
    "Floor Standing Split AC": "تبريد عمودي",
    "Window Type AC": "تبريد شباكي",
    "Cassette Type AC": "تبريد كاسيت",
    "Portable AC": "تبريد متحرك",
    "Fans & Air Coolers": "مراوح و مبردات الهواء",
    "Air Coolers": "مبردة هواء",
    "Stand Fans": "مروحة عمودية",
    "Wall Fans": "مروحة جدارية",
    "Ceiling Fans": "مروحة سقفية",
    "Exhaust Fans": "ساحبة هواء",
    "Air Purifiers": "منقيات الهواء",
    "Air Curtains": "ستائر هوائية",

    "Personal Care": "أجهزة العناية الشخصية ",
    "For Men": "للرجال",
    "Body Shavers": "ماكينات حلاقة لشعر الجسم",
    "Face Shavers & Trimmers": "ماكينات حلاقة وتشذيب لشعر الوجه",
    "For Women": "للنساء",
    "Hair Dryers": "مجففات الشعر",
    "Hair Straighteners": "مسّرِح الشعر",
    "Hair Stylers": "مصفف الشعر",
    "Epilators & Hair Removers": "ماكينات إزالة الشعر",

    "Mobiles & Tablets": "الهواتف والأجهزة اللوحية",
    "Smartphones": "الهواتف الذكية",
    "Apple": "أبل",
    "Samsung": "سامسونج",
    "Huawei": "هواوي",
    "Smartwatches": "الساعات الذكية",
    "Huawei Smartbands": "هواوي سمارت باند",
    "Tablets": "الأجهزة اللوحية",
    "Mobile Accessories": "اكسسوارات الهاتف",
    "Mobile Earphones": "سماعات الهاتف",
    "Other Mobile Accessories": "اكسسوارات هاتف أخرى",
    "Offers": "العروض",
    "Downloads": "قسم التحميل",
    "Wishlist": "القائمة المفضلة"
  }
  ];

  static List storeloactorlist=[{
    "1. Baghdad Showroom": "1. معرض بغداد",
    "2. Karbala Showroom": "2. معرض كربلاء",
    "3. Basra Showroom": "3. معرض البصرة",
    "4. Basra Showroom 2 ": "4. معرض البصرة 2",
    "5. Nasriya Showroom ": "5. معرض الناصرية",
    "6. Erbil Showroom": "6. معرض اربيل",
    "7. Mousil": "7. معرض الموصل",
    "Baghdad SVC Center - Dora": "مركز صيانة بغداد - الدورة",
    "Basra SVC Center": "مركز صيانة البصرة",
    "Karbala SVC Center": "مركز صيانة كربلاء",
    "Mousil SVC Center": "مركز صيانة الموصل",
    "Mousil SVC Center, Al Faisaliya": "مركز صيانة الموصل, الفيصلية",
    "Karbala SVC Center, Hay Al Mowadhafeen": "مركز صيانة كربلاء, حي الموظفين",
    "Basra SVC Center, Al Woufood Street": "مركز صيانة البصرة, شارع الوفود",
    "Baghdad SVC Center - Dora, Beside Shawati Dejla Petrol Station": "مركز صيانة بغداد - الدورة، قرب محطة وقود شواطئ دجلة"
  }];

  // APIs Tkn
  static String kATkn = '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';
  static String kStTkn = 'e0b84cff8bef66fc05eafc9f8c060c7e';
}
