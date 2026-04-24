# furcht968-flake
個人的flake

## 更新
リポジトリフォルダで
```
sudo nixos-rebuild switch --flake .#nixos
```

## 導入
`hardware-configuration.nix`を移行
```
sudo nixos-generate-config --show-config > ./host/hardware-configuration.nix
```

ブートをリビルド
```
sudo nixos-rebuild boot --flake .#nixos
```

終了し、**GRUBから**起動した後、リポジトリフォルダで
```
sudo nixos-rebuild switch --flake .#nixos
```
