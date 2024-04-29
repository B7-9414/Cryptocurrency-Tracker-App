# Crypto Tracker Mobile App User Guide

1. **Onboarding and Walkthrough**: When a user installs the app for the first time, they will encounter an onboarding/walkthrough sequence. In the final step of the walkthrough, the user must enter a username or email.

2. **Local Push Notification**: After entering the email or username in the last step of the walkthrough, the user will receive a local push notification. Please exit the mobile app to view the notification.

3. **Cryptocurrency List**: The app displays a list of 100 cryptocurrencies sourced from the following Coingecko APIs:
   - [Cryptocurrency Markets](https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h)
   - [Global Cryptocurrency Data](https://api.coingecko.com/api/v3/global)

4. **User Interface**:
   - Chevron icons for navigation between wallet/portfolio pages, with a stylish shadow effect.
   - Prominent plus button for adding new entries, along with easily accessible settings and add options.

5. **Filtering Options**:
   - Users can filter the list of cryptocurrencies in ascending order (from 100 to 1) or reverse the order.
   - Filtering options include sorting by specific coin prices, such as highest and lowest prices.

6. **Wallet/Portfolio Management**:
   - Users can add, edit, and delete coins from their wallets/portfolios.
   - After adding coins to their wallet, users can filter entries by prices, coins, or holdings.

7. **Adding Coins**:
   - Two methods for adding coins to the wallet/portfolio: sliding right on the main page for specific coins or using the plus button located in the app's corner.

8. **Security Features**:
   - Users can enhance app security by setting a PIN code or enabling Face ID authentication under Settings > Privacy and Security.
   - Please note that running the app on a real device is necessary to utilize full functionality, including Keychain and biometric features.

9. **Haptic Feedback**:
   - Haptic is triggered when entering a PIN code for added user experience.

10. **Coin Details and Descriptions**:
    - Users can view overall details and descriptions of specific coins, with the option to expand for more information.
    - Clicking on the "Website" link redirects users to external sources for additional coin details.
    - The app also provides a visual chart displaying weekly data from Coingecko APIs.
    - [Global Description Cryptocurrency Data]([https://api.coingecko.com/api/v3/global](https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false))

11. **Color Indicators**:
    - The main page features color indicators (red and green) and triangular markers to signify changes in specific coin prices based on percentage changes from the APIs.

**Notes**:
1. The app does not support offline functionality, and there may be occasional delays in loading coin lists.
2. The onboarding process occurs only once after initial app installation. To retrigger the walkthrough, please uninstall and reinstall the app.
3. Core Data is utilized for managing timestamps, coin IDs, and portfolio amounts, ensuring data persistence even after the app is closed.

