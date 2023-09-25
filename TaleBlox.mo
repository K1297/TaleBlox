import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Principal "mo:base/Principal";

actor class TaleBlox() = this {
  type Story = {
    id : Text;
    title : Text;
    summary : Text;
    characterDescription : Text;
    characterBackground : Text;
    imageModel : Text;
    imageStyle : Text;
    initialAuthor : Principal;
    pageCount : Nat;
    pages : [Page];
    owner : Principal;
  };

  type Page = {
    id : Nat;
    title: Text;
    author : Principal;
    prompt : Text;
    content : Text;
    image : Text;
  };

  type NFT = {
    storyIndex : Nat;
  };

  // let Author = Authors.Author;
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

  public func createStory(
    id : Text,
    title : Text,
    prompt : Text,
    content : Text,
    imageUrl : Text,
    summary : Text,
    characterDescription : Text,
    characterBackground : Text,
    imageModel : Text,
    imageStyle : Text,
    pageTitle: Text,
    metadataUrl : Text,
  ) : async () {
    let isImageMinted = await mintImageAsNFT(metadataUrl);
    if (isImageMinted) {
      let author = Principal.fromActor(this);
      let newStory : Story = {
        id = id;
        title = title;
        initialAuthor = author;
        pageCount = 1;
        summary = summary;
        characterDescription = characterDescription;
        characterBackground = characterBackground;
        imageModel = imageModel;
        imageStyle = imageStyle;
        pages = Array.tabulate<Page>(
          1,
          func(_ : Nat) : Page {
            {
              id = 1;
              title = pageTitle;
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

  public func contributeToStory(
    storyId : Text,
    prompt : Text,
    summary : Text,
    content : Text,
    pageTitle: Text,
    imageUrl : Text,
    metadataUrl : Text,
  ) : async () {
    let author = Principal.fromActor(this);
    let existingStory = Array.find<Story>(
      stories,
      func(story : Story) : Bool { story.id == storyId },
    );
    switch (existingStory) {
      case null {
        Debug.print("Story not found.");
        return;
      };
      case (?foundStory) {
        let isImageMinted = await mintImageAsNFT(metadataUrl);
        if (isImageMinted) {
          let newPage : Page = {
            id = Array.size(foundStory.pages) + 1;
            author = author;
            prompt = prompt;
            content = content;
            image = imageUrl;
            title = pageTitle;
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
            summary = summary;
            initialAuthor = foundStory.initialAuthor;
            pageCount = foundStory.pageCount + 1;
            pages = updatedPages;
            owner = foundStory.owner;
            characterDescription = foundStory.characterDescription;
            characterBackground = foundStory.characterBackground;
            imageModel = foundStory.imageModel;
            imageStyle = foundStory.imageStyle;
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
