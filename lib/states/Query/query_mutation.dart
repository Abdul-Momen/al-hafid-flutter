import 'package:alhafidh/states/HelperUtils/global_constant.dart';
import 'package:gql/language.dart';

class AuthQuery {
  static final login = parseString('''
mutation customerAccessTokenCreate(\$input: CustomerAccessTokenCreateInput!) {
  customerAccessTokenCreate(input: \$input) {
    customerUserErrors {
      code
      field
      message
    }
    customerAccessToken {
      accessToken
      expiresAt
    }
  }
}
  ''');
  static final relatedProduct = parseString('''
query productRecommendations (\$productId: ID!,\$variantsFirst: Int = 1, \$imagesFirst: Int = 5){
   productRecommendations (productId: \$productId) {
        id
        title
        handle
        vendor
        tags
        images(first: \$imagesFirst) {
          edges {
            node {
              originalSrc
              altText
            }
          }
        }
        productType
        variants(first: \$variantsFirst) {
          edges {
            node {
              id
              sku
              availableForSale
              compareAtPriceV2 {
                amount
                currencyCode
              }
              priceV2 {
                amount
                currencyCode
              }
            } 
          }
        }     
      }
}
  ''');

  static final addNote = parseString('''
 mutation cartNoteUpdate(\$cartId: ID!,\$note: String) {
  cartNoteUpdate(cartId: \$cartId, note: \$note) {
    cart {
        id
        createdAt
        updatedAt
        note
        lines(first: 10) {
        edges {
            node {
            id
            quantity
            
            merchandise {
                
              
                ... on ProductVariant {
                id
                product{
                    title
                }
                sku
                availableForSale
                compareAtPriceV2 {
                        amount
                        currencyCode
                    }
                    priceV2 {
                        amount
                        currencyCode
                    }
                    image {
                        originalSrc
                        altText
                    } 
                }
            }
            attributes {
                key
                value
            }
            }
        }
        }
        attributes {
        key
        value
        }
        cost {
        totalAmount {
            amount
            currencyCode
        }
        subtotalAmount {
            amount
            currencyCode
        }
        totalTaxAmount {
            amount
            currencyCode
        }
        totalDutyAmount {
            amount
            currencyCode
        }
        }
        buyerIdentity {
        email
        phone
        customer {
            id
        }
        countryCode
        }
    }
    userErrors {
      field
      message
    }
  }
}
  ''');

  static final applyCode = parseString('''
 mutation checkoutDiscountCodeApplyV2(\$checkoutId: ID!, \$discountCode: String!) {
  checkoutDiscountCodeApplyV2(checkoutId: \$checkoutId, discountCode: \$discountCode) {
    checkout {
      id
      totalPrice{
        amount
      }
    }
    checkoutUserErrors {
      code
      field
      message
    }
  }
}
  ''');

  static final removeCode = parseString('''
 mutation checkoutDiscountCodeRemove(\$checkoutId: ID!) {
  checkoutDiscountCodeRemove(checkoutId: \$checkoutId) {
    checkout {
      id
      totalPrice{
        amount
      }
    }
    checkoutUserErrors {
      code
      field
      message
    }
  }
}
  ''');

  static final customer = parseString('''
query customer(\$customerAccessToken: String!) {   
  customer(customerAccessToken: \$customerAccessToken) {
    id
    firstName
    lastName
    email
    phone
  }
}
  ''');
  static final resetPassword = parseString('''
mutation customerRecover(\$email: String!) {
  customerRecover(email: \$email) {
    customerUserErrors {
      code
      field
      message
    }
  }
}
  ''');

  static final createCart = parseString('''
mutation cartCreate(\$merchandiseId: ID!, \$quantity: Int = 0)
 {
  cartCreate(
    input: {
      lines: [
        {
          quantity: \$quantity
          merchandiseId: \$merchandiseId
        }
      ]
      
    }
  ) {
    cart {
      id
      createdAt
      updatedAt
      lines(first: 10) {
        edges {
          node {
            id
            merchandise {
              ... on ProductVariant {
                id
              }
            }
          }
        }
      }
      
    }
  }
}
  ''');

