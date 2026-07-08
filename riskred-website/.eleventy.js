module.exports = function (eleventyConfig) {
  // Copy static assets straight through to the output folder
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/images");
  eleventyConfig.addPassthroughCopy("src/files");

  // Collection of nav pages, ordered
  eleventyConfig.addCollection("nav", function (collectionApi) {
    return collectionApi.getFilteredByGlob("src/pages/**/*.md")
      .filter((item) => item.data.navOrder !== undefined)
      .sort((a, b) => a.data.navOrder - b.data.navOrder);
  });

  return {
    dir: {
      input: "src",
      includes: "_includes",
      data: "_data",
      output: "_site"
    },
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk"
  };
};
