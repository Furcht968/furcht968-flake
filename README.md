# furcht968-flake
個人的flake

## 更新
リポジトリフォルダで
```
sudo nixos-rebuild switch --flake .#nixos
```

## 導入
リポジトリフォルダで`hardware-configuration.nix`を移行
```
sudo nixos-generate-config --show-config > ./host/hardware-configuration.nix
```

リビルド(次回起動時に適用)
```
sudo nixos-rebuild boot --flake .#nixos
```

システムを終了し、**GRUBから**起動した後、再度リポジトリフォルダで
```
sudo nixos-rebuild switch --flake .#nixos
```
