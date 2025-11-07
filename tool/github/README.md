# GitHub

## リリース
### 最新リリースのアセットの取得方法
GitHubでは最新リリースのアセットに直接アクセスできるURLが用意されている。

* 最新リリースのアセットへのリンク
    * `https://github.com/{owner}/{repo}/releases/latest/download/{asset-name}`

参考: https://docs.github.com/ja/repositories/releasing-projects-on-github/linking-to-releases

## 通知
### 通知を既読にする方法
GitHub APIを使用して通知を既読にすることができる。

```bash
curl -L \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR_TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/notifications
```

参考: https://docs.github.com/ja/rest/activity/notifications?apiVersion=2022-11-28#mark-notifications-as-read
