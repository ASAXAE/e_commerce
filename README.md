# e_commerce

A modern, cross-platform e-commerce application built with Flutter.
一款基于 Flutter 构建的现代化、跨平台电子商务应用程序。
Flutter で構築された、最新のクロスプラットフォーム電子商取引（EC）アプリケーション。

---

## 🌐 Language / 语言 / 言語

- [English](#-english)
- [简体中文](#-简体中文)
- [日本語](#-日本語)

---

## 🇺🇸 English

### Project Features
- **Multi-page Navigation**: Includes four core modules: Home, Category, Cart, and Profile.
- **Infinite Scrolling**: The home page features an infinite scroll mechanism using `ScrollController`, automatically loading more product recommendations as the user reaches the bottom.
- **Login System**: Complete authentication flow including:
  - Form validation using Regular Expressions (Regex).
  - Real-time feedback with `LoadingDialog` and `Toast`.
  - Secure token management and persistence.
- **State Management**: Uses **GetX** for reactive state management and dependency injection, ensuring high performance.
- **Network Requests**: Robust HTTP client based on **Dio** with interceptor support for token management and error handling.
- **Dynamic Carousel**: Integrated `carousel_slider` for high-quality banners and promotional areas on the home page.
- **Routing System**: Named routes management with support for dynamic parameters (e.g., product detail pages).
- **Local Storage**: Uses `shared_preferences` for persisting user authentication tokens and settings.

### Tech Stack
- **Framework**: [Flutter](https://flutter.dev/)
- **State & Routing**: [GetX](https://pub.dev/packages/get)
- **HTTP Client**: [Dio](https://pub.dev/packages/dio)
- **Local Storage**: [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **UI Components**: Cupertino Icons, Carousel Slider

### Quick Start
1. Ensure the **Flutter SDK** is installed on your machine.
2. Clone the repository: `git clone <repository-url>`
3. Install dependencies: `flutter pub get`
4. Run the application: `flutter run`

---

## 🇨🇳 简体中文

### 项目特点
- **多页面导航**: 包含首页、分类、购物车和个人中心四大核心模块。
- **无限滚动加载**: 首页集成无限滚动机制，通过监听 `ScrollController` 在用户接近底部时自动加载更多商品推荐，提升用户体验。
- **登录系统**: 完整的身份验证流程，包括：
  - 基于正则表达式（Regex）的表单校验。
  - 使用 `LoadingDialog` 和 `Toast` 提供实时交互反馈。
  - 完善的 Token 管理与持久化存储。
- **状态管理**: 使用 **GetX** 进行响应式状态管理和依赖注入，确保高性能运行。
- **网络请求**: 基于 **Dio** 封装的 HTTP 请求库，支持拦截器，方便处理 Token 和错误码。
- **动态轮播**: 首页集成 `carousel_slider` 实现精美的广告位和活动轮播。
- **路由系统**: 完善的命名路由管理，支持动态参数传递（如通过 ID 进入商品详情页）。
- **本地存储**: 使用 `shared_preferences` 持久化存储用户 Token 及个性化设置。

### 技术栈
- **框架**: [Flutter](https://flutter.dev/)
- **状态管理 & 路由**: [GetX](https://pub.dev/packages/get)
- **网络请求**: [Dio](https://pub.dev/packages/dio)
- **本地存储**: [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **UI 组件**: Cupertino Icons, Carousel Slider

### 快速开始
1. 确保您的开发环境已安装 **Flutter SDK**。
2. 克隆仓库：`git clone <repository-url>`
3. 安装依赖：`flutter pub get`
4. 启动应用：`flutter run`

---

## 🇯🇵 日本語

### プロジェクトの特徴
- **マルチページナビゲーション**: ホーム、カテゴリ、カート、マイページの4つの主要モジュールを搭載。
- **無限スクロール**: ホーム画面に無限スクロール機能を実装。`ScrollController` を監視し、下部に到達すると自動的に商品レコメンドを読み込みます。
- **ログインシステム**: 以下を含む完全な認証フロー：
  - 正規表現（Regex）によるフォームバリデーション。
  - `LoadingDialog` や `Toast` を使用したリアルタイムなフィードバック。
  - トークン管理と永続化。
- **状態管理**: **GetX** を使用したリアクティブな状態管理と依存性の注入により、スムーズな動作を実現。
- **ネットワーク通信**: **Dio** をベースにした HTTP リクエストライブラリ。トークン管理やエラー処理のためのインターセプターをサポート。
- **ダイナミックカルーセル**: `carousel_slider` を統合し、ホーム画面に高品質なバナーを表示。
- **ルーティングシステム**: 名前付きルートによる管理。商品詳細ページなどの動的パラメータに対応。
- **ローカルストレージ**: `shared_preferences` を使用して、ユーザートークンや設定を永続化。

### 技術スタック
- **フレームワーク**: [Flutter](https://flutter.dev/)
- **状態管理 & ルーティング**: [GetX](https://pub.dev/packages/get)
- **ネットワーク**: [Dio](https://pub.dev/packages/dio)
- **ローカルストレージ**: [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **UI コンポーネント**: Cupertino Icons, Carousel Slider

### クイックスタート
1. **Flutter SDK** がインストールされていることを確認してください。
2. リポジトリをクローンします: `git clone <repository-url>`
3. 依存関係をインストールします: `flutter pub get`
4. アプリを起動します: `flutter run`
