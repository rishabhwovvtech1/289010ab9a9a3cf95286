module Api
  class DepartmentSerializer < ActiveModel::Serializer
    attributes :id, :name, :status, :image

    def image
      if object.name=="Electrical Supply"
          return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjFhRAAOoDjzsthGsPngrYoO2bj03L6iZOPmf0_B1W0DfkFW1F"
      elsif object.name == "Water Internal"
          return "https://tiptonutility.com/files_uploaded/water-faucet_2.png"
      elsif object.name == "Plumbing"
          return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScEiON1aQF12iWtgZiI0eyOYjw9sVeUPX3XGPsTz_xwzj9Rp42"
      elsif object.name == "Electric External"
          return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjQErpVCfGT7UcRLoS74e06TmpvftFJqgNVNbiqN8lHzPNaUsd"
      elsif object.name == "Sewage"
          return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9jKw82rdRjGMD14nrfNUV-sk2-41mCl9_aTtx-2AWGyQ5QPoS"
      elsif object.name == "Mason"
          return "https://c8.alamy.com/comp/PK9KW9/mascot-illustration-of-a-black-african-american-bricklayer-or-mason-laying-bricks-to-construct-brickwork-masonry-set-inside-circle-on-isolated-white-PK9KW9.jpg"
      elsif object.name == "Joinery"
          return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZKe6mYlNFQSgCQm3lg7X0DjYn6KMfMtX432jMsfyCI_sxLjSAdQ"
      elsif object.name == "Water External"
          return "https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/3606939/300/200/m1/fpnw/wm0/pwnzvizixtxrww1wot6cgbezdalebmv95jdfawebyu8183jzv1j5dkrejjzdoyem-.jpg?1511185718&s=56e16d0c35c467460fb8b0255c95cf07"
      end
    end
  end
end
