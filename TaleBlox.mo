import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import Array "mo:base/Array";

type Story = {
  id : Text;
  title : Text;
  initialAuthor : Principal;
  pageCount : Nat;
  pages : [Page];
  owner : Principal;
};

type Page = {
  id : Nat;
  author : Principal;
  prompt : Text;
  content : Text;
  image : Text;
};

type NFT = {
  storyIndex : Nat;
};

actor class TaleBlox() = this {
  var stories : [Story] = [];
  var nfts : [NFT] = [];

  // Helper function to update the story
  func updateStory(storyId : Text, updatedStory : Story) {
    stories := Array.map<Story, Story>(
      stories,
      func(story : Story) : Story {
        if (story.id == storyId) {
          return updatedStory;
        } else {
          return story;
        };
      },
    );
  };

  public func createStory(id : Text, title : Text, prompt : Text, content : Text, imageUrl : Text, metadataUrl : Text) : async () {
    let isImageMinted = await mintImageAsNFT(metadataUrl);
    if (isImageMinted) {
      let author = Principal.fromActor(this);
      let newStory : Story = {
        id = id;
        title = title;
        initialAuthor = author;
        pageCount = 1;
        pages = Array.tabulate<Page>(
          1,
          func(_ : Nat) : Page {
            {
              id = 1;
              author = author;
              prompt = prompt;
              content = content;
              image = imageUrl;
            };
          },
        );
        isNFTMinted = false;
        owner = author;
      };
      stories := Array.tabulate(
        Array.size(stories) + 1,
        func(i : Nat) : Story {
          if (i == Array.size(stories)) {
            return newStory;
          } else {
            return stories[i];
          };
        },
      );
    } else {
      Debug.print("An error occured while minting the NFT");
    };
  };

  public func contributeToStory(storyId : Text, prompt : Text, content : Text, imageUrl : Text, metadataUrl : Text) : async () {
    let author = Principal.fromActor(this);
    let existingStory = Array.find<Story>(stories, func(story : Story) : Bool { story.id == storyId });
    switch (existingStory) {
      case null {
        Debug.print("Story not found.");
        return;
      };
      case (?foundStory) {
        let isImageMinted = await mintImageAsNFT(metadataUrl);
        if (isImageMinted) {
          let newPage : Page = {
            id = Array.size(foundStory.pages);
            author = author;
            prompt = prompt;
            content = content;
            image = imageUrl;
          };
          let updatedPages = Array.tabulate(
            Array.size(foundStory.pages) + 1,
            func(i : Nat) : Page {
              if (i == Array.size(foundStory.pages)) {
                return newPage;
              } else {
                return foundStory.pages[i];
              };
            },
          );
          let updatedStory : Story = {
            id = foundStory.id;
            title = foundStory.title;
            initialAuthor = foundStory.initialAuthor;
            pageCount = foundStory.pageCount + 1;
            pages = updatedPages;
            owner = foundStory.owner;
          };
          updateStory(storyId, updatedStory);
        } else {
          Debug.print("An error occured while minting the NFT");
        };
      };
    };
  };

  private func mintImageAsNFT(metadataUrl : Text) : async Bool {
    // logic to mint NFT. All it should take in is the url
    // should return true if all went well, and false if it didn't
    return true;
  };

  public query func getAllStories() : async [Story] {
    return stories;
  };
};
