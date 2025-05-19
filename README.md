# Vydala Gromada

Ruby on Rails project. Below are the steps to set up the environment for development or server deployment (Ubuntu 22.04+).

---

## ⚙️ Dependencies

Make sure the following packages are installed:

```bash
sudo apt update && sudo apt install -y \
  curl gnupg2 build-essential gpg \
  libpq-dev libssl-dev libreadline-dev zlib1g-dev \
  libyaml-dev libffi-dev libgdbm-dev autoconf bison \
  libncurses5-dev libtool libgmp-dev libdb-dev
```

---

## 💎 Install Ruby (via RVM)

```bash
# Import RVM keys
gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys \
  409B6B1796C275462A1703113804BB82D39DC0E3 \
  7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable

# Load RVM
source ~/.rvm/scripts/rvm

# Install Ruby
rvm reinstall 3.3.4 --with-openssl-dir=/usr
```

---

## 📦 Rails and Gems

```bash
gem install rails
bundle install
```

---

## 🐘 PostgreSQL

```bash
sudo apt install -y postgresql postgresql-contrib \
  postgresql-client postgresql-client-common
```

### Create database role:

```bash
sudo -u postgres psql
```

Inside `psql`:
```sql
CREATE ROLE myuser WITH LOGIN PASSWORD '12345678';
ALTER USER myuser WITH SUPERUSER;
```

---

## 🖼️ Image processing

```bash
# Using Homebrew (if installed):
brew install vips

# Or via apt:
sudo apt install -y imagemagick libvips
```

---

## 🚀 Run the Project

```bash
rails db:drop db:create db:migrate
rails s
```

### For testing and development:
```bash
rails db:seed
```

---

## ✉️ Mailcatcher

For local mail testing:
```bash
gem install mailcatcher
mailcatcher
```

Mail will be available at: [http://localhost:1080](http://localhost:1080)

---

## 🌐 Production

In `config/environments/production.rb`, replace `example.com` with your domain:

```ruby
config.hosts << "your-domain.com"
```

---

## 📎 Apache + Passenger (optional)

See the dedicated section in the documentation: [Apache Deployment](#apache--passenger-deployment)

---

## 📄 License

This project is MIT-licensed.
