# cline-powerup

這個 repo 是給 Cline 用的強化包，提供可重用的 **Skills**、**Rules**、**Workflows**。

## 內容

- `Skills/`: 技能資料夾（每個技能至少有 `SKILL.md`）
- `Rules/`: 行為規則 / guardrails
- `Workflows/`: 可用 `/檔名.md` 觸發的流程腳本

## 新增：證據導向交付組合

本次新增以下內容，讓 Cline 以「實際程式執行結果」交付：

- `Skills/showboat-evidence-delivery/SKILL.md`
  - 用 Showboat 建立 `docs/demos/<task>-demo.md`，記錄真實命令與輸出。
- `Skills/rodney-web-evidence/SKILL.md`
  - Web 任務時用 Rodney 做瀏覽器驗證 + 截圖，並回填到 Showboat。
- `Workflows/evidence-driven-delivery.md`
  - 可直接用 `/evidence-driven-delivery.md` 啟動完整證據交付流程。

## 安裝（repo 作為來源）

### 1) 將 repo 放到 `~/Documents/Cline`

在 repo 的上一層目錄執行：

```sh
mv cline-powerup ~/Documents/Cline
```

若要保留原始 repo 可改用：

```sh
cp -R cline-powerup ~/Documents/Cline
```

### 2) 同步 Skills 到 `~/.cline/skills/`

```sh
mkdir -p ~/.cline/skills
cp -R ~/Documents/Cline/Skills/* ~/.cline/skills/
```

### 3) 同步 Workflows

若你已經把 repo 放在 `~/Documents/Cline`，`Workflows/*.md` 已在 Cline 全域 Workflows 目錄中，可直接使用。

若要同步到目前專案層級：

```sh
mkdir -p .clinerules/workflows
cp ~/Documents/Cline/Workflows/*.md .clinerules/workflows/
```

## 使用範例

1. 在任務中要求 Cline 產生可驗證交付（demo/proof/evidence）。
2. 直接執行：`/evidence-driven-delivery.md`
3. 根據流程提供 `TASK_SLUG`、驗證命令、是否 Web 任務等資訊。
4. 最終交付必須包含：`docs/demos/<task>-demo.md`

## 驗證

檢查新技能與 workflow 是否存在：

```sh
find ~/.cline/skills -maxdepth 2 -name SKILL.md -print | rg "showboat-evidence-delivery|rodney-web-evidence"
ls ~/Documents/Cline/Workflows | rg "evidence-driven-delivery.md"
```

## 注意

- 若目的端已有同名技能資料夾，`cp -R` 可能覆蓋內容，請先備份。
- `showboat` / `rodney` 預設以 `uvx showboat`、`uvx rodney` 方式執行（免全域安裝）。
- 本 repo 是 source of truth；建議在 repo 更新後再重新同步到 Cline 目錄。
