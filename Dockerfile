FROM node:18-alpine

COPY . /app
WORKDIR /app

RUN corepack enable && corepack prepare pnpm@10.18.0 --activate

# Install dependencies for the entire workspace from root
RUN pnpm install --force

# Then work in the specific theme
ARG THEME=enterprise
WORKDIR /app/packages/blog-starter-kit/themes/${THEME}

ARG NEXT_PUBLIC_HASHNODE_GQL_ENDPOINT=https://gql.hashnode.com
ENV NEXT_PUBLIC_HASHNODE_GQL_ENDPOINT=$NEXT_PUBLIC_HASHNODE_GQL_ENDPOINT

ARG NEXT_PUBLIC_HASHNODE_PUBLICATION_HOST
ENV NEXT_PUBLIC_HASHNODE_PUBLICATION_HOST=$NEXT_PUBLIC_HASHNODE_PUBLICATION_HOST

RUN pnpm build
EXPOSE 3000
CMD ["pnpm", "start"]