# Optional: Justfile
# Frequent script sets for common workflows
set dotenv-load
cloudflare-pages-project-name := "napatsc"

build:
  @rm -rf public
  @hugo build --minify
  # @find public -type f -name "*.html" | wc -l | xargs -I{} echo "Signing {} HTMLs"
  # @find public -type f -name "*.html" | xargs -I{} gpg --armor --detach-sign {}
  bunx pagefind --site public

demo:
  @hugo serve

deploy:
  @wrangler pages deploy "public/" --project-name {{cloudflare-pages-project-name}}