  static final updateCart = parseString('''
mutation cartLinesUpdate(\$cartId: ID!, \$lines: [CartLineUpdateInput!]!) {
  cartLinesUpdate(cartId: \$cartId, lines: \$lines) {
    cart {
      id
      createdAt
      updatedAt
      lines(first: 10) {
        edges {
          node {
            id
            quantity
            merchandise {
              ... on ProductVariant {
                id
              }
            }
          }
        }
      }
    }
    userErrors {
      field
      message
    }
  }
}
  ''');

  static final createAnotherCart = parseString('''
mutation cartLinesAdd(\$cartId: ID!, \$lines: [CartLineInput!]!) {
  cartLinesAdd(cartId: \$cartId, lines: \$lines) {
    cart {
       id
      createdAt
      updatedAt
      lines(first: 10) {
        edges {
          node {
            id
            merchandise {
              ... on ProductVariant {
                id
              }
            }
          }
        }
      }
    }
    userErrors {
      field
      message
    }
  }
}
  ''');

  static final removeFromCart = parseString('''
mutation cartLinesRemove(\$cartId: ID!, \$lineIds: [ID!]!) {
  cartLinesRemove(cartId: \$cartId, lineIds: \$lineIds) {
    cart {
      id
      createdAt
      updatedAt
      lines(first: 100) {
        edges {
          node {
            id
            merchandise {
              ... on ProductVariant {
                id
              }
            }
          }
        }
      }
    }
    userErrors {
      field
      message
    }
  }
}
  ''');

  static final retriveCart = parseString('''
query cart(\$id: ID!)
  {
  cart(
    id: \$id
  ) {
    id
    createdAt
    updatedAt
    lines(first: 10) {
      edges {
        node {
          id
          quantity
          
          merchandise {
            
              
            ... on ProductVariant {
              id
              product{
                  id
                  title
              }
              sku
              availableForSale
              compareAtPriceV2 {
                    amount
                    currencyCode
                }
                priceV2 {
                    amount
                    currencyCode
                }
                image {
                    originalSrc
                    altText
                } 
            }
          }
          attributes {
            key
            value
          }
        }
      }
    }
    attributes {
      key
      value
    }
    cost {
      totalAmount {
        amount
        currencyCode
      }
      subtotalAmount {
        amount
        currencyCode
      }
      totalTaxAmount {
        amount
        currencyCode
      }
      totalDutyAmount {
        amount
        currencyCode
      }
    }
    buyerIdentity {
      email
      phone
      customer {
        id
      }
      countryCode
    }
  }
}
  ''');

  static final getAllCategory = parseString('''
{
  menu(handle:"menu-for-mobileapp"){
      id
      title
      itemsCount
      handle
    items{
        id
        resourceId
        title
        tags
        type
        url
        items{
            id
            resourceId
            title
            tags
            type
            url
            items{
                id
                resourceId
                title
                tags
                type
                url
            }
        }
    }
  
  }
}
  ''');

  static final addAddress = parseString('''
mutation customerAddressCreate(\$address: MailingAddressInput!, \$customerAccessToken: String!) {
  customerAddressCreate(address: \$address, customerAccessToken: \$customerAccessToken) {
    customerAddress {
        id
        firstName
        lastName
        phone
    }
    customerUserErrors {
      code
      field
      message
    }
  }
}

  ''');

  static final updateAddress = parseString('''
  mutation customerAddressUpdate(\$address: MailingAddressInput!, \$customerAccessToken: String!, \$id: ID!) {
  customerAddressUpdate(address: \$address, customerAccessToken: \$customerAccessToken, id: \$id) {
    customerAddress {
        firstName
        lastName
        company
        phone
    }
    customerUserErrors {
      code
      field
      message
    }
  }
}
  ''');

  static final updateCustomerInfo = parseString('''
mutation customerAddressUpdate(\$address: MailingAddressInput!, \$customerAccessToken: String!, \$id: ID!) {
  customerAddressUpdate(address: \$address, customerAccessToken: \$customerAccessToken, id: \$id) {
    customerAddress {
        firstName
        lastName
        company
        phone
    }
    customerUserErrors {
      code
      field
      message
    }
  }
}
  ''');

