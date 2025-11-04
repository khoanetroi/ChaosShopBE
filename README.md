# ChaosShop Backend API

Complete RESTful API for ChaosShop E-commerce platform built with Express.js, TypeScript, and MySQL.

## 🚀 Features

- ✅ **Authentication & Authorization** - JWT-based auth with role management
- ✅ **Product Management** - Full CRUD with variants, images, categories
- ✅ **Shopping Cart** - Add, update, remove items
- ✅ **Order Management** - Create orders, track status, order history
- ✅ **User Management** - Registration, login, profile
- ✅ **Database Integration** - MySQL with connection pooling
- ✅ **Security** - Helmet, CORS, bcrypt password hashing
- ✅ **TypeScript** - Full type safety
- ✅ **Error Handling** - Centralized error handling

## 📋 Prerequisites

- Node.js (v18 or higher)
- MySQL (v8 or higher)
- npm or yarn

## 🛠️ Installation

### 1. Install Dependencies

```bash
npm install
```

### 2. Setup Database

```bash
# Create database
mysql -u root -p < database/schema.sql

# Insert sample data
mysql -u root -p < database/init_data.sql
```

### 3. Configure Environment

Copy `.env.example` to `.env` and update with your settings:

```bash
cp .env.example .env
```

Update the following in `.env`:
- `DB_PASSWORD` - Your MySQL password
- `JWT_SECRET` - Your JWT secret key
- `REFRESH_TOKEN_SECRET` - Your refresh token secret

### 4. Run the Server

```bash
# Development mode with hot reload
npm run dev

# Production build
npm run build
npm start
```

Server will start on `http://localhost:3000`

## 📚 API Endpoints

### Authentication

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/auth/register` | Register new user | No |
| POST | `/api/auth/login` | Login user | No |
| GET | `/api/auth/profile` | Get user profile | Yes |

### Products

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/products` | Get all products (with filters) | No |
| GET | `/api/products/featured` | Get featured products | No |
| GET | `/api/products/:id` | Get product by ID | No |

### Categories

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/categories` | Get all categories | No |

### Cart

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/cart` | Get user's cart | Yes |
| POST | `/api/cart/add` | Add item to cart | Yes |
| PUT | `/api/cart/item/:id` | Update cart item quantity | Yes |
| DELETE | `/api/cart/item/:id` | Remove item from cart | Yes |
| DELETE | `/api/cart/clear` | Clear cart | Yes |

### Orders

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/orders/create` | Create new order | Yes |
| GET | `/api/orders` | Get user's orders | Yes |
| GET | `/api/orders/:id` | Get order details | Yes |

## 🔐 Authentication

The API uses JWT (JSON Web Tokens) for authentication. Include the token in the Authorization header:

```
Authorization: Bearer <your_token>
```

## 📝 Request Examples

### Register User

```bash
POST /api/auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123",
  "full_name": "John Doe",
  "phone": "0123456789"
}
```

### Login

```bash
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123"
}
```

### Get Products

```bash
GET /api/products?page=1&limit=12&category=electronics&minPrice=100&maxPrice=1000
```

### Add to Cart

```bash
POST /api/cart/add
Authorization: Bearer <token>
Content-Type: application/json

{
  "variant_id": 1,
  "quantity": 2
}
```

### Create Order

```bash
POST /api/orders/create
Authorization: Bearer <token>
Content-Type: application/json

{
  "recipient_name": "John Doe",
  "recipient_phone": "0123456789",
  "shipping_address": "123 Main St",
  "district": "District 1",
  "city": "Ho Chi Minh",
  "payment_method": "cod",
  "customer_note": "Please call before delivery"
}
```

## 🗄️ Database Schema

The database includes the following main tables:

- `users` - User accounts and authentication
- `products` - Product information
- `product_variants` - Product variations (size, color, etc.)
- `categories` - Product categories
- `carts` & `cart_items` - Shopping cart
- `orders` & `order_items` - Order management
- `brands` - Product brands

See `database/DATABASE_DOCUMENTATION.md` for complete schema documentation.

## 🔧 Project Structure

```
BackEnd/
├── src/
│   ├── config/          # Configuration files
│   │   ├── database.ts  # Database connection
│   │   └── config.ts    # App configuration
│   ├── controllers/     # Request handlers
│   │   ├── auth.controller.ts
│   │   ├── product.controller.ts
│   │   ├── cart.controller.ts
│   │   └── order.controller.ts
│   ├── middleware/      # Custom middleware
│   │   └── auth.middleware.ts
│   ├── routes/          # API routes
│   │   ├── auth.routes.ts
│   │   ├── product.routes.ts
│   │   ├── cart.routes.ts
│   │   └── order.routes.ts
│   ├── types/           # TypeScript types
│   │   └── index.ts
│   └── server.ts        # Entry point
├── database/            # Database files
│   ├── schema.sql
│   └── init_data.sql
├── .env                 # Environment variables
├── package.json
└── tsconfig.json
```

## 🧪 Testing

Test the API using tools like:
- Postman
- Thunder Client (VS Code extension)
- curl

## 🚀 Deployment

### Production Build

```bash
npm run build
npm start
```

### Environment Variables for Production

Make sure to set secure values for:
- `JWT_SECRET`
- `REFRESH_TOKEN_SECRET`
- `DB_PASSWORD`
- `NODE_ENV=production`

## 📄 License

MIT

## 👥 Team

ChaosShop Development Team
