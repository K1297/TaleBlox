  <div align="center">
  <h1>TaleBlox</h1>
  <p>
    <strong>Craft stories, mint NFTs, reward authors on Internet Computer Protocol</strong>
  </p>

</div>

TaleBlox is your portal to boundless creativity. Craft compelling narratives and effortlessly transform them into captivating NFT art. Reward authors, explore limitless storytelling possibilities, and celebrate the fusion of words and visuals in the world of TaleBlox.

We bridges storytelling and art like never before. With AI-powered enhancements and Leonardo AI, your stories evolve into stunning NFT art pieces. Dive into the world of TaleBlox, where narratives extend beyond words and art leaps off the canvas, all within a vibrant NFT storytelling community.

# Features

* **Story Crafting:** TaleBlox offers a user-friendly interface powered by state-of-the-art AI. Craft your stories effortlessly with creative prompts and intuitive editing tools.

* **NFT Art Generation:** Seamlessly create NFT artwork that complements your narratives. Our AI-driven image generation engine, powered by Leonardo AI, brings your stories to life with stunning visuals.

* **Author Rewards:** Incentivize writers by rewarding them with NFT tokens linked to their stories. This feature encourages content creation and community engagement.

* **Prompt Safety Checks:** Your safety is our priority. TaleBlox includes robust prompt safety checks, leveraging ChatGPT 3.5, to ensure a secure and enjoyable experience for all users.

# Architecture

* **Browser:** The browser is the user's entry point into TaleBlox. Users access the Dapp through their web browser, where they can interact with the frontend interface, create stories, generate NFT art, and engage with the platform's features.

* **Internet Identity:** Internet Identity serves as the secure authentication mechanism for TaleBlox. It ensures that users can sign in securely, protecting their data and interactions within the Dapp.

* **Frontend:** The frontend of TaleBlox is the user-facing interface. It provides an intuitive and interactive platform for users to craft stories, generate NFT art, and manage their interactions within the Dapp. The frontend communicates with the backend and interacts with the Internet Identity component to ensure a seamless user experience.

* **Canister:** The Canister of TaleBlox is built using Motoko. It handles user data, story creation, NFT minting, and author rewards. It acts as the bridge between the frontend and backend components, ensuring that user actions are processed securely and efficiently.

* **ChatGPT 3.5:** ChatGPT 3.5 plays a crucial role in ensuring the safety of user-generated prompts within TaleBlox. It performs HTTPS outcalls to check the prompts for safety, helping maintain a secure and respectful environment for all users.

* **Leonardo AI:** Leonardo AI is an integral component responsible for generating NFT art based on the stories created within TaleBlox. It utilizes advanced AI algorithms to transform textual narratives into visually stunning artworks, enhancing the storytelling experience.

# Local Installation

1. Clone the repository

First, you need to clone the repository

```
git clone 
```

2. Install Dependencies

Install the project's dependencies using Yarn:

```
yarn install
```

3. Start the Project

Once all the dependencies are installed, you can start the project:

```
yarn dev
```

The project should now be running on `http://localhost:3000`

# Usage

* Visit TaleBlox in your web browser and securely sign in using Internet Identity to access the platform.
* Click "Create Story" to start crafting your narratives. Utilize AI-enhanced prompts and editing tools to shape your stories.
* Explore the "Generate NFT Art" feature to automatically transform your stories into visually stunning NFT artworks, powered by Leonardo AI.
* To incentivize content creators, mint NFT tokens linked to their stories by selecting "Mint NFT." This process celebrates and rewards authors.
* Immerse yourself in the TaleBlox community, share your stories, collect NFTs, and celebrate the fusion of storytelling and art. Your creative journey begins here.

# Smart contract documentation 

# Troubleshooting 

# Contribution Guidelines

We welcome contributions from anyone who would like to help improve our dapp.

To contribute, please follow the following steps:

1. Fork the repository to your own GitHub account: 
2. Create a new branch from the main branch for your changes.
3. Make your changes and commit them with clear commit messages.
4. Push your changes to your forked repository.
5. Open a pull request to merge your changes into the main branch.

# Team Members

* Aigbe Destiny
* Kushal Sapra
* Chukwunonso Iwenor

# Acknowledgements

We would like to acknowledge the following individuals and resources for their contributions and support:
* **Internet Computer Protocol:** The foundation of TaleBlox relies on the Internet Computer Protocol (ICP), enabling the secure and decentralized nature of our Dapp.
* **OpenAI:** Our sincere thanks to OpenAI for the incredible GPT-3.5 model that powers the prompt safety checks and story generation in TaleBlox.
* **Leonardo AI:** We acknowledge Leonardo AI for its exceptional image generation capabilities, bringing our stories to life as stunning NFT art.
* **Our Community:** Last but not least, we'd like to express our appreciation to our vibrant TaleBlox community. Your feedback and engagement drive the continued growth and improvement of our platform.
