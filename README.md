Pages
========================
A simple rails service for CRUDing a Page.


 total_words_page GET    /api/pages/:id/total_words(.:format) pages#total_words
     publish_page POST   /api/pages/:id/publish(.:format)     pages#publish
  published_pages GET    /api/pages/published(.:format)       pages#published
unpublished_pages GET    /api/pages/unpublished(.:format)     pages#unpublished
            pages GET    /api/pages(.:format)                 pages#index
                  POST   /api/pages(.:format)                 pages#create
         new_page GET    /api/pages/new(.:format)             pages#new
        edit_page GET    /api/pages/:id/edit(.:format)        pages#edit
             page GET    /api/pages/:id(.:format)             pages#show
                  PUT    /api/pages/:id(.:format)             pages#update
                  DELETE /api/pages/:id(.:format)             pages#destroy