  static final deleteAddress = parseString('''
  mutation customerAddressDelete(\$customerAccessToken: String!, \$id: ID!) {
  customerAddressDelete(customerAccessToken: \$customerAccessToken, id: \$id) {
    customerUserErrors {
      code
      field
      message
    }
    deletedCustomerAddressId
  }
}
  ''');

  static final defaultAddress = parseString('''
 mutation customerDefaultAddressUpdate(\$addressId: ID!, \$customerAccessToken: String!) {
  customerDefaultAddressUpdate(addressId: \$addressId, customerAccessToken: \$customerAccessToken) {
    customer {
        firstName
        lastName
        phone
    }
    customerUserErrors {
      code
      field
      message
    }
  }
}
  ''');

  static final createCartCheckout = parseString('''
mutation checkoutCreate(\$lineItems: [CheckoutLineItemInput!]!){
    checkoutCreate(input: {
    lineItems: \$lineItems
    
  } ) {
    checkout {
       id
       webUrl
       lineItems(first: 5) {
         edges {
           node {
                id
                title
                quantity
                variant{
                price{
                    amount
                }
            }         
            
           }
         }
       }
    }
  }
}
  ''');

  static final createBuyNowCheckout = parseString('''
mutation checkoutCreate(\$merchandiseId: ID!, \$quantity: Int = 0)
{
  checkoutCreate(input: {
    lineItems: [{ variantId: \$merchandiseId, quantity: \$quantity }]
  } ) {
    checkout {
       id
       webUrl
       lineItems(first: 5) {
         edges {
           node {
            id
             title
             quantity
           }
         }
       }
    }
  }
}
  ''');

  static final associateCustomerCheckout = parseString('''
  mutation associateCustomerWithCheckout(\$checkoutId: ID!, \$customerAccessToken: String!) {
  checkoutCustomerAssociateV2(checkoutId: \$checkoutId, customerAccessToken: \$customerAccessToken) {
    checkout {
      id
      totalPrice {
        amount
      }
    }
    checkoutUserErrors {
      code
      field
      message
    }
    customer {
      id
      email
      phone
      
    }
  }
}
  ''');

  static final setShippingAddress = parseString('''
  mutation checkoutShippingAddressUpdateV2(\$shippingAddress: MailingAddressInput!, \$checkoutId: ID!) {
  checkoutShippingAddressUpdateV2(shippingAddress: \$shippingAddress, checkoutId: \$checkoutId) {
    checkoutUserErrors {
      code
      field
      message
    }
    checkout {
      id
      totalPrice {
        amount
      }
      shippingAddress {
        firstName
        lastName
        address1
        province
        country
        zip
      }
    }
  }
}
  ''');

  static final getShippingRate = parseString('''
  query node(\$checkoutId: ID!){
  node(id: \$checkoutId) {
    ... on Checkout {
      id
      webUrl
      totalPrice {
        amount
      }
          
      availableShippingRates {
        ready
        shippingRates {
          handle
          price {
            amount
          }
          title
        }
      }
    }
  }
}
  ''');

  static final setShippingRate = parseString('''
 mutation checkoutShippingLineUpdate(\$checkoutId: ID!, \$shippingRateHandle: String!) {
  checkoutShippingLineUpdate(checkoutId: \$checkoutId, shippingRateHandle: \$shippingRateHandle) {
    checkout {
      id
      subtotalPrice{
          amount
      }
      totalPrice{
        amount
      }
    }
    checkoutUserErrors {
      code
      field
      message
    }
  }
}
  ''');

  static final getCollectionId = parseString('''
query getCollectionIdFromHandle(\$handle: String!) {
  collectionByHandle(handle: \$handle) {
    id
  }
}
  ''');

  static final setGuestShippingAddress = parseString('''
mutation checkoutShippingAddressUpdateV2(\$shippingAddress: MailingAddressInput!, \$checkoutId: ID!) {
  checkoutShippingAddressUpdateV2(shippingAddress: \$shippingAddress, checkoutId: \$checkoutId) {
    checkoutUserErrors {
      code
      field
      message
    }
    checkout {
      id
      subtotalPrice{
        amount
      }
      totalPrice {
        amount
      }
      email
      shippingAddress {
        firstName
        lastName
        address1
        province
        country
        zip
      }
    }
  }
}
  ''');
}